<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.bean.Account" %>
    <%@ page import = "com.bean.CurrentAccount" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "InsideloginMain.css">
</head>
<body>
	<% String name = (String) session.getAttribute("name");  
	Account savingsAccount = (Account) request.getAttribute("savingsAccount"); 
	CurrentAccount currentAccount = (CurrentAccount)request.getAttribute("currentAccount");	%>
	<div class="header">
			<div class="headercontent">
				<ul>
					<li class="firstcontent"><a class="active" href="InsideloginMain.jsp">Retail Bank Management System</a></li>
					<li class="thirdcontent"><a href="ControllerServlet?action=viewall">View All Customers</a></li>
				</ul>
			</div>
		</div> <br>
		
		<div class = welcome>
			<p><% out.print("Welcome back, " +name+ "!"); %></p>
		</div> <br><br>
	
		<div class = welcome>
			<p>Savings Account</p>
		</div>	<br>
	
	<table align = "center"> 
		<tr>
			<th>ACCOUNT ID</th><th>ACCOUNT TYPE</th><th>BALANCE</th><th>STATUS</th><th>SSN</th>
		</tr>
		
	
		<tr>
		<td><%out.print(savingsAccount.getAccountId());%></td>
		<td><%out.print(savingsAccount.getAccountType());%></td>
		<td><%out.print(savingsAccount.getBalance());%></td>
		<td><%out.print(savingsAccount.getStatus());%></td>
		<td><%out.print(savingsAccount.getSsn());%></td>
		</tr>

		
	</table>
	<br><br>
	
	<div class = welcome>
		<p>Current Account</p>
	</div><br>
	<table align = "center"> 
		<tr>
			<th>ACCOUNT ID</th><th>ACCOUNT TYPE</th><th>BALANCE</th><th>STATUS</th><th>SSN</th>
		</tr>
		
	
		<tr>
		<td><%out.print(currentAccount.getAccountId());%></td>
		<td><%out.print(currentAccount.getAccountType());%></td>
		<td><%out.print(currentAccount.getBalance());%></td>
		<td><%out.print(currentAccount.getStatus());%></td>
		<td><%out.print(currentAccount.getSsn());%></td>
		</tr>

		
	</table>
	 <div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
		
</body>
</html>