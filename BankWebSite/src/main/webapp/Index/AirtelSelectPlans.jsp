<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String tag = "Rs."; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Airtel Select Plans</title>
	
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
			background-image: linear-gradient(rgba(4, 9, 30, 0.7), rgba(4, 9, 30, 0.7)), url('banner.jpg');
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
             top: 65%;
             left: 50%;
             transform: translate(-50%,-50%);
             width: 500px;
             height: 500px;
             display: inline-flex;
             
             border-radius: 15px;
             box-shadow: 0 10px 30px -10px rgba(0,0,0,0.8); 
		
		}
		
		span{
		
		        color: white;
		
		}
		
		.jioLogo{
			 position: absolute;
             align:center;
             left: 45%;
             bottom:60%;
		}
		
		.jioLogo img{
			width: 150px;
			height: 150px;
			padding: 15px;
		}
		
		.jioLogo h1{
			color:white;
		}
		
		.main .plan {
			
		}
		
		.main .plan p{
			color:white;
		}
		
		.main .plan h3{
			color:white;
		}
		
		.main .plan label{
			color:white;
			font-size:20px;
		}	
		
		.main .right .form button{
                width: 200px;
                height: 30px;
                margin: 30px;
                background: black;
                color: white;
                font-size: 18px;
                cursor: pointer;
                border: none;
                

		}
		
		.main h1{
			color:white;
		}
		
		.main .plan button{
		
                width: 200px;
                height: 30px;
                margin: 20px;
                background: white;
                color: black;
                font-size: 18px;
                cursor: pointer;
                border: none;
                margin-left: 140px;

		}
	
	</style>
	
</head>
<body>
<form action="Recharge" method="Get">
	<section class="header">
	
	    <nav>
				<a href="MobileRecharge.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
					
		</nav>
		
		<div class="jioLogo">
		
			<img src="Images/AirtelLogo.png" alt="Airtel Prepaid">
			<h1>Airtel Prepaid</h1><br>
			<h1>Select plan</h1><br>
			
		</div>
		
	    <div class="main">
   			
			<div class="plan">
			
				 <input type="radio" name="amount" value="839">
	     		 <label for="839" ><%= tag %> 839</label> 
	     		 <h3>Validity: 84 days</h3>
				 <p>Data: 2GB/day | Voice: Unlimited calls | SMS: 100 SMS per day| <br> Validity: 84days | Xstream channel on Airtel Xstream App, Disney+ Hotstar Mobile, Free Hellotunes; Wynk Music Free</p> 
				 
				 <br>
				 
				 <input type="radio" name="amount" value="666">
	     		 <label for="666" ><%= tag %> 666</label> 
	     		 <h3>Validity: 84 days</h3>
				 <p>Data: 1.5GB/day | Voice: Unlimited calls| SMS: 100 SMS per day| <br> Validity: 84days | Get Rs. 100 cashback on FASTag | Free Hellotunes; Wynk Music Free</p> 
				 
				 <br>
				 
				 <input type="radio" name="amount" value="209">
	     		 <label for="209" ><%= tag %> 209</label> 
	     		 <h3>Validity: 28 days</h3>
				 <p>Data: 1GB/day | Voice: Unlimited calls| SMS: 100 SMS per day| <br> Validity: 28days | Free Hellotunes; Wynk Music Free</p> 
				 
				 <br>
				 
				 <button>Next</button><br><br>
				 
			</div>
			
	    </div>
	</section>
</form>
</body>
</html>