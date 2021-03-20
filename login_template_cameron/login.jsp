<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% page import="org.apache.commons.code.digest.DigestUtils"%>

	<%


		try(
			/* not sure if this line is needed
			Class.forName("com.mysql.jdbc.Driver).newInstance();*/
			
			ApplicationDB db = new ApplicationDB();
			Connection newConn = DriverManager.getConnection();
			PreparedStatement loginSTMT = newConn.prepareStatement("SELECT u.username, p.password FROM username, password WHERE username LIKE?");


			//get the info from the login fields
			String usernameInput = request.getParameter("username");
			String passowrdInput = request.getParameter("password");


			//get the result set associated with "usernameInput," get number of tuples
			loginSTMT.setString(1, usernameInput);
			ResultSet loginRS = loginSTMT.executeQuery();
			int rows = loginSTMT.executeQuery();


			/*no such account with that username (or there is more than one person with username)*/
			if(!loginRS.isBeforeFirst() || rows > 1){
				
				//close result set
				loginRS.close();
				loginSTMT.close();
				conn.close();
				
				return; //no such user with that username
				
			}else{ //successful login, account with info exists
				
				//close result set, login prepared statement
				loginRS.close();
				loginSTMT.close();
				
				
				//this library function hashes the password using sha256
				//hash = 1 way encryption
				String hashedPasswordInput = DigestUtils.sha256hex(password_input); 
				
				
				String retrievedPasswordHash = loginRS.getString("password"); //obtained from SQL query
			
				//compare stored password and password from imput
				if(retrievedPasswordHash.equals(hashedPasswordInput)){
				
					//create new session for user upon login
					HttpSession newSession = request.getSession(); //not sure if this line is needed
					newSession.setAttribute("user", usernameInput);
				
				
					out.println("successful login"); //passwords match, valid login
					
					
					/*must check if user is admin or customer rep first*/
					
					PreparedStatement getCustomerReps = newConn.prepareStatement("SELECT username FROM Customer_Rep WHERE username LIKE?");					
					getCustomerReps.setString(1, usernameInput);
					ResultSet customerRepRS = getCustomerReps.executeQuery();
					
					//if account belongs to customer rep
					if(customerRepRS.isBeforeFirst()){
					
						//send to customer rep view
						customerRepRS.close();
						getCustomerReps.close();
						newConn.close();
						
						response.sendRedirect("home.jsp");
					}
					
					
					/*not customer rep, check if admin*/
					PreparedStatement getAdmins = newConn.prepareStatement("SELECT username FROM Admin_Staff WHERE username LIKE?");
					getAdmins.setString(1, usernameInput);
					ResultSet adminsRS = getCustomerReps.executeQuery();
					
					if(adminsRS.isBeforeFirst()){
						
						//send to admin view
						adminsRS.close();
						getAdmins.close();
						newConn.close();
						
						response.sendRedirect("home.jsp");
					}
					
					
					/*is not website staff, send to user view*/
					response.sendRedirect("home.jsp"); //send to home page
					
				}
				
				out.print("Password incorrect"); //passwords do not match
			}
			
		} catch(Exception e){
			out.print(ex);
			out.print("Exception during login attempt");
		}
		
	%>


