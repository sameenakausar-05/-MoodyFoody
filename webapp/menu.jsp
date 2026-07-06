<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.Menu"%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
margin:0;
}

.header{

background:linear-gradient(135deg,#E67E22,#ff9f43);

padding:5px 5px;

text-align:center;

color:white;

}

.header h1{

font-size:25px;

margin-bottom:10px;

}

.header p{

font-size:15px;

opacity:.95;

}
.container{
width:90%;
margin:30px auto;

display:grid;
grid-template-columns:repeat(auto-fill,minmax(280px,1fr));
gap:20px;
}

.card{

animation:fadeUp .5s ease;

}
@keyframes fadeUp{

from{

opacity:0;

transform:translateY(25px);

}

to{

opacity:1;

transform:translateY(0);

}

}
.card{

    background:white;

    border-radius:22px;

    overflow:hidden;

    box-shadow:0 10px 30px rgba(0,0,0,.12);

    transition:.35s;

    cursor:pointer;

}
.card:hover{

    transform:translateY(-12px);

    box-shadow:0 20px 45px rgba(0,0,0,.18);

}

.card img{

    width:100%;

    height:230px;

    object-fit:cover;

    transition:.5s;

}
.card:hover img{

    transform:scale(1.08);

}

.card-body{

    padding:22px;

}

.item-name{

font-size:26px;

font-weight:700;

color:#2C3E50;

margin-bottom:10px;

}

.description{

color:#777;

line-height:1.7;

font-size:15px;

margin-bottom:18px;

}

.price{

display:inline-block;

background:#E8F8EE;

color:#1BA94C;

padding:8px 18px;

border-radius:25px;

font-size:18px;

font-weight:700;

margin-bottom:20px;

}

.btn{

display:flex;

justify-content:center;

align-items:center;

gap:10px;

margin-top:20px;

padding:14px;

background:linear-gradient(135deg,#E67E22,#ff9f43);

color:white;

text-decoration:none;

font-size:17px;

font-weight:600;

border-radius:15px;

transition:.35s;

}
.btn:hover{

transform:translateY(-3px);

box-shadow:0 12px 25px rgba(230,126,34,.35);

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
<div class="header">

    <h1>&#127869; Explore Our Menu</h1>

    <p>Freshly Prepared &bull; Deliciously Served</p>

</div>

<div class="container">

<%
if(menuList!=null){

for(Menu m : menuList){
%>

<div class="card">

<img src="<%=m.getImagePath()%>">

<div class="card-body">

<div class="item-name">
<%=m.getItemName()%>
</div>

<div class="description">
<%=m.getDescription()%>
</div>

<div class="price">
&#x20B9; <%=m.getPrice()%>
</div>

<a href="cart?menuId=<%= m.getMenuId() %>" class="btn">

&#128722; Add To Cart

</a>
</div>

</div>

<%
}
}
%>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>