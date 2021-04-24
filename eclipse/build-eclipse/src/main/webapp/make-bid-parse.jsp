<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>CS 336: Make bid</title>
	
	<%
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Boolean failed = false;
	%>
	
</head>



<body style='font-family: sans-serif'>

	<a href='make-bid.jsp'>Back</a>
	<hr><br>
	
	<%
	/* GOAL: Parse bid info and insert into makes_bid table */
	String strBid = request.getParameter("newBid");
	
	if (strBid.equals("")) {
		failed = true;
		session.setAttribute("bidFail", true);
		response.sendRedirect("make-bid-details.jsp");
	}
	else {
		float bid = Float.parseFloat(strBid);
		
		Statement stmt = con.createStatement();
		String qry;
		
	}
	
	
	%>
	
<% db.closeConnection(con); %>
</body>
</html>











