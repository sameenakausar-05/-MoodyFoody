<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.model.User"%>
<%@ page import="com.restaurant.model.Cart"%>
<%@ page import="com.restaurant.model.CartItem"%>

<%
User loggedUser = (User)session.getAttribute("loggedUser");

Cart cart = (Cart)session.getAttribute("cart");

int cartCount = 0;

if(cart != null){

    for(CartItem item : cart.getItems()){

        cartCount += item.getQuantity();

    }

}
%>

<style>
body{

    margin:0;

}

.navbar{

    height:80px;

    background:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 70px;

    box-shadow:0 4px 15px rgba(0,0,0,.08);

    position:sticky;

    top:0;

    z-index:999;
     backdrop-filter:blur(15px);

}

.logo{

    font-size:32px;

    font-weight:700;

    color:#E67E22;

    letter-spacing:1px;

    cursor:pointer;

    transition:.3s;

}

.logo:hover{

    transform:scale(1.05);

}

.nav-links{

    display:flex;

    gap:35px;

}

.nav-links a{

    position:relative;

    text-decoration:none;

    color:#333;

    font-size:18px;

    font-weight:600;

    transition:.3s;

}
.nav-links a::after{

    content:"";

    position:absolute;

    left:0;

    bottom:-8px;

    width:0;

    height:3px;

    background:#E67E22;

    transition:.3s;

    border-radius:10px;

}

.nav-links a:hover::after{

    width:100%;

}

.nav-right{

    display:flex;

    align-items:center;

    gap:20px;

}

.cart-btn,
.profile-btn{

    text-decoration:none;

    padding:10px 22px;

    border-radius:10px;

    background:#FFF3E8;

    color:#E67E22;

    font-weight:600;

    transition:.3s;

}

.cart-btn:hover,
.profile-btn:hover{

    background:#E67E22;

    color:white;

}
.cart-btn:hover,
.profile-btn:hover{

    background:#E67E22;

    color:white;

    transform:translateY(-2px);

}

box-shadow:0 8px 25px rgba(0,0,0,.08);

.profile-dropdown{

    position:relative;

}

.dropdown-menu{

    position:absolute;

    top:55px;

    right:0;

    width:180px;

    background:white;

    border-radius:12px;

    box-shadow:0 10px 25px rgba(0,0,0,.12);

    overflow:hidden;

    display:none;

}

.dropdown-menu a{

    display:block;

    padding:15px 20px;

    text-decoration:none;

    color:#333;

    transition:.3s;

}

.dropdown-menu a:hover{

    background:#E67E22;

    color:white;

}

.profile-dropdown:hover .dropdown-menu{

    display:block;

}
</style>
<div class="navbar">

    <div class="logo">

        🍴 MoodyFoody

    </div>

    <div class="nav-links">

        <a href="index.jsp">Home</a>

        <a href="restaurants">Restaurants</a>

        <a href="about.jsp">About</a>

    </div>

    <div class="nav-right">

        <a href="cart.jsp" class="cart-btn">

    🛒 Cart

    <span class="cart-count">

        <%= cartCount %>

    </span>

</a>

        <%
        if(loggedUser != null){
        %>

        <div class="profile-dropdown">

    <button class="profile-btn">

        👤 <%=loggedUser.getUsername()%> ▼

    </button>

    <div class="dropdown-menu">

        <a href="profile">

            My Profile

        </a>

        <a href="logout">

            Logout

        </a>

    </div>

</div>

        <%
        }
        %>

    </div>

</div>