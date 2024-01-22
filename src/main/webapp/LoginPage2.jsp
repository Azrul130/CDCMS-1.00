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
        <style>
            body {
                font-family: Arial, sans-serif;
                background: blue;
                margin: 0;
                padding: 0;
                overflow:auto;
            }

            img {
                width: 10%;
            }

            header {
                background-color: lightblue;
                background-image: url("head_login.jpg");
                background-size: 10%;
                padding: 40px;
                display: flex;
                align-items: center;
                justify-content: center;

            }

            main {
                padding: 50px;
                padding-bottom: 80px;
                background-color: blue;

            }

            .head {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            h1 {
                font-family: "Georgia", Times, serif;
                text-align: center;
                text-shadow:
                    -1px -1px 0 lightblue,
                    1px -1px 0 lightblue,
                    -1px 1px 0 lightblue,
                    1px 1px 0 lightblue;
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

            footer {
                padding: 30px;
            }

            .container {
                height: 100px;
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

            footer {
                background-color: lightblue;
                padding: 10px;
                text-align: center;
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
                <form>
                    <h1>Login</h1>
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email">

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password">
                    <div class="logintype">
                        <button><a href="#">Member</a></button>
                        <button><a href="LoginPage.jsp">High Council</a></button>
                        <button  style="background-color: #7a73ee;"><a href="LoginPage2.jsp">Advisor</a></button>
                    </div>
                    <button type="submit">Login</button>
                </form>
                <p>Not a member? <a href="RegisterType.jsp" class="login-link">Register</a></p>
            </div>
        </main>
        <footer>
            <p>&copy; 2023 CDCMS. All rights reserved.</p>
        </footer>
    </body>
</html>

