<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SuccessTick</title>
</head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    
    <style>
      body {
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
		
    /*   i {
      
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      } */
      
	  .checkmark {
	      display: inline-block;
	      transform: rotate(45deg);
	      height: 120px;
	      width: 40px;
	      margin-left: 0%; 
	      border-bottom: 7px solid #88B04B;
	      border-right: 7px solid #88B04B;
	      margin-top:20px;
	  }
      
      button {
      	width: 200px;
        height: 30px;
        margin: 10px;
        background: black;
        color: white;
        font-size: 18px;
        cursor: pointer;
        border: none;
      }
      
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
    </style>
</head>
    
<body>
<form action="SuccessTick" method="Post">

      <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <div class="checkmark"></div>
      </div>
        <h1>Success</h1> 
        <p>Payment successful</p><br>
        <button>okay</button>
      </div>
 
</form>
</body>

</html>