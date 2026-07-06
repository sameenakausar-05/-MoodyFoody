<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.restaurant.model.Cart"%>
<%@ page import="com.restaurant.model.CartItem"%>

<%
Cart cart = (Cart)session.getAttribute("cart");

if(cart == null || cart.isEmpty()){
    response.sendRedirect("cart.jsp");
    return;
}

double subtotal = cart.getTotalAmount();
double delivery = 40;
double tax = subtotal * 0.05;
double grandTotal = subtotal + delivery + tax;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Checkout | MoodyFoody</title>

<link rel="stylesheet" href="">

<style>

body{

    margin:0;

    padding:0;

    font-family:'Poppins',sans-serif;

    background:linear-gradient(75deg,#ff7a00,#ffb347);
    );

    min-height:100vh;

}

.checkout-header{

    text-align:center;

    margin:40px 0;

}

.checkout-header h1{
    font-size:52px;

    color:white;

    margin-bottom:10px;

}

.checkout-header p{

    color:white;

    font-size:18px;

}
.checkout-container{

width:90%;
max-width:1300px;

margin:40px auto;

display:flex;

gap:30px;

align-items:flex-start;

}

.checkout-left{

    flex:2;

}
.checkout-right{

    flex:1;

    background:#fff;

    border-radius:22px;

    padding:35px;

    box-shadow:0 12px 30px rgba(0,0,0,.10);

}
.checkout-card{

background:white;

padding:35px;

border-radius:22px;

box-shadow:0 12px 30px rgba(0,0,0,.10);

transition:.35s;

}

.checkout-card h2{

margin-bottom:20px;

color:#E67E22;

}

.input-box{

margin-bottom:20px;

}

.input-box label{

display:block;
color:#222;
font-weight:600;
margin-bottom:8px;

}

.input-box input,
.input-box textarea,
.input-box select{

width:100%;

padding:12px;

border-radius:8px;

border:1px solid #ddd;

font-size:15px;

}

.bill-row{

display:flex;

justify-content:space-between;

margin:15px 0;

font-size:16px;

}

.place-order{

width:100%;

padding:15px;

background:#E67E22;

color:white;

font-size:18px;

border:none;

border-radius:8px;

cursor:pointer;

margin-top:20px;

transition:.3s;

}

.place-order:hover{

background:#cf6b12;

}

.order-item{

display:flex;

justify-content:space-between;

align-items:center;

padding:15px 0;

border-bottom:1px solid #F2F2F2;

font-size:17px;

}
.header,
.footer{
    background:transparent;
}
.checkout-left h2,
.checkout-right h2{

    color:#E67E22;

    font-size:38px;

    margin-bottom:30px;
}

label{

    display:block;

    color:#222;

    font-size:17px;

    font-weight:600;

    margin-bottom:8px;
}
input,
textarea,
select{

    width:100%;

    padding:16px;

    border:2px solid #EFEFEF;

    border-radius:14px;

    margin-bottom:25px;

    font-size:16px;

    transition:.3s;

}

input:focus,
textarea:focus,
select:focus{

    border-color:#E67E22;

    box-shadow:0 0 12px rgba(230,126,34,.20);

}
.bill-row{

    display:flex;
    justify-content:space-between;
    align-items:center;

    color:#222;

    font-size:18px;

    margin:15px 0;
}
.total{

    display:flex;

    justify-content:space-between;

    font-size:25px;

    font-weight:bold;

    color:#111;

    margin-top:20px;

    border-top:2px solid #ddd;

    padding-top:20px;
}

.place-btn{

    width:100%;

    display:flex;

    justify-content:center;

    align-items:center;

    gap:12px;

    padding:18px;

    border:none;

    border-radius:18px;

    background:linear-gradient(135deg,#E67E22,#ff9f43);

    color:white;

    font-size:20px;

    font-weight:700;

    cursor:pointer;

    transition:.35s;

}

.place-btn:hover{

    transform:translateY(-4px);

    box-shadow:0 18px 35px rgba(230,126,34,.35);

}

select{

    cursor:pointer;

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
/* ===== Page Fade Animation ===== */

body{

    animation:pageFade .5s ease;

}

@keyframes pageFade{

    from{

        opacity:0;

        transform:translateY(15px);

    }

    to{

        opacity:1;

        transform:translateY(0);

    }

}
</style>

</head>

<body>

<%
if(session.getAttribute("loggedUser")==null){

    response.sendRedirect("login.jsp");
    return;
}
%>

<div class="checkout-header">

    <h1> Checkout</h1>

    <p>

        Almost there! Review your order before placing it.

    </p>

</div>

<form action="checkout" method="post">

<div class="checkout-container">

<div class="checkout-card">

<h2>📍 Delivery Details</h2>

<div class="input-box">

<label>Name</label>

<input
type="text"
name="customerName"
value="<%=session.getAttribute("loggedUser")!=null?((com.restaurant.model.User)session.getAttribute("loggedUser")).getUsername():""%>"
required>

</div>

<div class="input-box">

<label>Delivery Address</label>

<textarea
name="address"
rows="4"
required></textarea>

</div>

<div class="input-box">

<label>Payment Method</label>

<select name="paymentMethod">

    <option value="COD">
        Cash On Delivery
    </option>

    <option value="UPI">
        UPI
    </option>

    <option value="CARD">
        Debit / Credit Card
    </option>

</select>

</div>

</div>

<div class="checkout-right">

<h2>🧾 Order Summary</h2>

<%
for(CartItem item : cart.getItems()){
%>

<div class="order-item">

<div>

<b><%=item.getMenu().getItemName()%></b>

<br>

Qty : <%=item.getQuantity()%>

</div>

<div>

₹ <%=item.getTotalPrice()%>

</div>

</div>

<%
}
%>

<hr>

<div class="bill-row">

<span>Subtotal</span>

<span>₹ <%=subtotal%></span>

</div>

<div class="bill-row">

<span>Delivery Fee</span>

<span>₹ 40</span>

</div>

<div class="bill-row">

<span>Tax</span>

<span>₹ <%=String.format("%.2f",tax)%></span>

</div>

<div class="total">

<span>Grand Total</span>

<span>₹ <%=String.format("%.2f",grandTotal)%></span>

</div>

<button class="place-btn" href="orderSuccess.jsp">

Place Order

</button>

</div>

</div>

</form>

</body>
</html>