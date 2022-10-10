<%@ page import="java.util.*" %>
<%@ page import="Transaction.TransactionUser" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% ArrayList<TransactionUser> TransDetails = (ArrayList<TransactionUser>)request.getAttribute("TransDetails"); %>

<% String name = (String)request.getSession().getAttribute("username"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>

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
		
		body {
			
			font-family: sans-serif;
			text-align: center;
		}
		
		nav img:hover {
			opacity: 0.3;
			filter: alpha(opacity=30);
		}
		
		.border{
		
			width: 800px;
		    border: 15px solid black;
		    padding: 50px;
		    margin-top: 0px;
		    text-align:center;
		    margin-left:430px;
		}
		
		
		th {
			background-color: rgb(211, 211, 211);
		}
		
		#example-table {
			border-collapse: collapse;
			margin: auto;
			font-size: medim;
		}
		
		#example-table td, #example-table th {
			border: 1px, solid #ddd;
			padding: 6px;
		}
		
		#d1-pdf {
			padding: 4px;
		}
		
		nav{
			display: flex;
			padding: 2% 6%;
			justify-content: space-between;
			align-items: center;
		}
		
		nav img {
			width: 150px;
		}
		
		tr:nth-child(even) {background: #CCC}
		tr:nth-child(odd) {background: #FFF}
		
	</style>
	
</head>
<body>
	
	<section class="header">
			<nav>
					<a href="Functions.jsp"><img src="horizontal_on_white_by_logaster.png" alt="bank logo"></a>
						
			</nav>
	</section>	
	<br>
	<h1 style="color:black;font-size=30px; margin-left:50px;">BANK STATEMENT</h1><br>
	
	<div class="border">
		<table id="example-table" border="1">
			<thead>
				<tr>
					<td>DATE</td>
					<td>PAID TO</td>
					<td>AMOUNT</td>
					<td>DESCRIPTION</td>
					<td>Dr/Cr</td>
					<td>BALANCE</td>
				</tr>
			</thead>
			
			<tbody>
			
				<% for(int recCount=0; recCount<TransDetails.size(); recCount++) { %>
					<tr>
						<% TransactionUser tran = TransDetails.get(recCount); %>
						<td><%= tran.getDt() %></td>
						<td><%= tran.getToName() %></td>
						<td><%= tran.getAmount() %></td>
						<td><%= tran.getDescrip() %></td>
						<td><%= tran.getDrORCr() %></td>
						<td><%= tran.getBalance() %></td>
					</tr>
					
				<% } %>
				
			</tbody>
		
		</table> <br>
		
		<button id="d1-pdf">Print</button>
	
	</div>


	
	<script src="html2pdf.bundle.min.js"></script>
	
	<script type="text/javascript">
		document.getElementById('d1-pdf').onclick = function() {
			var element = document.getElementById('example-table');
			
			var opt = {
				margin: 			1,
				filename: 			'<%= name %>.pdf',
				image: 				{ type: 'jpeg', quality: 0.98 },
				html2canvas: 		{scale: 2},
				jsPDF: 				{unit: 'in', format: 'letter', orientation: 'portrait'}	
			};
			
			html2pdf(element, opt);
		};
		
	</script>
	
	<script type = "text/javascript" >
	
	    function preventBack() { window.history.forward(); }
	    setTimeout("preventBack()", 0);
	    window.onunload = function () { null };
	    
	</script>
	
</body>
</html>