<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Successful | MoodyFoody</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

height:100vh;

display:flex;

justify-content:center;

align-items:center;

background:linear-gradient(75deg,#ff7a00,#ffb347);
);

}

.card{

background:white;

padding:60px;

width:550px;

border-radius:28px;

text-align:center;

box-shadow:0 20px 50px rgba(0,0,0,.12);

animation:pop .6s ease;

}

.success{

width:120px;

height:120px;

margin:0 auto 20px;

border-radius:50%;

background:#1BA94C;

color:white;

display:flex;

justify-content:center;

align-items:center;

font-size:60px;

box-shadow:0 10px 25px rgba(27,169,76,.35);

animation:bounce 1s ease;

}
@keyframes bounce{

0%{

transform:scale(.9);

}

60%{

transform:scale(1.15);

}

100%{

transform:scale(1);

}

}

h1{

font-size:38px;

margin-bottom:18px;

color:#2C3E50;

}

p{

color:#666;

font-size:18px;

line-height:1.8;

margin-bottom:35px;

}

.btn{

display:inline-flex;

align-items:center;

gap:10px;

padding:16px 45px;

background:linear-gradient(135deg,#E67E22,#ff9f43);

color:white;

text-decoration:none;

border-radius:15px;

font-size:18px;

font-weight:600;

transition:.35s;

}
.btn:hover{

transform:translateY(-4px);

box-shadow:0 18px 35px rgba(230,126,34,.35);

}

@keyframes pop{

from{

opacity:0;

transform:scale(.9);

}

to{

opacity:1;

transform:scale(1);

}

}

.delivery-box{

background:#FFF5EC;

padding:20px;

border-radius:18px;

margin-bottom:35px;

}

.delivery-box h3{

color:#E67E22;

margin-bottom:10px;

}

.delivery-box h2{

color:#2C3E50;

}
</style>

</head>

<body>

<div class="card">

<div class="success">
&#10003;
</div>

<h1>Order Placed Successfully!</h1>

<p>

Thank you for ordering with MoodyFoody.

Your food is being prepared.

</p>
<div class="delivery-box">

    <h3>🚴 Estimated Delivery</h3>

    <h2>25 - 30 Minutes</h2>

</div>

<a href="index.jsp" class="btn">

🏠 Back To Home

</a>

</div>

</body>
</html>