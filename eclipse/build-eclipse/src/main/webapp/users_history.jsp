<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>User History</title>
	
	<%
	session.setAttribute("bidFail", false);
	session.setAttribute("tempAucID", -1);
	session.setAttribute("bidSuccess", false);
	session.setAttribute("selectFail", false);
	%>
	
	<%
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	%>
	
</head>

<body style='font-family: sans-serif'>

	<a href='item_detail.jsp'>Back</a>
	<hr><br>
	
	<form method="POST" action="history_detail.jsp">
		<table>
			<tr>
				<td><label for='auctions'>Select A Name</label></td>				
				<td><select name='auctions' onchange='itemCheck(this);'>
					<option value=''></option>
					<%
					/* List all auctions */
					// Username
					
					// Retrieve list of auctions with item info NOT by user
					Statement stmt = con.createStatement();
					String qry = 	"SELECT username "+
									"FROM Users ";
					
					ResultSet res = stmt.executeQuery(qry);
					
					// List auctions
					while (res.next()) {
	
						String username		= res.getString("username");
						
						out.print("<option value='"+username+"'>"+username+"</option>");
					}
					%>
				</select></td>
				<%
				Object strSelectFail = session.getAttribute("selectFail");
				Boolean selectFail = (Boolean) strSelectFail;
				if (selectFail) { out.print("<td><p style='color:red;'>*Please select a valid option</p></td>"); }
				session.setAttribute("selectFail", false);
				%>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Next" style="width:100%;"/></td>
			</tr>
		</table>
	</form>

<% db.closeConnection(con); %>
</body>
</html>