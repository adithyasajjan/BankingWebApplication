<%@ page import="java.util.*" %>
<%@ page import="Fastag.FastagUsers" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% ArrayList<FastagUsers> fastagDetails = (ArrayList<FastagUsers>)request.getAttribute("fastagDetails"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>FastagPay</title>
	
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
			font-size: 16px;
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
             height: 350px;
             display: inline-flex;
             border-radius: 15px;
             box-shadow: 0 10px 20px -10px rgba(0,0,0,0.8);
		
		}
		
		.main .left{
               width: 250px;
               height: 350px;
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
                height: 350px;
                background: white;
                border-radius: 0 15px 15px 0;
		}
		
		.main .right .form{
                margin: 60px;
		}
		
		.main .right .form input{
                margin: 10px;
                width: 200px;
                height: 40px;
                padding: 2px;
                outline: none;
		
		}
		
		.main .right .form textarea{
				margin: 10px;
                width: 200px;
                height: 50px;
                padding: 2px;
                outline: none;
		}
		
		.main .right .form h1{
                width: 200px;
                height: 30px;
                margin: 10px;
                background: black;
                color: white;
                font-size: 18px;
                cursor: pointer;
                border: none;
				text-align:center;
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

<body>
	<section class="header">
	
	    <nav>
				<a href="FASTag.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
					
		</nav>
	
		
	    <div class="main">
	
	          <div class="left">
	
	                   <h1>Public<br><span>Bank</span></h1>
	
	          </div>
	
	          <div class="right">
	
	                    <div class="form">
	                   	             
	                   	             
	                   	        <% for(int recCount=0; recCount<fastagDetails.size(); recCount++) { %>
	                   	        	
	                   	        	<% FastagUsers fast = fastagDetails.get(recCount); %>
	                   	        	
	                   	        	<h4>Name</h4>
	                   	        	
	                   	        	<input type="text" name="uname" value=<%= fast.getName() %> >
	                   	        	
	                   	        	<h4>Vehicle name</h4> 
	                   	        
	                   	        	
	                   	        	<input type="text" name="vehiNName" value=<%= fast.getVehiName() %> >
	                   	        	
	                   	        <% } %>
	                   	                                                                            	
                                         	
                       			<a href="FastagCharge.jsp"><h1>Next</h1></a>
                       			
	                            
	                   </div>
	
	          </div>
	
	    </div>
	    
	</section>
	
</body>
</html>