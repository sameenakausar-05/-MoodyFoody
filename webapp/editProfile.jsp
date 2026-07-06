<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.restaurant.model.User"%>

<%
User user = (User)session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Profile | MoodyFoody</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Poppins,sans-serif;
}

body{

    background:linear-gradient(135deg,#ff7a00,#ffb347);

    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;
}

.container{

    width:500px;

    background:#fff;

    padding:40px;

    border-radius:20px;

    box-shadow:0 10px 25px rgba(0,0,0,.2);
}

.container h1{

    text-align:center;

    color:#ff7a00;

    margin-bottom:30px;
}

.input-box{

    margin-bottom:20px;
}

.input-box label{

    display:block;

    font-weight:600;

    margin-bottom:8px;

    color:#333;
}

.input-box input{

    width:100%;

    padding:12px;

    border:1px solid #ddd;

    border-radius:8px;

    font-size:15px;
}

.btn{

    width:100%;

    padding:15px;

    background:#ff7a00;

    color:#fff;

    border:none;

    border-radius:8px;

    font-size:18px;

    cursor:pointer;

    transition:.3s;
}

.btn:hover{

    background:#e56d00;
}

.back{

    display:block;

    text-align:center;

    margin-top:20px;

    text-decoration:none;

    color:#ff7a00;

    font-weight:bold;
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

</style>

</head>

<body>

<div class="container">

<h1>Edit Profile</h1>

<form action="editProfile" method="post">

<div class="input-box">

<label>Username</label>

<input
type="text"
name="username"
value="<%=user.getUsername()%>"
required>

</div>

<div class="input-box">

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

</div>

<div class="input-box">

<label>Address</label>

<input
type="text"
name="address"
value="<%=user.getAddress()%>"
required>

</div>

<button class="btn">

Save Changes

</button>

</form>

<a href="profile" class="back">

← Back to Profile

</a>

</div>

</body>
</html>