<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
	<% 
	List<String> list = new ArrayList<String>();
	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
			
		String id = request.getParameter("username");
		String pw = request.getParameter("new_password");
		String cpw = request.getParameter("confirm_password");
		if (!pw.equals(cpw)){
			out.println("pw: " +pw);
			out.println("cpw: "+ cpw);
			out.println("Password does not match.");
		}else {
			Statement stmt = con.createStatement(); 
			String str = "SELECT * FROM users WHERE username = '"+ id +"'";
			ResultSet rs = stmt.executeQuery(str);
			if(!rs.next()){
				out.println("Account does not Exist");
			}else{
				PreparedStatement updatepw = con.prepareStatement(
						"UPDATE users Set password = ? WHERE username = ?");
				updatepw.setString(1,pw);
				updatepw.setString(2,id);
				updatepw.executeUpdate();
				out.println("Reset Successfully!");
			}
		}
		out.println("<br><a href='index.jsp'>Back to Log In</a> ");
		con.close();
	 }catch (Exception e) {
        out.print(e);
	}
	%>
</body>
</html>