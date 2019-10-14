<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.bean.Customer" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "InsideloginMain.css"> 
<link rel = "stylesheet" type = "text/css" href = "LoginStyle.css"> 
</head>
<% Customer clogin = (Customer) request.getAttribute("clogin"); %>
<body>
<div class="header">
		<div class="headercontent">
		
		<form autocomplete="off" action="ControllerServlet">
			<ul>
				<li class="firstcontent"><a class="active" href="Login.jsp">Retail
						Bank Management System</a></li>
				<!-- <li class="secondcontent"><a href="searchresult.jsp">Search</a></li> -->
				 
	
				<li class="fourthcontent"><a href="ControllerServlet?action=showAllCustomers">View
						All Customers</a></li>
			</ul>
			</form>
			 </div> 
		
	</div>
<h3 align="center"> SEARCH RESULT</h3> 
<table border="1" align="center">
<tr><th>CUSTOMER NAME</th>
<th>SSN</th>
<th>PHONE NUMBER</th>
<th>ADDRESS</th>
</tr>

<tr>
<td><%=clogin.getName() %></td>
<td><%=clogin.getSsn() %></td>
<td><%=clogin.getEmail() %></td>
<td><%=clogin.getAddress() %></td>

</tr>



</table>
<p align="center"> <a href="ControllerServlet?action=InsideloginMain"><input type="submit" value="BACK"  style="box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);"></a></p>
<div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
</body>
</html>