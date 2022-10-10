<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Functions</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
	
	<style> 
		*{
			margin: 0;
			padding: 0;
			font-family: 'Poppins', sans-serif;
			
		}
		
	   .header{
			min-height: 10vh;
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
		
		.services {
			padding:30px;
		}
		.row {
			margin-top: 5%;
			display: flex;
			justify-content: space-between;
		}
		
		.row2 {
			margin-top: 3%;
			display: flex;
			justify-content: space-between;
		}
		.services-col {
			flex-basis: 31%;
			background: #fff3f3;
			border-radius: 8px;
			margin-bottom: 5%;
			padding: 20px 12px;
			box-sizing: border-box;
			transition: 0.0s;
		}
		
		.services-col a {
		
			text-decoration: none;
			color: black;
		}
		
		.services-col a:hover {
			
			color: pink;
		}
		
		h3{
			text-align: center;
			font-weight: 600;
			margin: 10px 0;
		}
		
		.services-col:hover{
			box-shadow: 0 0 20px  0px rgba(0,0,0,2);
		}
		
	</style>
	
</head>
<body>
		<section class="header">
			<nav>
				<a href="Functions.jsp"><img src="horizontal_on_white_by_logaster.png" alt="bank logo"></a>
					<div class="nav-links">
						<ul>
							<li><a href="AccountDetails">ACCOUNT DETAILS</a></li>
							<li><a href="Logout">LOG OUT</a></li>
							
						</ul>
					</div>
					
			</nav>
		</section>
		
		<section class="services">
		
			<div class="row">
			
				<div class="services-col">
					<a href="Deposit.jsp"><h3>ONLINE DEPOSIT</h3></a>
					<p>Online Bank deposit service saves you a lot of time as you do not
					 have to write a deposit form and submit to the bank. Enter the amount to be withdrawn,
					  followed by the 4-digit pin and description for what the money is required.
					 </p>
				</div>
				
				<div class="services-col">
					<a href="Transfer.jsp"><h3>TRANSFER AMOUNT</h3></a>
					<p>Online Bank transfer money service saves you a lot of time as you do not 
					have to write a check and money can be transferred online. Enter the beneficiary's 
					account number, amount to be transfered and the 4-digit pin. The rest safe transaction 
					is taken by our bank. 
					</p>
				</div>
				
				<div class="services-col">
					<a href="Withdraw.jsp"><h3>ONLINE WITHDRWAL</h3></a>
						
					<p>Our bank offers a service to withdraw amount online, which saves a lot of time in waiting queue in ATM's.
					Enter the amount to be withdrawn, followed by the 4-digit pin and description for what the money is required.
					If you follow these steps, amount can be easily and safely withdrawn.
					</p>
					
				</div>
	
					
			</div>
			
			<div class="row2">
				
					
				
				<div class="services-col">
					<a href="ExtraServices.jsp"><h3>PAY BILLS</h3></a>
						
					<p>Our bank offers a convenient platform for hassle-free bill payments.You can pay any bills online without
					any human intervention. You also won't need to take cash or checks to the bank. It is possible to pay for
					services online at any time of the day or night, from anywhere in the world.
					</p>
					
				</div>	
				
				<div class="services-col">
					<a href="Transaction.html"><h3>TRANSACTION DETAILS</h3></a>
						
					<p>Our bank offers a convenient platform to view the bank statement or the transaction details.Enter
					the pin and the table of transaction details will be displayed. You can also download the statement or 
					transaction details.
					</p>
					
				</div>	
				
				<div class="services-col">
					<a href="Balance.jsp"><h3>SHOW BALANCE</h3></a>
						
					<p>
					Is it possible to check your account balance any time online by logging on to the official website ?
					The answer is YES, just by logging into the website using username and password then use the pin to check 
					the balance.
					
					</p>
					
				</div>	
				
				
			</div>
			
		</section>
		
	
	<script type = "text/javascript" >
	
	    function preventBack() { window.history.forward(); }
	    setTimeout("preventBack()", 0);
	    window.onunload = function () { null };
	    
	</script>
	
</body>
</html>