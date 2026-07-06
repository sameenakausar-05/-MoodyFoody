<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Replace Cart</title>

<link rel="stylesheet" href="styles.css">

</head>

<body>

<div style="
width:450px;
margin:120px auto;
padding:35px;
background:white;
border-radius:15px;
text-align:center;
box-shadow:0 5px 20px rgba(0,0,0,.15);">

<h2>Your cart contains items from another restaurant.</h2>

<p>
Would you like to clear your cart and add this item?
</p>

<div style="margin-top:25px;">

<a href="replaceCart"
style="
padding:12px 25px;
background:#ff6b00;
color:white;
text-decoration:none;
border-radius:8px;
margin-right:10px;">

Replace Cart

</a>

<a href="cart.jsp"
style="
padding:12px 25px;
border:2px solid #ff6b00;
color:#ff6b00;
text-decoration:none;
border-radius:8px;">

Cancel

</a>

</div>

</div>

</body>
</html>