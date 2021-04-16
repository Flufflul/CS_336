<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>CS 336: My Auctions</title>
</head>

<body>
	<!-- 
		Goals:
		> List all 'auctions' (not bids) hosted by user
		> Link to each auction
	 -->
	
	<%
		try {
			// Connect to DB
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			// Get session info
			String uid = (String) session.getAttribute("user");
			
			// Query for auctions by user
			String qry = "SELECT * FROM makes_auction ma INNER JOIN items it on it.item_id = ma.item_id WHERE seller_id = '" + uid + "'";
			ResultSet res = stmt.executeQuery(qry);
			
			// Process auctions as options
			out.print("<ul>");
			while (res.next()) {
				//int iid = res.getInt("item_id");
				String itemName = res.getString("model_name");
				out.print("<li>"+itemName+"</li>");
			}
			out.print("</ul>");
			
			db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>

</body>

</html>