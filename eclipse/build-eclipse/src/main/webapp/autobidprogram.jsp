<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%
// Connect to DB
ApplicationDB newDB = new ApplicationDB();	
Connection newcon = newDB.getConnection();

//Get session info
String uid = (String) session.getAttribute("user");

Statement newst = newcon.createStatement();

//retrieve auction info 


//list of buyers set up autobid

newst.close();
newcon.close();
%>
