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
		
		body {
			
			font-family: sans-serif;
			text-align: center;
		}
		
		nav img:hover {
			opacity: 0.3;
			filter: alpha(opacity=30);
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
		
		input {
			width: 200px;
            height: 30px;
            margin: 10px;
            background: black;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border: none;
		}
		
		tr:nth-child(even) {background: #CCC}
		tr:nth-child(odd) {background: #FFF}
		
	</style>
	
</head>

<body>
	
	<nav>
			<a href="Functions.jsp"><img src="Images/horizontal_on_white_by_logaster.png" alt="bank logo"></a>
				
	</nav>
	
	<h1 style="color:black;font-size=30px; margin-left:50px;">BANK STATEMENT</h1><br>
	
	<table id="example-table" border="1" style="width: 80%">
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
	
	<input type="button" onclick="generate()" value="Print"/>
	<script>
	function generate() {
	    var doc = new jsPDF('p', 'pt', 'a4');
	    var htmlstring = '';
	    var tempVarToCheckPageHeight = 0;
	    var pageHeight = 0;
	    pageHeight = doc.internal.pageSize.height;
	    specialElementHandlers = {
	        '#bypassme': function (element, renderer) {
	            return true
	        }
	    };
	    margins = {
	        top: 150,
	        bottom: 60,
	        left: 40,
	        right: 40,
	        width: 700
	    };
	    var y = 20;
	    doc.setLineWidth(2);
	    doc.text(200, y = y + 30, "Transactions");
	    doc.autoTable({
	        html: '#example-table',
	        startY: 70,
	        theme: 'grid',
	        columnStyles: {
	            0: {
	                cellWidth: 90,
	            },
	            1: {
	                cellWidth: 50,
	            },
	            2: {
	                cellWidth: 60,
	            },
	            3: {
	                cellWidth: 100,
	            },
	            4: {
	                cellWidth: 50,
	            },
	            5: {
	                cellWidth: 50,
	            }
	        },
	        styles: {
	            minCellHeight: 40
	        }
	    })
	    doc.save('<%= name %>.pdf');
	}
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
</body>
</html>