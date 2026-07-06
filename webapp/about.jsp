<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>


<html>

<head>

<meta charset="UTF-8">

<title>About MoodyFoody</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="about.css">

<style type="text/css">

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

body{

background:#fafafa;

color:#2C3E50;

overflow-x:hidden;

}

/* HERO */

.hero{

    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

    text-align:center;

    position:relative;

    background:
        linear-gradient(
            rgba(0,0,0,.55),
            rgba(0,0,0,.55)
        ),
        url("images/about-bg.png");

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    overflow:hidden;
}

.overlay{

position:absolute;

top:0;

left:0;

width:100%;

height:100%;

background:rgba(0,0,0,.58);

}

.hero-content{

position:relative;

z-index:2;

max-width:900px;

padding:20px;

}
.hero h1{
    font-size:72px;
    color:white;
}

.hero h1 span{
    color:#E67E22;
}

.hero p{
    color:#eee;
    font-size:24px;
    max-width:800px;
    margin:25px auto;
}

.hero-btn{

display:inline-block;

padding:18px 45px;

background:#E67E22;

color:white;

text-decoration:none;

font-size:20px;

font-weight:600;

border-radius:50px;

transition:.35s;

}

.hero-btn:hover{

background:#cf6b12;

transform:translateY(-6px);

box-shadow:0 20px 40px rgba(230,126,34,.45);

}
.about-card{

position:relative;

margin-top:-120px;

z-index:5;

}
.about-card{

background:white;

width:85%;

margin:auto;

padding:55px;

border-radius:25px;

box-shadow:0 20px 50px rgba(0,0,0,.18);

text-align:center;

}
.hero::before{

content:"";

position:absolute;

width:320px;

height:320px;

background:#FFB347;

border-radius:50%;

filter:blur(120px);

opacity:.35;

top:-100px;

right:-80px;

}

.hero::after{

content:"";

position:absolute;

width:280px;

height:280px;

background:#FFD89B;

border-radius:50%;

filter:blur(100px);

opacity:.35;

bottom:-80px;

left:-60px;

}

.scroll-down{

    position:absolute;

    bottom:35px;

    left:50%;

    transform:translateX(-50%);

    font-size:42px;

    color:white;

    animation:bounce 1.8s infinite;

    cursor:pointer;

}
@keyframes bounce{

0%,20%,50%,80%,100%{

    transform:translate(-50%,0);

}

40%{

    transform:translate(-50%,-15px);

}

60%{

    transform:translate(-50%,-8px);

}

}
@keyframes float{

0%{

transform:translateY(0);

}

50%{

transform:translateY(-20px);

}

100%{

transform:translateY(0);

}

}
.food{

animation:float 5s ease-in-out infinite;

}

/* INTRO */

.intro{

padding:100px 10%;

display:flex;

justify-content:center;

}

.glass-card{

max-width:900px;

padding:50px;

border-radius:30px;

background:rgba(255,255,255,.55);

backdrop-filter:blur(18px);

box-shadow:0 20px 40px rgba(0,0,0,.08);

border:1px solid rgba(255,255,255,.7);

text-align:center;

transition:.4s;

}

.glass-card:hover{

transform:translateY(-10px);

box-shadow:0 30px 50px rgba(230,126,34,.15);

}

.glass-card h2{

font-size:42px;

color:#E67E22;

margin-bottom:20px;

}

.glass-card p{

font-size:20px;

line-height:1.8;

color:#555;

}

/* WHY CHOOSE */

.features{

padding:90px 8%;

}

.section-title{

text-align:center;

font-size:46px;

color:#2C3E50;

margin-bottom:60px;

}

.feature-container{

display:flex;

justify-content:center;

gap:35px;

flex-wrap:wrap;

}

.feature-card{

width:320px;

background:white;

padding:40px;

border-radius:25px;

text-align:center;

box-shadow:0 15px 30px rgba(0,0,0,.08);

transition:.4s;

}

.feature-card:hover{

transform:translateY(-15px);

box-shadow:0 25px 40px rgba(230,126,34,.18);

}

.icon{

font-size:55px;

margin-bottom:20px;

}

.feature-card h3{

font-size:28px;

color:#E67E22;

margin-bottom:15px;

}

.feature-card p{

font-size:17px;

line-height:1.7;

color:#666;

}

/* NUMBER */

.stats{

padding:100px 8%;

background:linear-gradient(135deg,#E67E22,#ff9f43);

margin-top:80px;

border-radius:70px 70px 0 0;

}

.stats-title{

text-align:center;

font-size:48px;

color:white;

margin-bottom:60px;

}

.stats-container{

display:flex;

justify-content:center;

flex-wrap:wrap;

gap:35px;

}

.stat-box{

width:220px;

padding:35px;

background:rgba(255,255,255,.15);

backdrop-filter:blur(15px);

border:1px solid rgba(255,255,255,.25);

border-radius:25px;

text-align:center;

transition:.4s;

}

.stat-box:hover{

transform:translateY(-12px);

background:rgba(255,255,255,.25);

}

.stat-box h1{

font-size:55px;

color:white;

margin-bottom:12px;

}

.stat-box p{

font-size:20px;

color:white;

}
/*DEVELOPER*/

.developer{

padding:100px 8%;

background:#fff;

}

.developer-card{

max-width:850px;

margin:auto;

padding:50px;

background:white;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

text-align:center;

transition:.4s;

}

.developer-card:hover{

transform:translateY(-10px);

box-shadow:0 25px 45px rgba(230,126,34,.18);

}

.developer-image{

width:130px;

height:130px;

margin:auto;

border-radius:50%;

background:#E67E22;

display:flex;

justify-content:center;

align-items:center;

font-size:60px;

color:white;

margin-bottom:25px;

}

.developer-card h2{

font-size:36px;

color:#2C3E50;

}

.developer-card h4{

color:#E67E22;

margin:10px 0 25px;

font-size:22px;

}

.developer-card p{

font-size:18px;

line-height:1.8;

color:#666;

margin-bottom:35px;

}

.skills{

display:flex;

justify-content:center;

gap:15px;

flex-wrap:wrap;

}

.skills span{

padding:10px 22px;

background:#FFF4EA;

color:#E67E22;

border-radius:25px;

font-weight:600;

transition:.3s;

}

.skills span:hover{

background:#E67E22;

color:white;

}

.footer{

background:#2C3E50;

color:white;

text-align:center;

padding:70px 20px;

margin-top:80px;

}

.footer h2{

font-size:40px;

color:#E67E22;

margin-bottom:10px;

}

.tagline{

font-size:18px;

color:#ddd;

margin-bottom:35px;

}

.footer-links{

display:flex;

justify-content:center;

gap:35px;

flex-wrap:wrap;

margin-bottom:35px;

}

.footer-links a{

color:white;

text-decoration:none;

font-size:18px;

transition:.3s;

}

.footer-links a:hover{

color:#E67E22;

}

.social-icons{

font-size:34px;

display:flex;

justify-content:center;

gap:25px;

margin-bottom:25px;

}

.social-icons span{

cursor:pointer;

transition:.3s;

}

.social-icons span:hover{

transform:scale(1.2);

}

.copyright{

color:#bbb;

margin-top:20px;

}

.made{

margin-top:10px;

color:#999;

font-size:15px;

}
</style>


</head>

<body>
<jsp:include page="navbar.jsp"/>
<!-- HERO -->

<section class="hero">

    <div class="overlay"></div>

    <div class="hero-content">

        <h1>

            About
            <br>

            <span>MoodyFoody</span>

        </h1>

        <p>

            Bringing Bengaluru's favourite restaurants to your doorstep
            with speed, quality and happiness.

        </p>

        <a href="restaurants" class="hero-btn">

            Explore Restaurants →

        </a>
        

    </div>
	<div class="scroll-down">
        &#8595;
    </div>
</section>

<section class="intro">

    <div class="glass-card">

        <h2>Who We Are ?</h2>

        <p>

            MoodyFoody is more than just a food delivery platform.
            We connect food lovers with Bengaluru's most loved restaurants,
            making every meal memorable through speed, quality and convenience.

        </p>

    </div>

</section>

<section class="features">

    <h2 class="section-title">
        Why Choose MoodyFoody?
    </h2>

    <div class="feature-container">

        <div class="feature-card">

            <div class="icon">&#128666;</div>

            <h3>Fast Delivery</h3>

            <p>
                Lightning fast delivery from your favourite restaurants.
            </p>

        </div>

        <div class="feature-card">

            <div class="icon">&#127869;</div>

            <h3>Fresh Food</h3>

            <p>
                Prepared fresh every day by Bengaluru's best restaurants.
            </p>

        </div>

        <div class="feature-card">

            <div class="icon">&#128274;</div>

            <h3>Secure Payments</h3>

            <p>
                Safe and secure payment options with complete protection.
            </p>

        </div>

    </div>

</section>

<section class="stats">

    <h2 class="stats-title">
        MoodyFoody in Numbers
    </h2>

    <div class="stats-container">

        <div class="stat-box">
            <h1>8+</h1>
            <p>Restaurants</p>
        </div>

        <div class="stat-box">
            <h1>50+</h1>
            <p>Happy Customers</p>
        </div>

        <div class="stat-box">
            <h1>100+</h1>
            <p>Orders Served</p>
        </div>

        <div class="stat-box">
            <h1>4.5★</h1>
            <p>Average Rating</p>
        </div>

    </div>

</section>

<!-- DEVELOPER -->
<section class="developer">

    <h2 class="section-title">
        Meet the Developer
    </h2>

    <div class="developer-card">

        <div class="developer-image">

            👨‍💻

        </div>

        <h2>SAMEENA KAUSAR MAGAMI</h2>

        <h4>Java Full Stack Developer</h4>

        <p>

            Passionate about designing elegant web applications using
            Java, JSP, Servlets, JDBC and MySQL.
            MoodyFoody was built as a premium food ordering platform
            focusing on clean UI, performance and user experience.

        </p>

        <div class="skills">

            <span>Java</span>

            <span>JSP</span>

            <span>Servlets</span>

            <span>JDBC</span>

            <span>MySQL</span>

            <span>HTML</span>

            <span>CSS</span>

        </div>

    </div>

</section>

<!-- FOOTER -->

<footer class="footer">

    <h2>MoodyFoody</h2>

    <p class="tagline">

        Great Food • Great Mood • Great Experience

    </p>

    <div class="footer-links">

        <a href="index.jsp">Home</a>

        <a href="restaurants">Restaurants</a>

        <a href="about.jsp">About</a>

        <a href="profile">Profile</a>

    </div>

    <div class="social-icons">

        <span>&#128241;</span>

        <span>&#128231;</span>

        <span>&#127760;</span>

    </div>

    <p class="copyright">

        © 2026 MoodyFoody. All Rights Reserved.

    </p>

    <p class="made">

        Made with ❤️ using Java, JSP, Servlets & MySQL

    </p>

</footer>
</body>

</html>