<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
	<form action = "resetpassword.jsp" method = "post">
		<table>
			<tr>
				<td><b>Username:</b></td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td><b>New Password:</b></td>
				<td><input type="text" name="new_password"></td>
			</tr>
			<tr>
				<td><b>Confirm Password:</b></td>
				<td><input type="text" name="confirm_password"></td>
			</tr>
		</table>
		<input type="submit" value="Reset Password">
	</form>
</body>
</html>