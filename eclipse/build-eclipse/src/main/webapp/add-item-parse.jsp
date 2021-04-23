<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>CS 336: Add item parse</title>
</head>

<body>
<%
try {
	
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	PreparedStatement stmt = null;
	
	/*
		items:						electric_guitar:			acoustic_guitar:			acoustic_electric_guitar:
			item_id (int, auto),		item_id (int),				item_id (int),				item_id (int),
			model_name (varchar),		pickup_config (varchar)		is_classical (bool, 0/1)	pickup_type (varchar),
			manufacturer (varchar),																includes_tuner (bool, 0/1)
			num_Strings	(int)		
	*/
	
	/* First, create item */

	// Prepare query
	String qry = "INSERT INTO items VALUES (?,?,?,?)";
	stmt = con.prepareStatement(qry);
	boolean failed = false;

	//1 item_id (R)		-> int null
	stmt.setNull(1, Types.INTEGER);
	
	//2 model_name (R)	-> request from previous page
	String qry_modelName = request.getParameter("input_modelName");
	session.setAttribute("modelNameFail", false);
	
	if (qry_modelName.equals("")) {
		failed = true;
		session.setAttribute("modelNameFail", true);
	}
	
	stmt.setString(2, qry_modelName);
	
	//3 manufacturer (R)-> request from previous page
	String qry_manufacturer = request.getParameter("input_manufacturer");
	session.setAttribute("manufacturerFail", false);
	
	if (qry_manufacturer.equals("")) {
		failed = true;
		session.setAttribute("manufacturerFail", true);
	}
	
	stmt.setString(3, qry_manufacturer);

	//4 num_Strings (R)	-> request from previous page
	String qry_numStrings = request.getParameter("input_numStrings");
	session.setAttribute("numStringsFail", false);
	
	if (qry_numStrings.equals("")) {
		failed = true;
		session.setAttribute("numStringsFail", true);
	}
	
	stmt.setString(4, qry_numStrings);
	
	// Check for failure
	if (failed) { response.sendRedirect("add-item.jsp"); }
	
	
	/* Second, determine isa */
	Statement stmt2 = con.createStatement();

	String qryInsert = "INSERT INTO ";
	String qryTable  = "";
	String qryValues = " VALUES ";
	String qryParams = "";
	
	String ac = request.getParameter("submit_ac");		out.print(ac+"<br>");
	String el = request.getParameter("submit_el");		out.print(el+"<br>");
	String acel = request.getParameter("submit_acel");	out.print(acel);
	
	
	if (!ac.equals(null)) { // Parse acoustic if so
		out.print("here1");
		qryTable += "acoustic_guitar";
		
		String pickupConfig = request.getParameter("input_acPickupConfig");
		if (pickupConfig.equals("")) {
			failed = true;
			session.setAttribute("acPickupConfigFail", true);
		}
		
		qryParams += "('"+pickupConfig+"')";
	} out.print("if1");
	if (!el.equals(null)) { // Parse electric if so
		out.print("here2");
		qryTable += "electric_guitar";
		
		String isClassical = request.getParameter("input_elIsClassical");
		if (isClassical.equals("")) {
			failed = true;
			session.setAttribute("elIsClassicalFail", true);
		}
		
		qryParams += "("+isClassical+")";
	} out.print("if2");
	if (!acel.equals(null)) { // Parse acoustic-electric if so
//		out.print("here3");
		qryTable += "acoustic_electric_guitar";

		String pickupConfig = request.getParameter("input_acelPickupConfig");
		if (pickupConfig.equals("")) {
			failed = true;
			session.setAttribute("acelPickupConfig", true);
		}

		qryParams += "('"+pickupConfig+"',";

		String includesTuner = request.getParameter("input_acelIncTuner");
		if (includesTuner.equals("")) {
			failed = true;
			session.setAttribute("acelPickupConfig", true);
		}

		qryParams += includesTuner+")";
	} out.print("if3");
	
	// Otherwise fail
	//else { response.sendRedirect("add-item.jsp"); }
	
	
	out.print(qryInsert+qryTable+qryValues+qryParams);

	
	// Close DB connection for stability
	db.closeConnection(con);
} 
catch (Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>