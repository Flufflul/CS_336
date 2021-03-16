<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Hi Beer World</title>
</head>
	
<body>
	
	<a href="index.html">Back</a>

	<div class="login-widget">
		<h1>Login</h1>
		<form method="POST" action="login.jsp">
			<table>
				<tr>
					<td><b>Username:</b></td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><b>Password:</b></td>
					<td><input type="password" name="pw"></td>
				</tr>
			</table>
			<input type="submit" value="Sign in">
		</form>
	</div>

	<br><br>
	
</body>
</html>