<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login Check</title>
</head>
<body>
	<a href="register-page.jsp">Return to register</a>
	<hr><br>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement(); 
			String id = request.getParameter("username"); 
            String pw = request.getParameter("password"); 
            out.println("<p>After POST. id: " + id + ", pw: " + pw + "</p>");
			String str = "SELECT * FROM users WHERE username = '"+ id +"'";
            out.println("<p>Query: " + str + "</p>");
			ResultSet accounts = stmt.executeQuery(str);
            out.println("<p>Executed query</p>");

            out.print("<h1>");
            if (!accounts.next()) {
            	String newAcc = "INSERT INTO users (username, password) VALUES ('"+ id +"','"+ pw +"');";
            	stmt.executeUpdate(newAcc);
            	out.println("Account registered!");
            }
            else {
            	out.println("Account already exists.");
            }
            out.print("</h1>");
            
			//close the connection.
			con.close();

		} catch (Exception e) {
            out.print(e);
		}
	%>
</body>
</html>