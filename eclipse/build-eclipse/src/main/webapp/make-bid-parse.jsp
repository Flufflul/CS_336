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
	%>
	
</head>



<body style='font-family: sans-serif'>

	<a href='make-bid.jsp'>Back</a>
	<hr><br>
	
	
	

<% db.closeConnection(con); %>
</body>
</html>