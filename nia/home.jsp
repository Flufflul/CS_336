<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CS 336: Home</title>
</head>
<body>
	<h1>
	Welcome User UID = <%=session.getAttribute("uid")%> <br>
	</h1>

	<a href = "logout.jsp"> Log Out </a>
</body>
</html>