<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
  var x = document.forms["updateform"]["password"].value;
  if (x == "") {
    alert("Enter new password to change otherwise enter old password in the field!");
    return false;
  }
}
</script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
body {
  background: #31bc86;
}
form {
  width: 60%;
  margin: 60px auto;
  background: white;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #16A085;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-active {
  top: -3em;
}

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
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}

input[type=submit]:hover {
  background: #31bc86;
  color: #ffffff;
}

</style>
</head>
<body>
<form name="updateform" action="ControllerServlet" method="post" onsubmit="return validateForm()">
  <label>
    <p class="label-txt">ENTER YOUR NEW USERNAME</p>
    <input type="text" class="input" name="name" value="<%=request.getParameter("name")%>">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">YOUR SSN</p>
    <input type="text" class="input" name="SSn" value="<%=request.getParameter("ssn")%>" readonly="readonly">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR NEW PASSWORD</p>
    <input type="password" class="input" name="password" >
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <!-- <label>
    <p class="label-txt">CONFIRM YOUR NEW PASSWORD</p>
    <input type="password" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label> -->
  <label>
    <p class="label-txt">ENTER YOUR NEW EMAIL</p>
    <input type="text" class="input" name="email" value="<%=request.getParameter("email")%>">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
   <label>
    <p class="label-txt">ENTER YOUR NEW ADDRESS</p>
    <input type="text" class="input"  name="address" value="<%=request.getParameter("address")%>">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <input type="submit" value="Update" name="action">
</form>
<script>
$(document).ready(function(){

	  $('.input').focus(function(){
	    $(this).parent().find(".label-txt").addClass('label-active');
	  });

	  $(".input").focusout(function(){
	    if ($(this).val() == '') {
	      $(this).parent().find(".label-txt").removeClass('label-active');
	    };
	  });

	});
</script>
</body>
</html>