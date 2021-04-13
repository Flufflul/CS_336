<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CS 336: Login</title>
</head>
<body>
	<a href="login.jsp">Return to login</a>
	<hr><br>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement(); 
			String id = request.getParameter("username"); 
            String pw = request.getParameter("password"); 
            // out.println("<p>After POST. id: " + id + ", pw: " + pw + "</p>");
			String str = "SELECT * FROM Users WHERE username = '"+ id +"'";
            // out.println("<p>Query: " + str + "</p>");
			ResultSet accounts = stmt.executeQuery(str);
            // out.println("<p>Executed query</p>");

            out.print("<h1>");
            if (!accounts.next()) { out.println("No such account."); }
            else if (accounts.getString("password").equals(pw)) { 
            	session.setAttribute("user", id);
            	
            	String uid = accounts.getString("username");
            	session.setAttribute("user_id", uid);
            
            	String qry = "SELECT * FROM admin_staff WHERE admin_name = '"+ uid + "'";
            	ResultSet temp = stmt.executeQuery(qry);
            	if (temp.next()) { 
            		session.setAttribute("priv", "admin_staff");
            	}
            	
            	qry = "SELECT * FROM customer_rep WHERE rep_name = '"+ uid + "'";
            	temp = stmt.executeQuery(qry);
            	if (temp.next()) {
            		session.setAttribute("priv", "customer_rep");
            	}
            	
            	if (session.getAttribute("priv") == null) { 
            		session.setAttribute("priv", "end_user"); 
            	}
            	
            	out.print("Welcome, " + id);
            	
            	response.sendRedirect("profile.jsp"); 
            	}
            else { out.println("Incorrect password."); }
            out.print("</h1>");
            
			//close the connection.
			con.close();

		} catch (Exception e) {
            out.print(e);
		}
	%>
</body>
</html>
