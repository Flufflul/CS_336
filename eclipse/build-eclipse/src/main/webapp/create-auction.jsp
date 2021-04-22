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

<body style='font-family: sans-serif'>
	<a href='my-auctions.jsp'>Back</a>
	<hr><br>
	
	<%
		// Connect to DB
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String qry;
		
		// Get session info
		String uid = (String) session.getAttribute("user");
		
		/* Details necessary to set an auction */
		/* Fields: seller_id, item_id, 
			start_time, expire, 
			start_price, hidden_price (minimum bid threshold), buy_now_price, 
			min_incr, highest_curr_bid, 
			winner 
		*/
		out.print("<form method='POST' action='create-auction-parse.jsp'>");
		out.print("<table>");
		
		
		// List of all items
		out.print("<tr>");
		
		qry = "SELECT * FROM items";
		ResultSet items = stmt.executeQuery(qry);
		
		out.print("<td style='text-align:right'><label for='items'>Item</label></td>");
		
		out.print("<td><select name='item'>");
		
		out.print("<option value=''></option>");
		while (items.next()) {
			String itemName = items.getString("model_name");
			out.print("<option value='"+itemName+"'>"+itemName+"</option>");
		}
		out.print("</select></td>");
		
		out.print("<td><a href='add-item.jsp'>Item not here? Add one.</a></td>");
		
		out.print("</tr>");
		
		
		// Set time limit
		out.print("<tr>");
		
		out.print("<td style='text-align:right'><label for='expires'>Expires</label></td>");
		out.print("<td><input type='date' name='exp_date'/><input type='time' name='exp_time'></td>");

		out.print("</tr>");
		
		bool expFail = session.getAttribute("expFail");
		if ()
		
		
		// Set starting price
		out.print("<tr>");
		
		out.print("<td style='text-align:right'><label for='start-price'>Base price $</label></td>");
		out.print("<td><input type='number' name='start_price' placeholder='0'/></td>");
		
		out.print("</tr>");
		
		
		// Set (hidden) minimum threshold for auction
		out.print("<tr>");
		
		out.print("<td style='text-align:right'><label for='hidden-price'>Minimum bid threshold $</label></td>");
		out.print("<td><input type='number' name='hidden_price' placeholder='0'/></td>");
		
		out.print("</tr>");
		
		
		// Set buyout price
		out.print("<tr>");
		
		out.print("<td style='text-align:right'><label for='buyout-price'>Buyout price $</label></td>");
		out.print("<td><input type='number' name='buyout_price' placeholder='0'/></td>");
		
		out.print("</tr>");
		
		
		// Set minimum increment
		out.print("<tr>");
		
		out.print("<td style='text-align:right'><label for='min-incr'>Minimum increment $</label></td>");
		out.print("<td><input type='number' name='min_incr' placeholder='0'/></td>");
		
		out.print("</tr>");
		
		
		// Submit
		out.print("<tr><td></td><td><input type='submit' value='Create auction'</td></tr>");
		
		out.print("</form>");
		
		db.closeConnection(con);
	%>
</body>

</html>