<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <style>
  .footer{

    background:#1F2937;

    color:white;

    padding:50px 80px 20px;

    margin-top:80px;

}

.footer-top{

    display:flex;

    justify-content:space-between;

    flex-wrap:wrap;

    gap:40px;

}

.footer-brand h2{

    color:#E67E22;

    margin-bottom:15px;

}

.footer-brand p{

    color:#ccc;

    max-width:300px;

    line-height:1.7;

}

.footer-links{

    display:flex;

    flex-direction:column;

}

.footer-links h3,
.footer-contact h3{

    margin-bottom:15px;

    color:#E67E22;

}

.footer-links a{

    color:#ddd;

    text-decoration:none;

    margin-bottom:10px;

    transition:.3s;

}

.footer-links a:hover{

    color:#ff9f43;

    padding-left:6px;

}

.footer-contact p{

    color:#ddd;

    margin-bottom:10px;

}

.footer hr{

    margin:35px 0 20px;

    border:none;

    height:1px;

    background:#444;

}

.footer-bottom{

    text-align:center;

    color:#aaa;

    font-size:15px;

}
  </style>
<div class="footer">

    <div class="footer-top">

        <div class="footer-brand">

            <h2>🍴 MoodyFoody</h2>

            <p>
                Serving happiness, one meal at a time.
            </p>

        </div>

        <div class="footer-links">

            <h3>Quick Links</h3>

            <a href="index.jsp">Home</a>

            <a href="restaurants">Restaurants</a>

            <a href="about.jsp">About</a>

            <a href="profile">Profile</a>

        </div>

        <div class="footer-contact">

            <h3>Contact</h3>

            <p>📍 Bangalore, India</p>

            <p>📧 support@moodyfoody.com</p>

            <p>📞 +91 98765 43210</p>

        </div>

    </div>

    <hr>

    <div class="footer-bottom">

        © 2026 MoodyFoody | All Rights Reserved.

    </div>

</div>