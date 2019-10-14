<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<link rel="stylesheet" type="text/css" href="InsideloginMain.css">
<link rel = "stylesheet" type = "text/css" href = "LoginStyle.css"> 
<style>
input[type=submit] {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

input[type=submit]:hover {
  background: #16A085;
  color: #ffffff;
}
</style>
</head>
<body>
<div class="header">
		<div class="headercontent">
		
		
			<ul>
				<li class="firstcontent"><a class="active" href="Login.jsp">Retail
						Bank Management System</a></li>
				<!-- <li class="secondcontent"><a href="searchresult.jsp">Search</a></li> -->
			</ul>
			
			 </div> 
		
	</div>
<center style="font-weight: strong;font-family: verdana;font-size: 20px; margin-top: 300px;">
<%String msg = (String)request.getAttribute("msg"); %>
<%=msg %>
<br>
<form action="ControllerServlet" method="post">
<input type="submit" value="Home" name="action">
</form>
</center>
<div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
</body>
</html>