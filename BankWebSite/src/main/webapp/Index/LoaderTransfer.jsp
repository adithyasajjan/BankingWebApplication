<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Loader Transfer</title>
	
	<style>
		
		body {
		margin-top:270px;
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
      
       h1 {
         color: #88B04B;
         font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
         font-weight: 900;
         font-size: 40px;
         margin-bottom: 10px;
       }
        
       p {
         color: #404F5E;
         font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
         font-size:20px;
         margin: 0;
       }    
   
	</style>
	
</head>
<body>
	<a href="SuccessTransfer.jsp">
		<div id = "myDiv"><img id = "myImage" src = "Images/loading-gif.gif"></div><br>
	</a>
	<script type = "text/javascript">
	
		setTimeout(function(){
		   document.getElementById("myDiv").style.display="none";
		}, 5000);  
	</script>
	
	

		
</body>
</html>