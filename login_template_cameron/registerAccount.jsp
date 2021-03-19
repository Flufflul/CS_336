<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% page import="org.apache.commons.code.digest.DigestUtils"%>

	<%
		try{
			
			ApplicationDB db = new ApplicationDB();
			Connection newConn = DriverManager.getConnection();
			
			//"username" and "password" would be the names of the HTML elements from the login form
			String usernameInput = request.getParameter("username");
			String passwordInput = request.getParameter("password");
			String retypedPassword = request.getParameter("passwordRetyped");
			
			
			if(!passwordInput.equals(retypedPassword)){
				
				//password does not match retyped password
				return;
			}
			
			
			/*
			script required here to generate userID number
			*/
			
			/*check if username already exists*/
			PreparedStatement checkUsername = newConn.prepareStatement("SELECT username FROM users WHERE username LIKE?");
			checkUsername.setString(1, usernameInput);
			ResultSet rs = checkUsername.executeQuery(); 
			
			if (rs.isBeforeFirst()){
				out.println("An account with that username already exists");
				
				//close everything
				rs.close();
				checkUsername.close();
				newConn.close();
				
				response.sendRedirect(registerAccount.jsp);
			}
			
			
			
			//encrypt the password
			String encryptedPassword = DigestUtils.sha256hex(passwordInput);
			
			//change the query to the correct database field names
			PreparedStatement createAccount = newConn.prepareStatement("INSERT INTO users(userID, username, password) VALUES(?,?,?)");
			createAccount.setString(1, userID);
			createAccount.setString(2, usernameInput);
			createAccount.setString(3, encryptedPassword);
			
			createAccount.executeInsert();
			
			createAccount.close();
			newConn.close();
			
			//create new session
			HttpSession newSession = request.getSession();
			newSession.setAttribute("user", usernameInput);
			
			response.sendRedirect("home.jsp"); //redirect to homepage or login page
			
		} catch(Exception e){
			out.println(e);
			out.println("Exception during account creation");
		}
	
	
	%>