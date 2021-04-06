<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title> Customer Support </title>
<h1>Customer Support</h1>

</head>

<body>
	<!---<a href='logout.jsp'>Logout</a>--->
	<hr><br>
	<p>Need help? Contact customer support</p>
	
	<form method = "post" action = "sendHelpTicket.jsp" id="helpForm"> <!---send help ticket--->
		<tr>
		<td>Username: </td><td><input type="text" name="username"></td>
		</tr>
		
		<tr>
		<td>Email address: </td><td><input type="text" name="emailAddr"></td>
		</tr>
		
		<br>
		<textarea rows="5" cols="51" name="reason" form="helpForm">
		Enter detail here
		</textarea>
	<input type = "submit" value = "Create Rep Account">
	</form>
	
	
</body>
</html>