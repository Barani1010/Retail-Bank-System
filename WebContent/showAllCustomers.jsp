<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Customers</title>
<link rel = "stylesheet" type = "text/css" href = "InsideloginMain.css">
</head>
<body>
	<% String name = (String) session.getAttribute("name"); 
	ArrayList<Customer> customerList = null;
	if(request.getAttribute("customerList")!=null){
	 customerList = (ArrayList<Customer>) request.getAttribute("customerList"); } %>
		<div class="header">
			<div class="headercontent">
				<ul>
					<li class="firstcontent"><a class="active" href="InsideloginMain.jsp">Retail Bank Management System</a></li>
					
				</ul>
			</div>
		</div> <br>
		
		<div class = "welcome">
		<p align="center"><% out.print("Welcome back, " +name+ "!"); %></p>
		</div> <br><br>
		
	<table align = "center"> 
		<tr>
			<th>USERNAME</th><th>EMAIL</th><th>ADDRESS</th>
		</tr>
		
	<% for(Customer c: customerList) {%>
		<tr>
		<td><%= c.getName()%></td>
		<td><%= c.getEmail()%></td>
		<td><%= c.getAddress()%></td>	
		</tr>
	<% } %>
		
	</table>
	<br><br>
	
	 <div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
		
</body>
</html>