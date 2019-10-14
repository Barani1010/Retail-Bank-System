<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Success</title>
<link rel = "stylesheet" type = "text/css" href = "RegisterSuccessStyle.css"> 
</head>
<body>
	
	<ul>
		<li><a class="active" href="Login.jsp">Retail Bank Management System</a></li>
		
	</ul>
	
	<h1>
		<%=request.getAttribute("message")%>
	</h1> <br>
	
	<h1><a href="Login.jsp" id="loginbutton">Login</a></h1>
	
	 <div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
	
	
</body>
</html>