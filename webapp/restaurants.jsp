<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.Restaurant"%>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants</title>



<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#f5f5f5;
}

.header{
background:linear-gradient(135deg,#E67E22,#ff9f43);
color:white;
padding:20px;
text-align:center;
font-size:20px;
font-weight:bold;
}

.header h1{

font-size:20px;

margin-bottom:10px;

}
.header p{

font-size:15px;

opacity:.95;

}
.container{

width:90%;

max-width:1400px;

margin:50px auto;

display:grid;

grid-template-columns:repeat(auto-fill,minmax(300px,1fr));

gap:35px;

}

.card{

    background:#fff;

    border-radius:22px;

    overflow:hidden;

    box-shadow:0 10px 30px rgba(0,0,0,.10);

    transition:all .35s ease;

    position:relative;

    cursor:pointer;

}

.card:hover{

    transform:translateY(-12px);

    box-shadow:0 20px 40px rgba(0,0,0,.18);

}
.card img{

    width:100%;

    height:230px;

    object-fit:cover;

    transition:transform .5s ease;

}
.card:hover img{

    transform:scale(1.08);

}
.card-body{

padding:22px;

}

.restaurant-name{
font-size:22px;
font-weight:bold;
margin-bottom:10px;
}

.image-container{

    position:relative;

    overflow:hidden;

    border-radius:22px 22px 0 0;

}
.image-container::after{

    content:"";

    position:absolute;

    left:0;

    bottom:0;

    width:100%;

    height:80px;

    background:linear-gradient(

        to top,

        rgba(0,0,0,.25),

        transparent

    );

    pointer-events:none;

}
.floating-rating{

    position:absolute;

    top:15px;

    right:15px;

    background:#fff;

    color:#E67E22;

    padding:8px 14px;

    border-radius:30px;

    font-weight:700;

    font-size:15px;

    box-shadow:0 8px 20px rgba(0,0,0,.18);

}
.restaurant-name{

font-size:25px;

font-weight:700;

color:#2C3E50;

margin-bottom:12px;

}

.cuisine{

display:inline-block;

background:#FFF3E8;

color:#E67E22;

padding:6px 16px;

border-radius:20px;

font-size:14px;

font-weight:600;

margin-bottom:18px;

}
.rating-time-row{

    display:flex;
    
     justify-content:space-between;

    align-items:center;

    gap:12px;

    margin-top:10px;
}

.rating-badge{

    display:flex;

    align-items:center;

    gap:6px;
}

.rating-value{

    color:#222;

    font-weight:600;

    font-size:20px;
}

.delivery-time{

    display:inline-flex;

    align-items:center;

    gap:5px;

    padding:6px 14px;

    background:#F8F9FA;

    border-radius:20px;

    color:#444;

    font-size:16px;

    font-weight:600;

}
.restaurant-address{

margin:18px 0;

line-height:1.6;

color:#777;

font-size:15px;

}

.view-btn{

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

overflow:hidden;

}
.view-btn::after{

content:"\2192";

transition:.35s;

}
.view-btn:hover{

transform:translateY(-3px);

box-shadow:0 15px 30px rgba(230,126,34,.35);

}

.view-btn:hover::after{

transform:translateX(8px);

}
.no-result{

    width:420px;

    padding:50px 35px;

    background:white;

    border-radius:20px;

    text-align:center;

    box-shadow:0 5px 15px rgba(0,0,0,.12);

}

.no-result h2{
    color:#E67E22;
    margin-bottom:15px;
    font-size:32px;
}

.no-result p{
    color:#666;
    font-size:18px;
    margin-bottom:25px;
}

.back-btn{
    display:inline-block;
    padding:12px 28px;
    background:#E67E22;
    color:#fff;
    text-decoration:none;
    border-radius:10px;
    transition:0.3s;
}

.back-btn:hover{
    background:#cf6b12;
}

.no-result-wrapper{

    grid-column:1/-1;

    display:flex;

    justify-content:center;

    align-items:center;

    width:100%;

    margin-top:60px;

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
<jsp:include page="navbar.jsp"/>
<div class="header">

    <h1>Discover Bengaluru's Best Restaurants</h1>
      <p>
        Fresh Food &bull; Fast Delivery &bull; Amazing Taste
    </p>

</div>

<div class="container">

<%
if(restaurants != null && !restaurants.isEmpty()){

for(Restaurant r : restaurants){
%>

<div class="card">

<div class="image-container">

    <img src="<%=r.getImagePath()%>">

    <div class="floating-rating">

        &star; <%=r.getRating()%>

    </div>

</div>

<div class="card-body">

<div class="restaurant-name">
<%=r.getName()%>
</div>

<div class="cuisine">
<%=r.getCuisineType()%>
</div>

<div class="rating-time-row">

    <span class="delivery-time">

        &#128338; <%= r.getDeliveryTime() %> mins

    </span>

</div>

<p class="restaurant-address">

    &#128205; <%= r.getAddress() %>

</p>

<a href="menu?restaurantId=<%=r.getRestaurantId()%>"
class="view-btn">
View Menu
</a>

</div>

</div>

<%
}
}else{
	%>

	<div class="no-result-wrapper">

    <div class="no-result">

        <h2>&#128532; No Restaurants Found</h2>

        <p>Sorry! We couldn't find any restaurant matching your search.</p>

        <a href="restaurants" class="back-btn">
            View All Restaurants
        </a>

    </div>

</div>

	<%
	}
	%>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>