<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.restaurant.model.*"%>

<%
Order order = (Order)request.getAttribute("order");
User user = (User)request.getAttribute("user");
Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");

List<OrderItem> orderItems =
(List<OrderItem>)request.getAttribute("orderItems");

List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");

double grandTotal=0;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Invoice | MoodyFoody</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:#ececec;

padding:40px;

}

.invoice{

width:900px;

margin:auto;

background:white;

padding:40px;

border-radius:15px;

box-shadow:0 10px 30px rgba(0,0,0,.15);

}

.header{

text-align:center;

border-bottom:2px dashed #ccc;

padding-bottom:20px;

margin-bottom:30px;

}

.header h1{

color:#E67E22;

font-size:42px;

}

.header p{

color:#777;

}

.section{

display:flex;

justify-content:space-between;

margin-bottom:30px;

}

.section div{

width:48%;

}

.section h3{

color:#E67E22;

margin-bottom:10px;

}

table{

width:100%;

border-collapse:collapse;

margin-top:20px;

}

table th{

background:#E67E22;

color:white;

padding:12px;

}

table td{

padding:12px;

border-bottom:1px solid #ddd;

text-align:center;

}

.total{

text-align:right;

margin-top:25px;

font-size:24px;

font-weight:bold;

color:#2c3e50;

}

.buttons{

margin-top:40px;

text-align:center;

}

.btn{

display:inline-block;

padding:15px 35px;

margin:10px;

background:#E67E22;

color:white;

text-decoration:none;

border-radius:10px;

font-size:18px;

cursor:pointer;

border:none;

transition:.3s;

}

.btn:hover{

background:#cf6b12;

}

@media print{

body{

background:white;

}

.buttons{

display:none;

}

.invoice{

box-shadow:none;

width:100%;

}

}

</style>

</head>

<body>

<div class="invoice">

<div class="header">

<h1>MoodyFoody</h1>

<p>Food Order Invoice</p>

</div>

<div class="section">

<div>

<h3>Customer</h3>

<p><b><%=user.getUsername()%></b></p>

<p><%=user.getEmail()%></p>

<p><%=user.getAddress()%></p>

</div>

<div>

<h3>Restaurant</h3>

<p><b><%=restaurant.getName()%></b></p>

<p><%=restaurant.getCuisineType()%></p>

<p><%=restaurant.getAddress()%></p>

</div>

</div>

<div class="section">

<div>

<h3>Order Details</h3>

<p>Order ID :
<b><%=order.getOrderId()%></b></p>

<p>Status :
<b><%=order.getStatus()%></b></p>

</div>

<div>

<h3>Payment</h3>

<p>Method :
<b><%=order.getPaymentMethod()%></b></p>

<p>Total :
<b>₹ <%=order.getTotalAmount()%></b></p>

</div>

</div>

<table>

<tr>

<th>Food Item</th>

<th>Price</th>

<th>Qty</th>

<th>Total</th>

</tr>

<%

for(int i=0;i<orderItems.size();i++){

OrderItem item=orderItems.get(i);

Menu menu=menuList.get(i);

grandTotal+=item.getItemTotal();

%>

<tr>

<td><%=menu.getItemName()%></td>

<td>₹ <%=menu.getPrice()%></td>

<td><%=item.getQuantity()%></td>

<td>₹ <%=item.getItemTotal()%></td>

</tr>

<%

}

%>

</table>

<div class="total">

Grand Total :
₹ <%=grandTotal%>

</div>

<div class="buttons">

<button class="btn" onclick="window.print()">

🖨 Print Invoice

</button>

<a href="orderHistory" class="btn">

⬅ Back

</a>

</div>

</div>

</body>

</html>