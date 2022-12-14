<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Transfer.TransferDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="Transfer.Util" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <% String bname = (String) request.getSession().getAttribute("BenName"); %> --%>


<!DOCTYPE html>

<html>

<head>
	<title>Transfer</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
	
	<style>
	
		*{
		
               margin: 0;
               padding: 0;
               box-sizing: border-box;
               font-family: 'Poppins', sans-serif;
		
		}
			
		.header{
               
            min-height: 100vh;
			width: 100%;
			background-image: linear-gradient(rgba(4, 9, 30, 0.7), rgba(4, 9, 30, 0.7)), url('Images/banner.jpg');
			background-position: center;
			background-size: cover;
			position: relative;
		}
		
		nav{
			
			display: flex;
			padding: 2% 6%;
			justify-content: space-between;
			align-items: center;
		}
		
		nav img{
			width: 150px;
		}
		
		nav img:hover {
			opacity: 0.3;
			filter: alpha(opacity=30);
		}
		
		.nav-links{
			flex: 1;
			text-align: right;
		}
		
		.nav-links ul li{
			list-style: none;
			display: inline-block;
			padding: 8px 12px;
			position: relative;
		}
		
		.nav-links ul li a{
			color: white;
			text-decoration: none;
			font-size: 16	px;
		}
		
		.nav-links ul li::after{
			content: '';
			width: 0%;
			height: 2px;
			background: #f44336;
			display: block;
			margin: auto;
			transition: 0.5s;
		}
		
		.nav-links ul li:hover::after{
			width: 100%;	
		}
		
		
		.form a{
		
			color: white;
			text-decoration: none;
			font-size: 16	px;
		}

		.main{
			 position: absolute;
             top: 50%;
             left: 50%;
             transform: translate(-50%,-50%);
             width: 600px;
             height: 500px;
             display: inline-flex;
             border-radius: 15px;
             box-shadow: 0 10px 20px -10px rgba(0,0,0,0.8);
		
		}
		
		.main .left{
               width: 250px;
               height: 500px;
               background: url(background.jpg);
               box-sizing: border-box;
               border-radius: 15px 0 0 15px;
		
		}
		
		.main .left h1{
               margin: 45px;
               color: white;
			   text-shadow: 0px 2px 5px black;
		
		}
		
		span{
		
		        color: white;
		
		}
		
		.main .right{
                width: 350px;
                height: 500px;
                background: white;
                border-radius: 0 15px 15px 0;
		}
		
		.main .right .form{
                margin: 30px;
		}
		
		.main .right .form input{
                margin: 10px;
                width: 200px;
                height: 30px;
                padding: 2px;
                outline: none;
		
		}
		
		.main .right .form button{
                width: 200px;
                height: 30px;
                margin: 10px;
                background: black;
                color: white;
                font-size: 18px;
                cursor: pointer;
                border: none;

		}
		
		.main .right .form p{
		        margin: 20px;
		}
		
		.main .right .form a{
                color: grey;
                text-decoration: none;
		
		}
	
	</style>

</head>

<body onload = "getAccounts();">
<form action="Transfer" method="Post">
	<section class="header">
	
	    <nav>
				<a href="Functions.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
					
		</nav>
	
		
	    <div class="main">
	
	          <div class="left">
	
	                   <h1>Public<br><span>Bank</span></h1>
	
	          </div>
	
	          <div class="right">
	
	                    <div class="form">
	
	                            <h1>Online<br>Money Transfer</h1><br>
	 							
	                   	             
	                   	        <input type="number" onkeyup="getName();" id="accNo" name="accNo" placeholder="Account Number"><br>
	                   	        
	                   	       <%--  <% 
	                   	        	
	                   	     	   TransferDao td = new TransferDao();
	                   	        
	                   	           response.setContentType("text/html");
	                   			   PrintWriter system = response.getWriter();
	                   			   
	                   			   int BeaccNo = Integer.parseInt(request.getParameter("accNo"));
	                   			   
	                   			   String beName = td.benName(BeaccNo);
	                   			   
	                   			   system.println(" <input type=text  name=BenName placeholder=Beneficiary Name value='"+beName+"'><br> ");
	                   			                    			   
	                   			%> --%>
	                   	                                            	
                            	<input type="text" name="BenName" id="BenName" placeholder="Beneficiary Name" ><br>
                            	
                               	<input type="number" name="amount" placeholder="Enter Amount" required><br>
                               	
                               	<input type="password" name="pincode" id="pincode" placeholder="Enter pin" maxlength="4" required><br>
                               	                             	
                               	<input type="text" name="description" placeholder="Description"><br>
                            	
                                                       	 
                       			<button>Transfer</button><br>
                       			
                       			<% boolean flag1 = Boolean.parseBoolean(request.getParameter("flag1")); %>
                       			
                       			<% boolean flag2 = Boolean.parseBoolean(request.getParameter("flag2")); %>
                       			
                       			<% boolean flag3 = Boolean.parseBoolean(request.getParameter("flag3")); %>
                       			
                       			<% boolean flag4 = Boolean.parseBoolean(request.getParameter("flag4")); %>
                       			
                       			<% if(flag1 == true) { %>
                            		
                            		<%-- <% String str = "Invalid credentials ! "; %> --%>
                            		<h3 style="color:red; margin-left:20px"> Cannot transfer money into the same account ! </h3>
                            		
                            	<% } %>
                            	
                            	<% if(flag2 == true) { %>
                            		
                            		<%-- <% String str = "Invalid credentials ! "; %> --%>
                            		<h3 style="color:red; margin-left:10px"> Incorrect pin! Try again </h3>
                            		
                            	<% } %>
                            	
                           		<% if(flag3 == true) { %>
                           		
                           		<%-- <% String str = "Invalid credentials ! "; %> --%>
                           			<h3 style="color:red; margin-left:10px"> Maintain a minimum balance of Rs. 1000 </h3>
                            		
                            	<% } %>
                            	
                            	<% if(flag4 == true) { %>
                           		
                           		<%-- <% String str = "Invalid credentials ! "; %> --%>
                           			<h3 style="color:red; margin-left:20px"> Insufficient funds ! </h3>
                            		
                            	<% } %>
                       				
	                    </div>
	
	          </div>
	
	    </div>
	</section>
</form>

<script>
const nameArray = [];
const accountNumberArray = [];
const accounts = new Map();
	function getAccounts(){
		
		<%
		Statement stat = Util.getConnection().createStatement();
		
		String sql = "select * from Beneficiary";
		ResultSet rs = stat.executeQuery(sql);
		
		while(rs.next()){
			%>
			
			accountNumberArray.push(<%=rs.getInt(1)%>);
			nameArray.push("<%=rs.getString(2)%>");
			
			accounts.set(<%=rs.getInt(1)%> , "<%=rs.getString(2)%>" );
			<%
		}
		%>
	}
	
	function getName(){
		var i=0;
		console.log(nameArray);
		var accountNumber = document.getElementById("accNo").value;
		for(i=0; i< accountNumberArray.length; i++){
			if(accountNumber == accountNumberArray[i]){
				document.getElementById("BenName").value = nameArray[i];
				break;
			}
		}
	}
	
</script>
</body>


</html>