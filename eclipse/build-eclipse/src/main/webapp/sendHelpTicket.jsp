<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!---CUSTOMER HELP/SUPPORT TABLE NEEDS TO BE CHANGED BEFORE
	FINISHING THIS--->

<%

try{
	ApplicationDB db = new ApplicationDB();
	Connection helpConn = DriverManager.getConnection();
	PreparedStatement sendHelp = helpConn.prepareStatement("INSERT INTO User_reqHelpFrom_Rep(user_id, rep_id, ticket_no, detail) VALUES(?,?,?,?,?)");


	//get the info from the help ticket fields
	String usernameInput = request.getParameter("username");
	String emailInput = request.getParameter("emailAddr");
	String reasonInput = request.getParameter("reason");

	//Generate help ticket: convert the first 3 chars of username to ints, add them,
	//get 5th car of reason and cast to int, then multiply it by the sum
	int uNum1 = username.charAt(0);
	int uNum2 = username.charAt(1);
	int uNum3 = username.charAt(2);
	
	int uMultiplier = reason.charAt(5);
	
	int ticket_no = (uNum1+uNum2+uNum3)*uMultiplier;
	
	
	
	/*sendHelp.set(); //user
	sendHelp.set(); //rep 
	sendHelp.set(); //user email
	sendHelp.set(); //ticket number
	sendHelp.set(); //detail for request
	
	sendHelp.executeUpdate();*/
	
	
	
	helpConn.close();
	
	response.sendRedirect("successful_Ticket_Request");
	
}catch(Exception e){
	out.print(e);
	out.print("Exception while sending help ticket");
}


/*
CREATE TABLE IF NOT EXISTS User_reqHelpFrom_Rep(
	user_id int not null,
    rep_id int not null,
    
	//NEEDS email addr column
	
    ticket_no int,
    detail varchar(255),
    
    constraint primary key(user_id, rep_id),
    constraint foreign key(user_id) references Users(user_id),
    constraint foreign key(rep_id) references Customer_Rep(user_id)
) engine=innodb;
*/



>%