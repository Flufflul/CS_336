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

<body>
<%
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String qry;
	
	// Get session info
	String uid = (String) session.getAttribute("user");
	
	/* Details necessary to set an auction */
	
	// List of all items
	qry = "SELECT * FROM items";
	ResultSet items = stmt.executeQuery(qry);
	
	out.print("<label for='items'>Choose an item</label>");
	out.print("<select name='items' id='items'>");
	while (items.next()) {
		String itemName = items.getString("model_name");
		out.print("<option value='"+itemName+"'>"+itemName+"</option>");
	}
	out.print("</select>");
	
	
	db.closeConnection(con);
%>
</body>

</html>