<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>CS 336: My Auctions</title>

<%
// Connect to DB
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();

// Get session info
String user = (String) session.getAttribute("user");

// Set relevant session info
session.setAttribute("selectFail", false);
%>

</head>

<body style='font-family: sans-serif'>
<a href='profile.jsp'>Back</a>
<hr><br>

	<!-- 
		Goals:
		> List all 'auctions' (not bids) hosted by user
		> Link to each auction
	 -->
	<h1><a href='make-bid.jsp'>Make bid</a></h1>
	
	<table style="width:20vw; ">
		<tr style="text-align: left">
			<th>Auction</th>
			<th>Item</th>
			<th>Your bid</th>
		</tr>
		<%
		try {
			// Retrieve all auctions that user has made a bid on
			String qry =	"SELECT a.auction_id, i.model_name, m.bid "+
							"FROM makes_bid m "+
							"INNER JOIN auctions a ON m.auction_id = a.auction_id "+
							"INNER JOIN items i ON a.item_id = i.item_id "+
							"WHERE buyer_id = '"+user+"' "+
							"GROUP BY a.auction_id ";
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(qry);
			
			// List results
			while (res.next()) {
				out.print("<tr>");
				
				int auctionID = res.getInt("auction_id");
				String modelName = res.getString("model_name");
				float bid = res.getFloat("bid");
				
				out.print(	"<td>"+auctionID+"</td>"+
							"<td>"+modelName+"</td>"+
							"<td>"+bid+"</td>");
				
				out.print("</tr>");
			}
			
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
	<br>
	
	
	<h1><a href='create-auction.jsp'>Create auction</a></h1>
	
	<table style="width:20vw; ">
		<tr style="text-align: left">
			<th>Your auction</th>
			<th>Item</th>
			<th>Top bid</th>
		</tr>
		
		<%
		try {
			// Retrieve all auctions that user owns
			String qry = 	"SELECT a.auction_id, i.model_name, a.highest_current_bid "+
							"FROM auctions a "+
							"INNER JOIN items i ON a.item_id = i.item_id "+
							"WHERE seller_id = '"+user+"' ";
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(qry);
			
			// List results
			while (res.next()) {
				out.print("<tr>");
				
				int auctionID = res.getInt("auction_id");
				String modelName = res.getString("model_name");
				float topBid = res.getFloat("highest_current_bid");
				
				out.print(	"<td>"+auctionID+"</td>"+
							"<td>"+modelName+"</td>"+
							"<td>"+topBid+"</td>");
				
				out.print("</tr>");
			}
			
			stmt.close();		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>

<% db.closeConnection(con); %>
</body>

</html>