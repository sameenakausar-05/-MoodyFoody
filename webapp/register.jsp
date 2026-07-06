<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Register | MoodyFoody</title>

<link rel="stylesheet" href="styles.css">

</head>

<body class="login-body">

<div class="login-container">

    <!-- Left Section -->

    <div class="login-left">

        <h1>🍔 MoodyFoody</h1>

        <h2>Join the Food Family!</h2>

        <p>

            Create your account and explore hundreds of
            restaurants with delicious meals delivered to your
            doorstep.

        </p>

    </div>


    <!-- Right Section -->

    <div class="login-card">

        <h2>Create Account 🚀</h2>

        <p class="subtitle">

            Fill your details to start ordering.

        </p>

        <form action="register" method="post">

            <div class="input-group">

                <span>👤</span>

                <input
                    type="text"
                    name="username"
                    placeholder="Full Name"
                    required>

            </div>


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

                <span>📱</span>

                <input
                    type="text"
                    name="phone"
                    placeholder="Phone Number"
                    required>

            </div>


            <div class="input-group">

                <span>📍</span>

                <input
                    type="text"
                    name="address"
                    placeholder="Address"
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
                Create Account</a>

            </button>
        </form>

        <p class="register-link">

            Already have an account?

            <a href="login.jsp">

                Login

            </a>

        </p>

    </div>

</div>

</body>
</html>