<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.restaurant.model.*"%>
<%@page import="java.util.*"%>

<%@ page import="com.restaurant.model.Cart" %>
<%@ page import="com.restaurant.model.CartItem" %>
<%@ page import="java.util.*" %>

<%
Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="styles.css">

<style>
html{

    min-height:100%;

}
.cart-page{

    width:90%;

    max-width:1200px;

    margin:auto;

}
body{

    margin:0;

    padding:30px;

    font-family:'Poppins',sans-serif;

    background:linear-gradient(75deg,#ff7a00,#ffb347);

    min-height:100vh;

}
.cart-card{

    display:flex;

    align-items:center;

    gap:25px;

    background:white;

    padding:25px;

    border-radius:22px;

    margin-bottom:25px;

    box-shadow:0 12px 30px rgba(0,0,0,.12);

    transition:.35s;

}
.cart-card:hover{

    transform:translateY(-8px);

    box-shadow:0 18px 40px rgba(0,0,0,.18);

}
.food-img{

    width:180px;

    height:180px;

    object-fit:cover;

    border-radius:18px;

    transition:.4s;

}
.cart-card:hover .food-img{

    transform:scale(1.05);

}
.food-details{

    flex:1;

}
.food-details h3{

    font-size:28px;

    color:#2C3E50;

    margin-bottom:12px;

}
.price{

    display:inline-block;

    color:black;

    padding:8px 18px;

    border-radius:25px;

    font-size:18px;

    font-weight:700;

    margin-bottom:18px;

}
.quantity-section{

    display:flex;

    align-items:center;

    gap:18px;

    margin:20px 0;

}
.qty-btn{

    width:42px;

    height:42px;

    display:flex;

    justify-content:center;

    align-items:center;

    background:#E67E22;

    color:white;

    text-decoration:none;

    border-radius:50%;

    font-size:24px;

    font-weight:bold;

    transition:.3s;

}
.qty{

    font-size:22px;

    font-weight:700;

    color:#2C3E50;

    min-width:30px;

    text-align:center;

}
.container{
    width:80%;
    margin:auto;
}

.cart-title{
	color:white;
}
.cart-item{

    background:white;

    padding:20px;

    margin-bottom:15px;

    border-radius:10px;

    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}
.add-more-btn{

    display:inline-block;

    padding:16px 32px;

    background:white;

    color:#E67E22;

    border:2px solid #E67E22;

    border-radius:15px;

    text-decoration:none;

    font-size:18px;

    font-weight:600;

    transition:.3s;

}

.add-more-btn:hover{

    background:#E67E22;

    color:white;

}
.bill-card{

    background:white;

    border-radius:22px;

    padding:30px;

    margin-top:35px;

    box-shadow:0 15px 35px rgba(0,0,0,.12);

}
.bill-card h2{

    color:#2C3E50;

    font-size:32px;

    margin-bottom:25px;

}
.bill-row{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:15px 0;

    font-size:18px;

    color:#555;

}
.grand-total{

    margin-top:20px;

    padding:20px;


    border-radius:16px;

    font-size:24px;

    font-weight:700;

    color:#E67E22;

}
.total{

    font-size:24px;

    font-weight:bold;

    margin-top:20px;
}

.checkout-btn{

    display:flex;

    justify-content:center;

    align-items:center;

    gap:12px;

    width:100%;

    margin-top:30px;

    padding:18px;

    text-decoration:none;

    background:linear-gradient(135deg,#E67E22,#ff9f43);

    color:white;

    font-size:20px;

    font-weight:700;

    border-radius:18px;

    transition:.35s;

}
.checkout-btn:hover{

    transform:translateY(-4px);

    box-shadow:0 18px 35px rgba(230,126,34,.35);

}
.arrow{

    transition:.3s;

}
.checkout-btn:hover .arrow{

    transform:translateX(8px);

}
.empty-cart{

    max-width:600px;

    margin:80px auto;

    background:#fff;

    padding:50px 40px;

    border-radius:25px;

    text-align:center;

    box-shadow:0 15px 40px rgba(0,0,0,.12);

    animation:fadeUp .6s ease;

}
.empty-cart h2{

    font-size:38px;

    color:#2C3E50;

    margin-bottom:20px;

}
.empty-cart p{

    font-size:18px;

    color:#666;

    line-height:1.8;

    margin-bottom:35px;

}
.browse-btn{

    display:inline-block;

    padding:16px 35px;

    background:linear-gradient(135deg,#E67E22,#ff9f43);

    color:white;

    text-decoration:none;

    font-size:18px;

    font-weight:600;

    border-radius:15px;

    transition:.35s;

}
@keyframes fadeUp{

    from{

        opacity:0;

        transform:translateY(30px);

    }

    to{

        opacity:1;

        transform:translateY(0);

    }

}
/* ===== Premium MoodyFoody Scrollbar ===== */

::-webkit-scrollbar{

    width:8px;

}

::-webkit-scrollbar-track{

    background:#FFF6EE;

}

::-webkit-scrollbar-thumb{

    background:linear-gradient(180deg,#ff7a00,#ff9f43);

    border-radius:20px;

    border:2px solid #FFF6EE;

}

::-webkit-scrollbar-thumb:hover{

    background:linear-gradient(180deg,#e66c00,#ff7a00);

}
</style>

</head>
<body>
<jsp:include page="navbar.jsp"/>
<%
if(session.getAttribute("loggedUser")==null){

    response.sendRedirect("login.jsp?msg=loginRequired");
    return;
}
%>

<div class="cart-page">

    <h1 class="cart-title">
        🛒 Your Cart
    </h1>

<%
if(cart == null || cart.isEmpty()){
%>

   <div class="empty-cart">

    <h2>Cart is Empty</h2>

    <p>Add some delicious food and satisfy your cravings!</p>

    <a href="restaurants" class="browse-btn">
        Browse Restaurants
    </a>

</div>

<%
}
else{
%>

<div class="cart-container">

<%
for(CartItem item : cart.getItems()){
%>

<div class="cart-card">

    <img
        src="<%= item.getMenu().getImagePath() %>"
        class="food-img">

    <div class="food-details">

        <h3>
            <%= item.getMenu().getItemName() %>
        </h3>

        <p class="price">
            ₹ <%= item.getMenu().getPrice() %>
        </p>

        <div class="quantity-section">

            <a href="cart?action=decrease&menuId=<%= item.getMenu().getMenuId() %>"
               class="qty-btn">−</a>

            <span class="qty">
    <%= item.getQuantity() %>
</span>

            <a href="cart?action=increase&menuId=<%= item.getMenu().getMenuId() %>"
               class="qty-btn">+</a>

        </div>

       <p class="total-price">

    Total :
    ₹ <%= item.getTotalPrice() %>

</p>

        <a href="cart?action=remove&menuId=<%= item.getMenu().getMenuId() %>"
           class="remove-btn">

           Remove
        </a>
    </div>
</div>
<%
}
%>

<%
int restaurantId = 0;

if(cart != null && !cart.isEmpty()){

    restaurantId =
        cart.getItems()
            .iterator()
            .next()
            .getMenu()
            .getRestaurantId();
}
%>
<div style="text-align:center; margin:25px 0;">

    <a href="menu?restaurantId=<%= restaurantId %>"
class="add-more-btn">

         Add More Items

    </a>

</div>

<%
double subtotal = cart.getTotalAmount();

double deliveryFee = 40;

double tax = subtotal * 0.05;

double grandTotal =
        subtotal + deliveryFee + tax;
%>


<div class="bill-card">

    <h2>
        Bill Details
    </h2>

    <div class="bill-row">
        <span style="color:#333 !important;">Items Total</span>
        <span style="color:#333 !important;">₹ <%= subtotal %></span>
    </div>

    <div class="bill-row">
        <span style="color:#333 !important;">Delivery Fee</span>
        <span style="color:#333 !important;">₹ 40</span>
    </div>

    <div class="bill-row">
        <span style="color:#333 !important;">Taxes & Charges</span>
        <span style="color:#333 !important;">
            ₹ <%= String.format("%.2f", tax) %>
        </span>
    </div>

    <hr>

    <div class="bill-row grand-total">
        <span style="color:#111 !important;">Grand Total</span>
        <span style="color:#111 !important;">
            ₹ <%= String.format("%.2f", grandTotal) %>
        </span>
    </div>

    <a href="checkout.jsp" class="checkout-btn">
        Proceed To Checkout
        <span class="arrow">→</span>
    </a>

</div>
</div>

<%
}
%>

</div>

</body>
</html>