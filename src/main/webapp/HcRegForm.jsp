<%-- 
    Document   : HcRegForm
    Created on : 2 Jan 2024, 11:11:49 pm
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.cdcms.controller.*" %>
<%@page import="com.cdcms.dao.*" %>
<%@page import="com.cdcms.model.*" %>
<%@page import="jakarta.servlet.ServletContext" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>High Council Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: blue;
            margin: 0;
            padding: 0;
            overflow: auto;
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
            <h1>Registration Form</h1>
            <form action="addHC" method="post" onsubmit="return validateForm()">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" placeholder="Enter your name" required><!-- comment -->
                <br><!-- comment -->

                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
                <br><!-- comment -->

                <label for="phonenum">Phone Number</label>
                <input type="text" name="phonenum" id="phonenum" placeholder="Enter your phone number" required><!-- comment -->
                <br><!-- comment -->

                <label for="bodynum">Body Number</label>
                <input type="text" name="bodynum" id="bodynum" placeholder="Enter your body number" required><!-- comment -->
                <br><!-- comment -->

                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password" required><!-- comment -->
                <br><!-- comment -->

                <label for="password2">Confirm Password</label>
                <input type="password" name="password2" id="password2" placeholder="Confirm your password" required><!-- comment -->
                <br><!-- comment -->

                <button type="submit">Save</button>
                <button type="reset">Cancel</button>
            </form>
        </div>
    </main>
    <footer>
        <p>&copy; 2023 CDCMS. All rights reserved.</p>
    </footer>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("password2").value;

            // Check if email is in lowercase and ends with .com
            var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
            if (email !== email.toLowerCase() || !email.endsWith(".com") || !emailPattern.test(email)) {
                alert("Please enter a valid email address in lowercase and ending with .com");
                return false; // Prevent form submission
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false; // Prevent form submission
            }

            return true; // Continue with form submission
        }
    </script>
</body>
</html>
