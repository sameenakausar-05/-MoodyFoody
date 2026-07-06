<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login | MoodyFoody</title>

<link rel="stylesheet" href="styles.css">

</head>

<body class="login-body">

<div class="login-container">

    <div class="login-left">

        <h1>🍔 MoodyFoody</h1>

        <h2>Good Food, Good Mood.</h2>

        <p>

            Discover the best restaurants in your city
            and enjoy delicious meals delivered fast.

        </p>

    </div>


    <div class="login-card">

        <h2>Welcome Back 👋</h2>
        
        <%
String msg = request.getParameter("msg");

if("loginRequired".equals(msg)){
%>

<div class="login-message">
🔒 Please login to place your order.
</div>

<%
}
%>


 		<form action="login" method="post" autocomplete="off">

            <div class="input-group">

                <span>📧</span>

                <input
                    type="email"
                    name="email"
                    placeholder="Email Address"
                    autocomplete="off"
                    required>

            </div>


            <div class="input-group">

                <span>🔒</span>

                <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    autocomplete="new-password"
                    required>

            </div>

           <button type="submit" class="login-btn">
    			Login
			</button>

        </form>

        <p class="register-link">

   Don't have an account?

    <a href="register.jsp">
        Register Now
    </a>

</p>

    </div>

</div>

</body>
</html>