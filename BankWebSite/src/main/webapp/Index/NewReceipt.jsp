<%@ page import="java.util.*" %> 
<%@ page import="PayBill.PayBillUser" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% ArrayList<PayBillUser> billDetails = (ArrayList<PayBillUser>) request.getAttribute("ReceiptDetails"); %>
<% String name = (String)request.getSession().getAttribute("ReceipientName"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt</title>

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
			background-image: linear-gradient(rgba(4, 9, 30, 0.7), rgba(4, 9, 30, 0.7)), url('Images/banner.jpg'); 
			background-color:white;
			background-position: center;
			background-size: cover;
			position: relative;
		}
		
		body {
			
			font-family: sans-serif;
			text-align: center;  
		}
		
		body h1{
			margin-left:30px;
		}
		
		nav img:hover {
			opacity: 0.3;
			filter: alpha(opacity=30);
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
			padding: 5px;
		}
		
		button {
			width: 100px;
            height: 30px;
            margin: 10px;
            background: black;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border: none;
            margin-left:20px;
		}
		
		table {
		
			padding:50px;
			border-collapse:seperate;
			border-spacing:0 1em;
			border-style:solid;
			
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
		
	</style>
</head>
<body>
		<nav>
				<a href="PayBill.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
					
		</nav>
	
	<br><br>
	
	<h1 style="color:black;font-size:30px;">RECEIPT</h1><br>
	
	
	<table id="example-table">
		<tbody>
				<% for(int recCount=0; recCount<billDetails.size(); recCount++) { %>
					
						<% PayBillUser pb = (PayBillUser)billDetails.get(recCount); %>
						
						<tr><td></td></tr>	
						<tr><td></td></tr>
						<tr><td>Name : </td><td></td><td><%= pb.getName() %></td></tr>
						<tr><td>Consumer Number : </td><td></td><td><%= pb.getConsNum() %></td></tr>
						<tr><td></td></tr>	
						<tr><td></td></tr>
						 
						<TH COLSPAN=5><hr> 
						
						<tr><td></td></tr>	
						<tr><td></td></tr> 
						
						<tr><td>Electricity Biller : </td><td></td><td><%= pb.getElecProvider() %></td></tr>
						<!-- <tr><td></td></tr>	
						<tr><td></td></tr> -->
						<tr><td>Consumption : </td><td></td><td><%= pb.getConsump() %> units</td></tr>
						<!-- <tr><td></td></tr>	
						<tr><td></td></tr> -->
						<tr><td>Bill Date : </td><td></td><td><%= pb.getBd() %></td></tr>
						<!-- <tr><td></td></tr>	
						<tr><td></td></tr> -->
						<tr><td>Bill Due Date : </td><td></td><td><%= pb.getBdd() %></td></tr>
						
						<tr><td>Payment Date : </td><td></td><td><%= pb.getPd() %></td></tr>
						
						<tr><td>Payment Status : </td><td></td><td><%= pb.getStatus() %></td></tr>
						<tr><td></td></tr>	
						<tr><td></td></tr> 
						
						<TH COLSPAN=5><hr>
						
						<tr><td></td></tr>	
						<tr><td></td></tr> 		
						<%-- <tr style="color:white;"><td>Payment Date : </td><td style="text-align:center;"><%= pb.getPd() %></td></tr>
						<tr><td></td></tr>	
						<tr><td></td></tr> --%>
						<tr><td>Bill Amount : </td><td></td><td>Rs. <%= pb.getAmount() %></td></tr>
						<tr><td></td></tr>	
						<tr><td></td></tr>
						 	
				<% } %>
				
		</tbody>
		
	</table><br>
	
	<button id="d1-pdf">Print</button>
	
	
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
	
</body>	
</html>