<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.restaurant.model.User"%>

<%
User user = (User)request.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Profile | MoodyFoody</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Poppins,sans-serif;
}

body{

    margin:0;

   background:linear-gradient(135deg,#E67E22,#ff9f43);

}

.profile-avatar{

    width:110px;

    height:110px;

    margin:0 auto 20px;

    border-radius:50%;

    background:linear-gradient(135deg,#E67E22,#ff9f43);

    color:white;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:48px;

    font-weight:bold;

    box-shadow:0 12px 25px rgba(230,126,34,.35);

}
.welcome{

    text-align:center;

    color:#777;

    margin-top:-20px;

    margin-bottom:35px;

    font-size:18px;

}

.profile-card h1{

    text-align:center;

    color:#ff7a00;

    margin-bottom:35px;
}
.back{

    display:block;

    text-align:center;

    margin-top:20px;

    color:#ff7a00;

    text-decoration:none;

    font-weight:600;
}

.back:hover{

    text-decoration:underline;
}

.profile-container{

    display:flex;

    justify-content:center;

    align-items:center;

    padding:60px 20px;

}
body{

    margin:0;

    display:flex;

    flex-direction:column;

    min-height:100vh;

}

.main-content{

    flex:1;

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

.profile-card{

    width:600px;

    background:white;

    border-radius:28px;

    padding:45px;

    box-shadow:0 18px 45px rgba(0,0,0,.12);

    animation:pop .6s ease;

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
.page-content{

    min-height:calc(100vh - 160px);

}
.profile-avatar{

    width:110px;

    height:110px;

    margin:auto;

    border-radius:50%;

    background:linear-gradient(135deg,#E67E22,#ff9f43);

    color:white;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:48px;

    font-weight:bold;

    box-shadow:0 12px 25px rgba(230,126,34,.35);

}

.info-card{

    background:#FAFAFA;

    border-radius:18px;

    padding:10px 25px;

    margin-bottom:30px;

}

.info-row{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px 0;

    border-bottom:1px solid #eee;

}

.info-row:last-child{

    border-bottom:none;

}

.info-title{

    font-weight:600;

    color:#666;

}

.info-value{

    color:#2C3E50;

    font-weight:500;

}

.btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    background:#E67E22;

    color:white;

    font-size:18px;

    cursor:pointer;

    transition:.3s;

}

.btn:hover{

    background:#cf6b12;

}

.logout-btn{

    display:block;

    width:100%;

    margin-top:15px;

    text-align:center;

    padding:15px;

    background:#E74C3C;

    color:white;

    text-decoration:none;

    border-radius:12px;

    transition:.3s;

}

.logout-btn:hover{

    background:#C0392B;

}

.back{

    display:block;

    text-align:center;

    margin-top:20px;

    color:#E67E22;

    text-decoration:none;

    font-weight:600;

}

.back:hover{

    text-decoration:underline;

}

</style>

</head>

<body>
<jsp:include page="navbar.jsp"/>
<div class="main-content">
<div class="profile-container">
<div class="profile-card">
<div class="profile-avatar">

    <%= user.getUsername().substring(0,1).toUpperCase() %>

</div>

<h1>My Profile</h1>

<p class="welcome">

    Welcome,
    <b><%=user.getUsername()%></b> 👋

</p>
<div class="info-card">

        <div class="info-row">

            <span class="info-title">👤 Username</span>

            <span class="info-value"><%= user.getUsername() %></span>

        </div>

        <div class="info-row">

            <span class="info-title">📧 Email</span>

            <span class="info-value"><%= user.getEmail() %></span>

        </div>

        <div class="info-row">

            <span class="info-title">📍 Address</span>

            <span class="info-value"><%= user.getAddress() %></span>

        </div>

<button class="btn"
onclick="location.href='editProfile'">

Edit Profile

</button>


<a class="back"
href="index.jsp">

← Back to Home

</a>

</div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>

</html>