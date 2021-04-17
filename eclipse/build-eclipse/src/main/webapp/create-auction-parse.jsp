<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>CS 336: Create Auction</title>
</head>

<body style='font-family: sans-serif'>
	<a href='my-auctions.jsp'>Back</a>
	<hr><br>
	
	<%
	try {
	
	/* Parse and validate data */
		
	// item (model_name), exp_date, start_price, hidden_price, buyout_price, min_incr
	String itemName = request.getParameter("item");					// mandatory
	String expireDate = request.getParameter("exp_date");			// mandatory
	String expireTime = request.getParameter("exp_time");			// optional
	String startPrice = request.getParameter("start_price");		// mandatory
	String hiddenPrice = request.getParameter("hidden_price");		// optional
	String buyoutPrice = request.getParameter("buyout_price");		// optional
	String minIncrement = request.getParameter("min_incr");			// optional
	
	// "item": "" means no item selected
	Date test = new Date();
	
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String qry;

	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>