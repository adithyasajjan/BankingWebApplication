<%@ page import="java.util.*" %>
<%@ page import="Transaction.TransactionUser" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% ArrayList<TransactionUser> TransDetails = (ArrayList<TransactionUser>)request.getAttribute("TransDetails"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Transaction Details</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
	
	<style> 
		*{
			margin: 0;
			padding: 0;
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
		
		.container {
			float:center;
			position:relative;
			margin-left:200px;
		}
		
		.selected {
			 background-color: blue; 
			 font-weight:bold;
			 color:#fff;
		}
		
		tr{
			cursor:pointer;
			transition:all .25s erase-in-out;
		}
		
		#d1-pdf {
			padding: 4px;
		}
		
	</style>

</head>
<body>
	<section class="header">
		<nav>
		
			<a href="Functions.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
				
		</nav>
		
		<div class="container">
			<h1 style="color:white;font-size=30px">BANK STATEMENT</h1><br><br>
			
			<button id="d1-pdf" type="submit">Print</button>
			
				<table id="table" style=width:80% border="1">
					<tr style="background-color: blueviolet; color: white; font-weight: bold; text-align:center">
						<td>DATE</td>
						<td>PAID TO</td>
						<td>AMOUNT</td>
						<td>DESCRIPTION</td>
						<td>Dr/Cr</td>
						<td>BALANCE</td>
					</tr>
			
					<% for(int recCount=0; recCount<TransDetails.size(); recCount++) { %>
						<tr style="color:white">
							<% TransactionUser tran = TransDetails.get(recCount); %>
							<td style="text-align:center;"><%= tran.getDt() %></td>
							<td style="text-align:center;"><%= tran.getToName() %></td>
							<td style="text-align:center;"><%= tran.getAmount() %></td>
							<td style="text-align:center;"><%= tran.getDescrip() %></td>
							<td style="text-align:center;"><%= tran.getDrORCr() %></td>
							<td style="text-align:center;"><%= tran.getBalance() %></td>
						<tr>
						
					<% } %>
					
				</table>
		</div>
	</section>
	
	<script src="html2pdf.bundle.min.js"></script>
	
	<script type="text/javascript">
		document.getElementById('d1-pdf').onclick = function() {
			var element = document.getElementById('table');
			
			var opt = {
				margin: 			1,
				filename: 			'BankStatement.pdf',
				image: 				{ type: 'jpeg', quality: 0.98 },
				html2canvas: 		{scale: 2},
				jsPDF: 				{unit: 'in', format: 'letter', orientation: 'portrait'}	
			};
			
			html2pdf(element, opt);
		};
		
	</script>
	
	<script>
		function selectedRow(){
			
			var index, table;
			table = document.getElementById("table");
			for(var i=0; i<table.rows.length; i++)
			{
				table.rows[i].onclick = function()
				{
					if(typeof index !== "undefined"){
						table.rows[index].classList.toggle("selected");
					}
					index = this.rowIndex;
					this.classList.toggle("selected");
					console.log(index);
				};
			}
		}
		
		selectedRow();
	</script>
	
</body>
</html>