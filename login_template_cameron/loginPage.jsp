<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>BuyMe Auctions</title>
	</head>
	
	
	<body>
	
	<h1>Welcome to BuyMe Auctions</h2>
	
	<!---login--->
	Sign in
	<form method = "post" action= ""> <!---set action = execute login script--->
		<table>
			<tr>
			<td>B</td><td><input type="text" name="username"></td>
			</tr>
		
			<tr>
			<td>Password</td><td><input type="text" name="password"></td>
			</tr>
		</table>
	<input type="submit" value="login">
	</form>
	
	<br>
	<br>
	<br>
	
	<!---create--->
	Click to create account
	<form method = "post" action=""> <!---set action = create account script--->
		<table>
			<tr>
			<td>Username</td><td><input type="text" name="username"></td>
			</tr>
		
			<tr>
			<td>Password</td><td><input type="text" name="password"></td>
			</tr>
			
			<tr>
			<td>Retype Password</td><td><input type="text" name="passwordRetyped"></td>
			</tr>
		</table>
	<input type="submit" value="login">
	</form>
	</body>


</html>