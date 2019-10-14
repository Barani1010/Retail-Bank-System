<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.bean.Customer" %>
<%@ page import = "com.service.Service" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retail Bank Management System</title>
<link rel ="stylesheet" type = "text/css" href = "LoginStyle.css">
</head>
<body>
	
<%
ArrayList<Customer> customerList = null;
if(Service.getAllCustomers()!=null){
customerList = Service.getAllCustomers();
}
%>
	<ul>
		<li><a class="active" href="Login.jsp">Retail Bank Management System</a></li>
		
	</ul>
	
	<div class="maincontent">
	<form id="mainform" action="ControllerServlet" method="post">
            <input type="textfield" name="name" placeholder="Username" id="username">
            <input type="textfield" name="user_ssn" placeholder="SSN" id="ssn" style="display:none" readonly = "readonly">
            <input type="textfield" name="email_id" placeholder="Email" id="email" style="display:none">
            <input type="textfield" name="user_address" placeholder="Address" id="address" style="display:none">
            <input type="password" name="password" placeholder="Password" id="pw">
            <input type="password" name="confirm_password" placeholder="Confirm Password" id="cpw">
            <input id="submitButton" type="submit" name="action" value="Login">
    </form>
	</div>
  
    <button id="toggle">Register</button>
  
    <div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
	
    <script type="text/javascript">
    	var form = document.getElementById("mainform");
    	var submitButton = document.getElementById("submitButton");
    	var userssn = document.getElementById("ssn");
    	var email = document.getElementById("email");
    	var address = document.getElementById("address");
    	var toggle = document.getElementById("toggle")
    	var cpw = document.getElementById("cpw")
    	var pw = document.getElementById("pw")
    	var username = document.getElementById("username")
    	toggle.onclick = function(e){
    		if (toggle.innerHTML == "Register"){
    			toggle.innerHTML = "Login"
    			form.action = "ControllerServlet"
    			submitButton.value = "Register"
    			cpw.style.display = "block"
    			userssn.style.display = "block"
    	    	email.style.display = "block"
    	    	address.style.display = "block"
    			submitButton.style.display = "none"
    		} 
    		else {
    			toggle.innerHTML = "Register"
    			form.action = "ControllerServlet"
    			submitButton.value = "Login"
    			cpw.style.display = "none"
    			userssn.style.display = "none"
    	    	email.style.display = "none"
    	    	address.style.display = "none"
				submitButton.style.display = "inline"
    		}
    		
    	}
    	form.onkeyup = function(){ 
          if(pw.value == cpw.value && username.value != "" && pw.value != "" && userssn.value != "" && email.value != "" && address.value != "" ) {
             submitButton.style.display = "inline"
         }
     	}
	
    	list = [];
    	<%
    	if(customerList !=null){
    	for(Customer cl:customerList){ %>
    	list.push(<%= cl.getSsn() %>);
    	<%} }%>
    	console.log(list);
    	if(list.length == 0){
    		document.getElementById('ssn').value = "500000001";
    		
    	}else{
    		var math = Math.max.apply(null, list);
    		math = math+1;
    		document.getElementById('ssn').value=math;
    	}
 </script>    
	
</body>
</html>