<%-- 
    Document   : LoginPage
    Created on : 28 Dec 2023, 2:55:13 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>CIVIL DEFEND CLUB MANAGEMENT SYSTEM</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {
                font-family: Arial, sans-serif;
                background: blue;
                margin: 0;
                padding: 0;
                overflow:auto;
                background-image: url("bglogin.jpg");
                background-size: 100%;
            }

            img {
                width: 9%;
            }

            header {
                background: transparent;
                <%--background-image: url("head_login.jpg");--%>
                background-size: 10%;
                padding: 30px;
                padding-bottom: 20px;
                padding-top: 20px;
                display: flex;
                align-items: center;
                justify-content: center;

            }

            main {
                padding: 50px;
                padding-bottom: 40px;
            }

            .head {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            h1 {
                font-family: "Georgia", Times, serif;
                text-align: center;
            }

            h2 {
                font-size: 30px;
                text-align: center;
                padding-left: 30px;
                text-shadow:
                    -2px -2px 0 white,
                    2px -2px 0 white,
                    -2px 2px 0 white,
                    2px 2px 0 white;
            }

            .container {
                height: 80px;
            }

            .form-container {
                width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                border-radius: 5px;

            }

            input[type="text"],
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #7a73ee;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                border-radius: 4px;
            }

            button:hover {
                background-color: #45a049;
            }

            .login-link {
                color: #000;
                text-decoration: none;
            }

            .login-link:hover {
                color: #000;
                text-decoration: underline;
            }

            .logintype {
                display: flex;
                align-items: center;
                justify-content: left;
            }

            .logintype button {
                background-color: blueviolet;
                margin-left: 3px;
                margin-right: 3px;
                border-radius: 25px;
            }

            .logintype a {
                color: white;
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <header>
            <img src="image/LogoSISPA2.png" alt="CDC">
            <div class="head">
                <h2>CIVIL DEFEND CLUB MANAGEMENT SYSTEM</h2>
            </div>
        </header>
        <main>
            <div class="form-container">
                <form action="processLogin.jsp" method="post">
                    <h2>Login</h2>
                    <% if (request.getAttribute("loginStatus") != null && (boolean)request.getAttribute("loginStatus") == false) { %>
                    <div class="alert alert-danger" role="alert">
                        Login Unsuccessful
                    </div>
                    <% } %>
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <input type="radio" id="mem" name="loginType" value="1">
                    <label for="mem">Member</label>
                    <input type="radio" id="hc" name="loginType" value="2" checked>
                    <label for="hc">High Council</label>
                    <input type="radio" id="adv" name="loginType" value="3" >
                    <label for="adv">Advisor</label> <br>


                    <button type="submit">Login</button>
                </form>
                <p>Not a member? <a href="RegisterType.jsp" class="login-link">Register</a></p>
            </div>
        </main>
    </body>
</html>

