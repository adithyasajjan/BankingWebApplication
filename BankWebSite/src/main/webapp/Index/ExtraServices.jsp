<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Services</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
	
	<style>
	
		*{
		
               margin: 0;
               padding: 0;
               box-sizing: border-box;
               font-family: 'Poppins', sans-serif;
		
		}
			
		.header{
               
            min-height: 10vh;
			width: 100%;
			background-image: linear-gradient(rgba(4, 9, 30, 0.7), rgba(4, 9, 30, 0.7)), url('banner.jpg'); 
			background-color:white;
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

  	   .main .row{
 			 position: absolute;
             top: 50%;
             left: 50%;
             transform: translate(-50%,-50%); 
             display: inline-flex;
           	 margin-bottom: 5px;
		}  
		
		.row{
			margin-top: 5%;
			display: flex;
			justify-content: space-between;
			margin-top:30%;
		}
	
		.img1{
			flex-basis: 31%;
			background-color: #fff3f3; 
			border-radius: 10px; 
			margin-bottom: 5%;
			padding: 20px 12px;
			box-sizing: border-box;
			transition: 0.0s;
			
		}
		
		.img1{
			margin-left:50px;
		}
		
		.img1 img {
		
			width: 200px;
			height: 200px;
			padding: 15px;
		}
		
		.img2 img {
		
			width: 200px;
			height: 200px;
		}
		
		.img3 img {
		
			width: 200px;
			height: 200px;
		}
		
		.img1 h3{
			color:black;
			text-align: center;
		}
		
		.text-box {
			width:90%;
			color: black;
			position:absolute;
			/* top: 10%; */ 
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
			 margin-top:-10%; 
			
		}
		
		.img1 a{
			text-decoration: none;
		}	 
		
		
		.img1 a:hover{
		
			color: pink;
		}
		
		.img1:hover{
		
			box-shadow: 0 0 20px  5px rgba(0,0,0,2);
		}
	
	</style>
	
</head>
<body>

	<form action="PayBill" method="get">
	<section class="header">
	
	    <nav>
				<a href="Functions.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
				<div class="nav-links">
						<ul>
							
							<li><a href="Functions.jsp">HOME</a></li>
							
						</ul>
				</div>
					
		</nav>
		
	 	
		
		<section class="main">
			
			<div class="row"> 
			
				<div class="text-box">
					<h2>Payment categories</h2><br><br>
				</div> 
			
			    <div class="img1">
					<a href="PayBill.jsp"><img src="Images/electricity-recharge.png" alt="electricty-recharge"></a>
					<h3>Electricity</h3>
			     </div>
			     
			     
			     <div class="img1">
			     	<a href="MobileRecharge.jsp"><img src="Images/mobile-recharge.jpg" alt="mobile-recharge"></a>
			     	<h3>Mobile recharge</h3>
			     </div>
			     
			     <div class="img1">
			     	<a href="FASTag.jsp"><img src="Images/FasTag-recharge.png" alt="fastag-recharge"></a>
			     	<h3>FASTag recharge</h3>
			     </div>	
			     	
			    </div>
				
		  </section>
	    
	</section>
</form>

</body>
</html>