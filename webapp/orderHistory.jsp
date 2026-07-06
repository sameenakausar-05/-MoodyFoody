<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.Order"%>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order History | MoodyFoody</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
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

    padding:20px;

    text-align:center;

    font-size:30px;

    font-weight:bold;

    box-shadow:0 3px 10px rgba(0,0,0,.15);

}

.container{

    width:90%;

    max-width:1100px;

    margin:40px auto;

}

.order-card{

    background:white;

    border-radius:15px;

    padding:25px;

    margin-bottom:25px;

    box-shadow:0 4px 15px rgba(0,0,0,.08);

    transition:.3s;

}

.order-card:hover{

    transform:translateY(-5px);

}

.row{

    display:flex;

    justify-content:space-between;

    margin:10px 0;

    color:#333;

}

.label{

    font-weight:600;

}

.status{

    color:green;

    font-weight:bold;

}

.empty{

    text-align:center;

    font-size:22px;

    color:#777;

    margin-top:80px;

}

.back-btn{

    display:inline-block;

    margin-top:30px;

    background:#E67E22;

    color:white;

    text-decoration:none;

    padding:12px 30px;

    border-radius:8px;

    transition:.3s;

}

.back-btn:hover{

    background:#cf6b12;

}

</style>

</head>

<body>
<jsp:include page="navbar.jsp"/>
<div class="header">

📜 My Orders

</div>

<div class="container">

<%

if(orders == null || orders.isEmpty()){

%>

<div class="empty">

No Orders Found 😔

<br><br>

<a href="restaurants" class="back-btn">

Order Now

</a>

</div>

<%

}else{

for(Order order : orders){

%>

<div class="order-card">

<div class="row">

<span class="label">Order ID</span>

<span>#<%=order.getOrderId()%></span>

</div>

<div class="row">

<span class="label">Restaurant ID</span>

<span><%=order.getRestaurantId()%></span>

</div>

<div class="row">

<span class="label">Order Date</span>

<span><%=order.getOrderDate()%></span>

</div>

<div class="row">

<span class="label">Payment</span>

<span><%=order.getPaymentMethod()%></span>

</div>

<div class="row">

<span class="label">Status</span>

<span class="status">

<%=order.getStatus()%>

</span>

</div>

<div class="row">

<span class="label">Total Amount</span>

<span>

₹ <%=String.format("%.2f",order.getTotalAmount())%>

</span>

</div>
<div style="margin-top:20px; text-align:right;">

<a href="orderDetails?orderId=<%=order.getOrderId()%>"
style="
background:#E67E22;
color:white;
padding:10px 22px;
text-decoration:none;
border-radius:8px;
font-weight:600;">

View Details

</a>

</div>

</div>

<%

}

}

%>

<div style="text-align:center;">

<a href="index.jsp" class="back-btn">

🏠 Back to Home

</a>

</div>

</div>

</body>
</html>