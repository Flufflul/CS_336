<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
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
	try {
		
	// Connect to DB
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	PreparedStatement aucInfo = null;

	
	/* Parse and validate data */
		
	// item (model_name), exp_date, start_price, hidden_price, buyout_price, min_incr
	String itemName 	= request.getParameter("item");				// mandatory
	String expDate		= request.getParameter("exp_date");			// mandatory
	String expTime 		= request.getParameter("exp_time");			// optional
	String startPrice 	= request.getParameter("start_price");		// optional
	String hiddenPrice 	= request.getParameter("hidden_price");		// optional
	String buyoutPrice 	= request.getParameter("buyout_price");		// optional
	String minIncrement = request.getParameter("min_incr");			// optional
	
	String qry_aucInfo = "INSERT INTO auction_info VALUES (?,?,?,?,?,?,?,?,?)";
	aucInfo = con.prepareStatement(qry_aucInfo);
	
	boolean failed = false;
	
	// AUCTION_INFO ORDER: 
	// id (null) <- auto,
	// starts (datetime) <- current_timestamp, expires (datetime), 
	// startPrice (float), hiddenPrice (float), buyout (float), minIncr (float), 
	// highestBid (float) <- calculated, winner (varchar) <- calculated
	
	//1 id -> auto incremented int
	aucInfo.setNull(1, java.sql.Types.INTEGER);
	
	//2 starts -> always current datetime
	java.util.Date date = new java.util.Date();
	java.sql.Timestamp sql_now = new java.sql.Timestamp(date.getTime());
	aucInfo.setTimestamp(2, sql_now);
	
	//3.1 expDate		: "" fail! no expiration date selected
	//3.2 expTime		: "" ok.   default 00:00:00
	java.sql.Timestamp sql_expDate = new Timestamp(0);
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // date parser
	java.util.Date d = new java.util.Date(); // temp date
	
	String exp = expDate + " ";
	if (expDate.equals("")) {
		session.setAttribute("expFail", true);
		failed = true;
	}
	
	if (expTime.equals("")) { exp += "00:00"; }
	else { exp += expTime; }
	//out.print("exp: "+exp);
	
	d = df.parse(exp);
	sql_expDate.setTime(d.getTime());
	//out.print("expdatesql: "+sql_expDate);
	
	aucInfo.setTimestamp(3, sql_expDate);
	
	//4 "start_price"	: "" ok.   default 0
	float sp = 0;
	if (!startPrice.equals("")) { sp = Float.parseFloat(startPrice); }
	aucInfo.setFloat(4, sp);
	
	//5 "hidden_price"	: "" ok.   default nil
	float hp = -1;
	if (hiddenPrice.equals("")) { aucInfo.setNull(5, Types.FLOAT); }
	else {
		hp = Float.parseFloat(hiddenPrice);
		aucInfo.setFloat(5, hp);
	}
	
	//6 "buyout_price"	: "" ok.   default nil
	float bp = -1;
	if (buyoutPrice.equals("")) { aucInfo.setNull(6, java.sql.Types.FLOAT); }
	else {
		bp = Float.parseFloat(buyoutPrice);
		aucInfo.setFloat(6, bp);
	}
	
	//7 "min_incr"		: "" ok.   default 1
	float mi = 1;
	if (!minIncrement.equals("")) { mi = Float.parseFloat(minIncrement); }
	aucInfo.setFloat(7, mi);
	
	//8 highestBid -> null float
	aucInfo.setNull(8, java.sql.Types.FLOAT);
	
	//9 winner -> null varchar
	aucInfo.setNull(9, java.sql.Types.VARCHAR);
		
	// AUCTIONS ORDER: 
	// seller_id (varchar), item_id (int), auction_id (int)
	
	
	out.print("<h2>"+itemName+
			" | "+expDate+
			" | "+expTime+
			" | "+startPrice+
			" | "+hiddenPrice+
			" | "+buyoutPrice+
			" | "+minIncrement+
			"</h2>");
	
	out.print("<h2>"+sql_now+
			" | "+sql_expDate+
			" | "+sp+
			" | "+hp+
			" | "+bp+
			" | "+mi+
			"</h2>");
	
	
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>