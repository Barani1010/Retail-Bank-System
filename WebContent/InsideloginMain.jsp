<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.bean.Account" %>
    <%@ page import = "com.bean.CurrentAccount" %>
<%@ page import = "com.bean.Customer" %>
<!DOCTYPE html>
<html>
<head>
<script>
function confirmDelete()
{
	var t = confirm("Do you want to delete this customer?");
	return t;
}
</script>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="InsideloginMain.css">
<script src="snow_fall.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<title>Customer Authenticated</title>
</head>
<% 
ArrayList<String> arrSSN = null;
if(request.getAttribute("arrSSN") !=null){
arrSSN = (ArrayList<String>) request.getAttribute("arrSSN"); 
}%>
<body>
		<%  
			String name = (String) session.getAttribute("name");
		   String password = (String) session.getAttribute("password");
		   Customer loggedInCustomer = (Customer) session.getAttribute("loggedincustomer");
		%>
		
		<%
		ArrayList<Account> savingsList = null;
		if(request.getAttribute("savingList") !=null){
		savingsList = (ArrayList<Account>) request.getAttribute("savingList");  
		}%>
		<% 
		ArrayList<CurrentAccount> currentList = null;
		if(request.getAttribute("currentList")!=null){
		currentList = (ArrayList<CurrentAccount>) request.getAttribute("currentList"); } %>
		<% 
		int savingsadder = 0;
		if(request.getAttribute("savingsaddedValue") != null){
		savingsadder = (int)request.getAttribute("savingsaddedValue"); 
		}%>
		<% 
		int currentadder = 0;
		if(request.getAttribute("currentaddedValue") != null){
			currentadder = (int)request.getAttribute("currentaddedValue"); 
		}%>
		<div class="header">
			<div class="headercontent">
				<ul>
					<li class="firstcontent"><a class="active" href="InsideloginMain.jsp">Retail Bank Management System</a></li>
					<form autocomplete="off" action="ControllerServlet">
  <div class="autocomplete" style="width:200px;display:inline-block">
    <input id="myInput" type="text" name="ssn" placeholder="SSN" style="right:30px">
  </div>
  <input type="submit" name="action" value="Search">
  <li class="fourthcontent"><a href="ControllerServlet?action=viewall">View All Customers</a></li>
  <li class="fourthcontent"><a href="ControllerServlet?action=Logout">Logout</a></li>
</form>
	
					
				</ul>
			</div>
		</div> <br>
		
		<div class = welcome>
			<p><% out.print("Welcome back, " +name+ "!"); %></p>
		</div>
		
		<div class="content">
			<div class="table" align="center">
				<table>
					<tr>
						<th>Name</th><th>SSN</th><th>Email</th><th>Address</th><th colspan="2">Action</th>
					</tr> 
					<tr>
						<td><%out.print(loggedInCustomer.getName());%></td>
						<td><%out.print(loggedInCustomer.getSsn());%></td>
						<td><%out.print(loggedInCustomer.getEmail());%></td>
						<td><%out.print(loggedInCustomer.getAddress());%></td>
						<td><a href="updatedetails.jsp?ssn=<%=loggedInCustomer.getSsn()%>&name=<%=loggedInCustomer.getName()%>&email=<%=loggedInCustomer.getEmail()%>&address=<%=loggedInCustomer.getAddress()%>">Update</a></td>
					<td><a href="ControllerServlet?action=Delete&ssn=<%=loggedInCustomer.getSsn()%>" onclick="return confirmDelete();">Delete</a></td>
				</tr>
				</table>
			</div>
			
			<div class="button1">
				<button id="modalbtn1" class = "buttonAccount1">Create Savings Account</button>
			</div>
			
			<div class="button2">
				<button id="modalbtn2" class = "buttonAccount2">Create Current Account</button>
			</div>
		</div>
		<button id="buttonFinal" style="display:none">Show Account Details</button>
		<div id="Modal" class="modal">
			<div class="modalContent">
				<Span class="closeBtn">&times;</Span>
				<div class = "maincontent">
				<form id="ModalForm" action="ControllerServlet" method="post" align="center">
            		<input type="number" name="accountId" placeholder="Account ID" id="accId">
            		<input type="text" name="accountType" placeholder="Account Type" id="accType">
            		<input type="number" name="SSN" placeholder="SSN" id="ssn">
            		<input type="number" name="initialDeposit" placeholder="Initial Deposit" id="initialdeposit">
            		<input id="submitButton" type="submit" name="action" value="AddSavings">
   				</form>
   				</div>
			</div>
		</div> 
		
		<a id="actionctrl"></a>
		<a id="actionctrl1"></a>
		<script>

		$('.buttonAccount2').click(function(){
			$('#accType').val('');
			document.getElementById('actionctrl').href = "";
			$('#accId').val('');
			$('#ssn').val('')
			$('#submitButton').val('AddCurrent');
			$('#accType').val('Current');
			$('#accId').val('1774531');
			$('#ssn').val(<%=loggedInCustomer.getSsn()%>);
			document.getElementById('actionctrl').href = "ControllerServlet?action=createCurrent";
			document.getElementById('actionctrl').click();
		})
		
		$('.buttonAccount1').click(function(){
			$('#accType').val('');
			document.getElementById('actionctrl').href = "";
			$('#ssn').val('')
			$('#submitButton').val('AddSavings');	
			$('#accType').val('Savings');
			$('#ssn').val(<%=loggedInCustomer.getSsn()%>);
			document.getElementById('actionctrl').href = "ControllerServlet?action=createSaving";
			document.getElementById('actionctrl').click();
		})
		count1 = 0;
		$('#modalbtn1').css('cursor', 'pointer')
		$('#modalbtn2').css('pointer-events', 'none').css('background', 'grey');
		if(window.location.href=="http://localhost:8080/Retail_Bank_Management_System/ControllerServlet?action=createSaving"){
			$('#Modal').css('display', 'block');
			$('#accType').val('');
			$('#ssn').val('')
			$('#submitButton').val('AddSavings');	
			$('#accType').val('Savings');
			$('#ssn').val(<%=loggedInCustomer.getSsn()%>);
			console.log($('#accId').val());
			list=[]
			<%
			if(savingsList !=null){
			for(Account a:savingsList){ %>
				list.push(<%=a.getAccountId()%>);
				
			<%} }
			%>
			console.log(list)
			if(list.length == 0){
				document.getElementById('accId').value = '';
				var num1 = Number("1674531")
	    		document.getElementById('accId').value = num1;
	    		
	    	}else{
	    		var math = Math.max.apply(null, list);
	    		math = math+1;
	    		document.getElementById('accId').value=math;
	    	}
			var val1 = $('#accId').val();
			sessionStorage.setItem("savVal", val1);
			gg1 = sessionStorage.getItem("savVal");
		}
		<%if(savingsadder == 1){%>
		$('#modalbtn1').css('display', 'none');
		$('#modalbtn2').css('pointer-events', 'auto').css('cursor', 'pointer').css('background', '#31bc86');
		count1++;		
		<%}%>
		if(window.location.href=="http://localhost:8080/Retail_Bank_Management_System/ControllerServlet?action=createCurrent"){
			count1 = count1;
			$('#modalbtn1').css('display', 'none');
			$('#Modal').css('display', 'block');
			$('#accType').val('');
			$('#accId').val('');
			$('#ssn').val('')
			$('#submitButton').val('AddCurrent');
			$('#accType').val('Current');
			$('#accId').val('1774531');
			$('#ssn').val(<%=loggedInCustomer.getSsn()%>);
			list1=[]
			<%
			if(currentList != null){
			for(CurrentAccount c:currentList){ %>
				list1.push(<%=c.getAccountId()%>);
				
			<%} }
			%>
			console.log(list1)
			if(list1.length == 0){
				document.getElementById('accId').value = '';
				var num2 = Number("1774531");
	    		document.getElementById('accId').value = num2;
	    		
	    	}else{
	    		var math = Math.max.apply(null, list1);
	    		math = math+1;
	    		document.getElementById('accId').value=math;
	    	}
			var val2 = $('#accId').val()
			sessionStorage.setItem("curVal", val2);
			gg2 = sessionStorage.getItem("curVal");
		}
		<%if(currentadder == 1){%>
		$('#modalbtn2').css('display', 'none');
		$('#modalbtn1').css('display', 'none');
		count1++;console.log(count1)
		if(count1 == 1){
			$('#buttonFinal').css('display', 'block').addClass('buttonAccount3');
		}
	<%}%>
		var finSSN = <%=loggedInCustomer.getSsn()%>; 
		$('#buttonFinal').click(function(){
			document.getElementById('actionctrl1').href="ControllerServlet?action=showAccounts&ssn="+finSSN;
			document.getElementById('actionctrl1').click();
		})
		
		</script>
		<script>
		 var ssnArray = [];
		   <%
		   if(arrSSN!=null){
		   for (int i = 0; i < arrSSN.size(); i++) {%>
		   			ssnArray.push("<%=arrSSN.get(i)%>");
		   <%}}%>
		   function autocomplete(inp, arr) {
			   /*the autocomplete function takes two arguments,
			   the text field element and an array of possible autocompleted values:*/
			   var currentFocus;
			   /*execute a function when someone writes in the text field:*/
			   inp.addEventListener("input", function(e) {
			       var a, b, i, val = this.value;
			       /*close any already open lists of autocompleted values*/
			       closeAllLists();
			       if (!val) { return false;}
			       currentFocus = -1;
			       /*create a DIV element that will contain the items (values):*/
			       a = document.createElement("DIV");
			       a.setAttribute("id", this.id + "autocomplete-list");
			       a.setAttribute("class", "autocomplete-items");
			       /*append the DIV element as a child of the autocomplete container:*/
			       this.parentNode.appendChild(a);
			       /*for each item in the array...*/
			       for (i = 0; i < arr.length; i++) {
			         /*check if the item starts with the same letters as the text field value:*/
			         if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
			           /*create a DIV element for each matching element:*/
			           b = document.createElement("DIV");
			           /*make the matching letters bold:*/
			           b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
			           b.innerHTML += arr[i].substr(val.length);
			           /*insert a input field that will hold the current array item's value:*/
			           b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
			           /*execute a function when someone clicks on the item value (DIV element):*/
			           b.addEventListener("click", function(e) {
			               /*insert the value for the autocomplete text field:*/
			               inp.value = this.getElementsByTagName("input")[0].value;
			               /*close the list of autocompleted values,
			               (or any other open lists of autocompleted values:*/
			               closeAllLists();
			           });
			           a.appendChild(b);
			         }
			       }
			   });
			   /*execute a function presses a key on the keyboard:*/
			   inp.addEventListener("keydown", function(e) {
			       var x = document.getElementById(this.id + "autocomplete-list");
			       if (x) x = x.getElementsByTagName("div");
			       if (e.keyCode == 40) {
			         /*If the arrow DOWN key is pressed,
			         increase the currentFocus variable:*/
			         currentFocus++;
			         /*and and make the current item more visible:*/
			         addActive(x);
			       } else if (e.keyCode == 38) { //up
			         /*If the arrow UP key is pressed,
			         decrease the currentFocus variable:*/
			         currentFocus--;
			         /*and and make the current item more visible:*/
			         addActive(x);
			       } else if (e.keyCode == 13) {
			         /*If the ENTER key is pressed, prevent the form from being submitted,*/
			         e.preventDefault();
			         if (currentFocus > -1) {
			           /*and simulate a click on the "active" item:*/
			           if (x) x[currentFocus].click();
			         }
			       }
			   });
			   function addActive(x) {
			     /*a function to classify an item as "active":*/
			     if (!x) return false;
			     /*start by removing the "active" class on all items:*/
			     removeActive(x);
			     if (currentFocus >= x.length) currentFocus = 0;
			     if (currentFocus < 0) currentFocus = (x.length - 1);
			     /*add class "autocomplete-active":*/
			     x[currentFocus].classList.add("autocomplete-active");
			   }
			   function removeActive(x) {
			     /*a function to remove the "active" class from all autocomplete items:*/
			     for (var i = 0; i < x.length; i++) {
			       x[i].classList.remove("autocomplete-active");
			     }
			   }
			   function closeAllLists(elmnt) {
			     /*close all autocomplete lists in the document,
			     except the one passed as an argument:*/
			     var x = document.getElementsByClassName("autocomplete-items");
			     for (var i = 0; i < x.length; i++) {
			       if (elmnt != x[i] && elmnt != inp) {
			         x[i].parentNode.removeChild(x[i]);
			       }
			     }
			   }
			   /*execute a function when someone clicks in the document:*/
			   document.addEventListener("click", function (e) {
			       closeAllLists(e.target);
			   });
			 }
		   autocomplete(document.getElementById("myInput"), ssnArray);
		</script>
		 <div class="footer">
		<p>&copy; Copyright 2019 TVM56 TJA295 Group-D</p>
	</div>
		
		<script src="main.js"></script>
</body>
</html>
		