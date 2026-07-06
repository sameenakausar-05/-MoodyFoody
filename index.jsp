<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoodyFoody - Taste of Bengaluru</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
    scroll-behavior:smooth;
}
body{
    background: linear-gradient(
        135deg,
        #F8F9FA 0%,
        #E9ECEF 40%,
        #FDF6EC 100%
    );

    color:#2D3436;
    overflow-x:hidden;
    position:relative;
}
body::before{
    content:'';
    position:fixed;

    width:500px;
    height:500px;

    background:radial-gradient(
        circle,
        rgba(230,126,34,0.15),
        transparent 70%
    );

    top:-150px;
    right:-150px;

    border-radius:50%;
    z-index:-1;
}

body::after{
    content:'';
    position:fixed;

    width:450px;
    height:450px;

    background:radial-gradient(
        circle,
        rgba(44,62,80,0.12),
        transparent 70%
    );

    bottom:-150px;
    left:-150px;

    border-radius:50%;
    z-index:-1;
}

/* NAVBAR */

nav{
    position:fixed;
    top:0;
    width:100%;

    background:rgba(255,255,255,0.75);

    backdrop-filter:blur(15px);

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:18px 80px;

    box-shadow:0 4px 20px rgba(0,0,0,0.08);

    border-bottom:1px solid rgba(255,255,255,0.3);

    z-index:1000;
}
.logo{
    font-size:32px;
    font-weight:700;
    color:#E67E22;
    cursor:pointer;
    transition:0.3s;
}

.logo:hover{
    transform:scale(1.05);
}

.nav-links a{
    text-decoration:none;
    color:#2C3E50;
    margin-left:30px;
    font-weight:500;
    position:relative;
}

.nav-links a::after{
    content:'';
    position:absolute;
    width:0;
    height:2px;
    left:0;
    bottom:-5px;
    background:#E67E22;
    transition:0.3s;
}

.nav-links a:hover::after{
    width:100%;
}

/* HERO */

.hero{
    min-height:100vh;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:120px 8%;
}

.hero-text{
    max-width:600px;
    animation:slideLeft 1s ease;
}

.hero-text h1{
    font-size:60px;
    line-height:1.2;
    color:#2C3E50;
}

.hero-text span{
    color:#E67E22;
}

.hero-text p{
    margin:25px 0;
    color:#636E72;
    font-size:18px;
}

.hero-btn{
    display:inline-block;
    background:#E67E22;
    color:white;
    padding:14px 35px;
    border-radius:30px;
    text-decoration:none;
    font-weight:600;
    transition:0.3s;
}

.hero-btn:hover{
    transform:translateY(-4px);
    box-shadow:0 10px 25px rgba(230,126,34,0.3);
}

.hero-image img{
    width:550px;
    animation:float 4s ease-in-out infinite;
}

/* SECTION TITLE */

.section-title{
    text-align:center;
    font-size:38px;
    color:#2C3E50;
    margin-bottom:50px;
}

/* CATEGORIES */

.categories{
    padding:80px 8%;
}

.category-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:25px;
}

.category-card{
    background:white;
    padding:35px;
    border-radius:20px;
    text-align:center;
    transition:0.4s;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
}

.category-card:hover{
    transform:translateY(-10px);
}

.category-card h3{
    margin-top:15px;
}

/* RESTAURANTS */

.restaurants{
    padding:80px 8%;
}

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:30px;
}

.restaurant-card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    transition:0.4s;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
}

.restaurant-card:hover{
    transform:translateY(-10px);
}

.restaurant-card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

.restaurant-content{
    padding:20px;
}

.restaurant-content h3{
    color:#2C3E50;
}

.restaurant-content p{
    color:#636E72;
    margin-top:10px;
}

.rating{
    margin-top:10px;
    color:#E67E22;
    font-weight:600;
}

/* FEATURES */

.features{
    padding:80px 8%;
}

.feature-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

.feature{
    background:white;
    padding:35px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    transition:0.3s;
}

.feature:hover{
    transform:translateY(-8px);
}

/* FOOTER */

footer{
    background:#2C3E50;
    color:white;
    text-align:center;
    padding:40px;
    margin-top:80px;
}

footer h2{
    color:#E67E22;
    margin-bottom:10px;
}
/* ANIMATIONS */

@keyframes float{

0%{transform:translateY(0);}
50%{transform:translateY(-15px);}
100%{transform:translateY(0);}

}

@keyframes slideLeft{

from{
opacity:0;
transform:translateX(-60px);
}

to{
opacity:1;
transform:translateX(0);
}

}

/* SEARCH BAR */

.search-container{
    margin:30px 0;
}

.search-container form{
    display:flex;
    width:520px;
    height:55px;
    background:#fff;
    border-radius:50px;
    overflow:hidden;
    box-shadow:0 8px 25px rgba(0,0,0,.15);
}

.search-container input{
    flex:1;
    border:none;
    outline:none;
    padding:0 20px;
    font-size:17px;
    background:white;
}

.search-container button{
    width:140px;
    border:none;
    background:#E67E22;
    color:white;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.search-container button:hover{
    background:#cf6b12;
}
/* RESPONSIVE */

@media(max-width:900px){

.hero{
    flex-direction:column;
    text-align:center;
}

.hero-image img{
    width:500px;
    margin-top:40px;
}

.hero-text h1{
    font-size:42px;
}

nav{
    padding:15px 30px;
}

.search-container form{
    width:100%;
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
<!-- NAVBAR -->

<nav>
<div class="logo">&#127860; MoodyFoody</div>

<div class="nav-links">
<a href="#">Home</a>
<a href="#restaurants">Restaurants</a>
<%
if(session.getAttribute("loggedUser")==null){
%>

<a href="login.jsp">Login</a>
<a href="register.jsp">Register</a>

<%
}else{
%>

<a href="orderHistory">My Orders</a>
<a href="logout">Logout</a>

<%
}
%>
<a href="cart.jsp">Cart</a>
<a href="profile">My Profile</a>
<a href="about.jsp">&#128214;About</a>
</div>

</nav>

<!-- HERO -->

<section class="hero">

<div class="hero-text">

<h1>
Taste <span>Bengaluru's Best Food</span><br>
Delivered To Your Doorstep
</h1>

<p>
Order delicious meals from Bengaluru's most loved restaurants
including Meghana Foods, Empire Restaurant, CTR, Truffles and more.
</p>

<div class="search-container">

    <form action="restaurants" method="get">

        <input
            type="text"
            name="keyword"
            placeholder="&#128269; Search Restaurants..."
            required>

        <button type="submit">
            Search
        </button>

    </form>

</div>

<a href="<%=request.getContextPath()%>/restaurants" class="hero-btn">
    Explore Restaurants
</a>

</div>

<div class="hero-image">

<img src="images/hero-food.png">

</div>

</section>

<!-- CATEGORIES -->

<section class="categories">

<h2 class="section-title">Popular Categories</h2>

<div class="category-grid">

<div class="category-card">
<h1>&#127858;</h1>
<h3>Biryani</h3>
</div>

<div class="category-card">
<h1>&#129360;</h1>
<h3>South Indian</h3>
</div>

<div class="category-card">
<h1>&#127831;</h1>
<h3>Non Veg</h3>
</div>

<div class="category-card">
<h1>&#127828;</h1>
<h3>Burgers</h3>
</div>

<div class="category-card">
<h1>&#128031;</h1>
<h3>Coastal</h3>
</div>

</div>

</section>

<!-- RESTAURANTS -->

<section class="restaurants" id="restaurants">

<h2 class="section-title">Featured Restaurants</h2>

<div class="restaurant-grid">

<div class="restaurant-card">
<img src="images/meghana.jpg">
<div class="restaurant-content">
<h3>Meghana Foods</h3>
<p>Authentic Andhra Style Biryani</p>
<div class="rating">&star; 4.5</div>
</div>
</div>

<div class="restaurant-card">
<img src="images/empire.jpg">
<div class="restaurant-content">
<h3>Empire Restaurant</h3>
<p>Best Non Veg Delicacies</p>
<div class="rating">&star; 4.3</div>
</div>
</div>

<div class="restaurant-card">
<img src="images/vidyarthibhavan.jpg">
<div class="restaurant-content">
<h3>Vidyarthi Bhavan</h3>
<p>Legendary South Indian Breakfast</p>
<div class="rating">&star; 4.7</div>
</div>
</div>

<div class="restaurant-card">
<img src="images/truffles.jpg">
<div class="restaurant-content">
<h3>Truffles</h3>
<p>Burgers, Fries & Cafe Specials</p>
<div class="rating">&star; 4.7</div>
</div>
</div>

</div>

</section>

<!-- FEATURES -->

<section class="features">

<h2 class="section-title">Why Choose MoodyFoody?</h2>

<div class="feature-grid">

<div class="feature">
<h1>&#9889;</h1>
<h3>Fast Delivery</h3>
<p>Get your food delivered quickly and safely.</p>
</div>

<div class="feature">
<h1>&#127869;</h1>
<h3>Fresh Food</h3>
<p>Prepared by trusted restaurants every day.</p>
</div>

<div class="feature">
<h1>&#11088;</h1>
<h3>Top Rated</h3>
<p>Bengaluru's most loved restaurants in one place.</p>
</div>

<div class="feature">
<h1>&#128179;</h1>
<h3>Secure Payments</h3>
<p>Safe and reliable payment experience.</p>
</div>

</div>

</section>
<jsp:include page="footer.jsp"/>
</body>
</html>