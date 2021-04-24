<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>CS 336: All auctions</title>
	
	<%
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	%>

	
</head>



<body style='font-family: sans-serif'>

	<a href='make-bid.jsp'>Back</a>
	<hr><br>
	
	<%
	/* Pull required auction & item info */
	// Retrieve selected auction
	int auctionID = Integer.parseInt(request.getParameter("auctions"));
	
	// Retrieve all info on auction
	Statement stmt = con.createStatement();
	String qry_fragment = 	"SELECT a.seller_id, a.expires, a.starting_price, a.buy_now_price, a.min_increment, highest_current_bid, i.model_name, i.manufacturer, i.num_Strings, g.* "+
							"FROM auctions a "+
							"INNER JOIN items i ON a.item_id = i.item_id ";
	String qry_this =	"WHERE a.auction_id = "+auctionID;
	
	// Retrieved info of isa based on item in auction
	String qry_eg =	"INNER JOIN electric_guitar g ON a.item_id = g.item_id ";
	ResultSet res = stmt.executeQuery(qry_fragment + qry_eg + qry_this);
	if (!res.next()) {
		String qry_ag = "INNER JOIN acoustic_guitar g ON a.item_id = g.item_id ";
		res = stmt.executeQuery(qry_fragment + qry_ag + qry_this);
		if (!res.next()) {
			String qry_aeg = "INNER JOIN acoustic_electric_guitar g ON a.item_id = g.item_id ";
			res = stmt.executeQuery(qry_fragment + qry_aeg + qry_this);
		}
	}
	
	// List info of auction
	String itemName = res.getString("model_name");
	out.print("<h1>"+itemName+"</h1>");							// Item name
	
	String sellerName = res.getString("seller_id");
	out.print("<h2>auctioned by "+sellerName+"</h2>");			// By seller
	
	
	out.print("<table>");
	
	java.sql.Timestamp expires = res.getTimestamp("expires");	// Auction expiration date
	out.print("<tr><td>Auction expires on</td><td>"+expires+"</td></tr>");
	
	
	
	%>
	
	<%= db.closeConnection(con) %>
</body>
</html>