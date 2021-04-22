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

<script type="text/javascript">
	function changeOptions (opt) {
		var element = document.getElementById('details');
		
		if (opt == 'pick a color' || opt == 'others') { element.style.display='block'; }
		else { element.style.display='none'; }
	}
</script> 

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
	 
	<form>
		<table>
			<tr>
				<td>Model Name</td>
				<td><input type='text' name='input_modelName' placeholder='Model'/></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><input type='text' name='input_manufacturer' placeholder='Manufacturer'/></td>
			</tr>
			<tr>
				<td>No. of Strings</td>
				<td><input type='number' name='input_numStrings' placeholder='0'/></td>
			</tr>
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
		</table>
	</form>
	
	<%
		
	%>
</body>
</html>