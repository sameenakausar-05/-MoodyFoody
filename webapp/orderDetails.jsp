<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.restaurant.model.OrderItem"%>
<%@ page import="com.restaurant.model.Menu"%>

<%
List<OrderItem> orderItems =
(List<OrderItem>)request.getAttribute("orderItems");

List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");

double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Details | MoodyFoody</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:#f4f6f9;

}

.header{

background:#E67E22;

color:white;

padding:25px;

text-align:center;

font-size:36px;

font-weight:bold;

}

.container{

width:90%;

max-width:1000px;

margin:40px auto;

}

.card{

background:white;

border-radius:20px;

padding:20px;

margin-bottom:25px;

display:flex;

align-items:center;

gap:25px;

box-shadow:0 5px 15px rgba(0,0,0,.12);

}

.card img{

width:130px;

height:130px;

border-radius:15px;

object-fit:cover;

}

.details{

flex:1;

}

.details h2{

color:#E67E22;

margin-bottom:10px;

}

.row{

display:flex;

justify-content:space-between;

margin:8px 0;

font-size:17px;

}

.total{

background:white;

padding:25px;

border-radius:20px;

box-shadow:0 5px 15px rgba(0,0,0,.12);

font-size:25px;

font-weight:bold;

display:flex;

justify-content:space-between;

}

.back{

display:inline-block;

margin-top:30px;

background:#E67E22;

color:white;

text-decoration:none;

padding:15px 35px;

border-radius:10px;

font-size:18px;

transition:.3s;

}

.back:hover{

background:#cf6b12;

}

</style>

</head>

<body>

<div class="header">

🍽 Order Details

</div>

<div class="container">

<%

for(int i=0;i<orderItems.size();i++){

OrderItem item = orderItems.get(i);

Menu menu = menuList.get(i);

grandTotal += item.getItemTotal();

%>

<div class="card">

<img src="<%=menu.getImagePath()%>">

<div class="details">

<h2><%=menu.getItemName()%></h2>

<div class="row">

<span>Price</span>

<span>₹ <%=menu.getPrice()%></span>

</div>

<div class="row">

<span>Quantity</span>

<span><%=item.getQuantity()%></span>

</div>

<div class="row">

<span>Total</span>

<span>₹ <%=item.getItemTotal()%></span>

</div>

</div>

</div>

<%

}

%>

<div class="total">

<span>Grand Total</span>

<span>₹ <%=grandTotal%></span>

</div>

<div style="text-align:center;margin-top:30px;">

<a href="invoice?orderId=<%=orderItems.get(0).getOrderId()%>" class="back">

🧾 View Invoice

</a>

</div>

<div style="text-align:center;">

<a href="orderHistory" class="back">

⬅ Back to Orders

</a>

</div>

</div>

</body>
</html>