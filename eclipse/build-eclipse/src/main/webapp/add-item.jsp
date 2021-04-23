<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>CS 336: Create Auction</title>

<%
	session.setAttribute("itemFail", false);
	session.setAttribute("expFail", false);
%>
<!--
<script type="text/javascript">
	function changeOptions (opt) {
		var element = document.getElementById('guitar');
		
		if (opt == 'Select a guitar type') { element.style.display='none'; }
		else { element.style.display='none'; }
	}
</script> 
-->
</head>

<body style='font-family: sans-serif'>
	<a href='create-auction.jsp'>Back</a>
	<hr><br>
	
	<!-- 
	items:							electric_guitar:			acoustic_guitar:			acoustic_electric_guitar:
		item_id (int, auto),		item_id (int),				item_id (int),				item_id (int),
		model_name (varchar),		pickup_config (varchar)		is_classical (bool, 0/1)	pickup_type (varchar),
		manufacturer (varchar),																includes_tuner (bool, 0/1)
		num_Strings	(int)		
	 -->
	 
	<form method="POST" action="add-item-parse.jsp">
		<table>
			<tr>
				<td><label for='input_modelName'>Model Name</label></td>
				<td><input type='text' name='input_modelName' placeholder='e.g. M20x'/></td>
				<%
				Boolean modelNameFail = (Boolean) session.getAttribute("modelNameFail");
				if (modelNameFail) { out.print("<td><p style='color:red;'>*Model name cannot be empty</p></td>"); }
				%>
			</tr>
			<tr>
				<td><label for='input_manufacturer'>Manufacturer</label></td>
				<td><input type='text' name='input_manufacturer' placeholder='e.g. Yamaha'/></td>
				<%
				Boolean manufacturerFail = (Boolean) session.getAttribute("manufacturerFail");
				if (manufacturerFail) { out.print("<td><p style='color:red;'>*Manufacturer cannot be empty</p></td>"); }
				%>
			</tr>
			<tr>
				<td><label for='input_numStrings'>No. of Strings</label></td>
				<td><input type='number' name='input_numStrings' placeholder='e.g. 3'/></td>
				<%
				Boolean numStringsFail = (Boolean) session.getAttribute("numStringsFail");
				if (numStringsFail) { out.print("<td><p style='color:red;'>*No. of Strings cannot be empty</p></td>"); }
				%>
			</tr>
		</table>
			
			<!--
			<tr>
				<td>Guitar Type</td>
				<td>
					<select name='guitarType'>
						<option value='0'>Select a guitar type</option>
						<option value='1'>Acoustic</option>
						<option value='2'>Electric</option>
						<option value='3'>Acoustic-Electric</option>
					</select>
				</td>
			</tr>
			-->
			
		<br>
			
		<table>
			<tr><td><i>Acoustic:</i></td></tr>
			<tr>
				<td><label for='input_acPickupConfig'>Pickup Config.</label></td>
				<td><input type='text' name='input_acPickupConfig'/></td>
			</tr>
			<tr><td><input type='submit' name='submit_ac' value='Add new acoustic'/></td></tr>
		</table>
		
		<br>
			
		<table>
			<tr><td><i>Electric:</i></td></tr>
			<tr>
				<td><label for='input_elIsClassical'>Classical</label></td>
				<td><input type='checkbox' name='input_elIsClassical'/></td>
			</tr>
			<tr><td><input type='submit' name='submit_el' value='Add new electric'/></td></tr>
		</table>
		
		<br>
		
		<table>
			<tr><td><i>Acoustic-Electric:</i></td></tr>
			<tr>
				<td><label for='input_acelPickupConfig'>Pickup Config.</label></td>
				<td><input type='text' name='input_acelPickupConfig'/></td>
			</tr>
			<tr>
				<td><label for='input_acelIncTuner'>Includes Tuner</label></td>
				<td><input type='checkbox' name='input_acelIncTuner'/></td>
			</tr>
			<tr><td><input type='submit' name='submit_acel' value='Add new acoustic-electric'/></td></tr>
		</table>
	</form>
	
</body>
</html>