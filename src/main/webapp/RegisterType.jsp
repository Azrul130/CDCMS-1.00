<%-- 
    Document   : RegisterType
    Created on : 9 Jan 2024, 4:22:20 am
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
        }

        img {
            width: 10%;
        }

        header {
            background-color: lightblue;
            background-image: url('head_login.jpg');
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

        .type{
            display: flex;
            align-items: center;
            justify-content: left;
        }

        a{
            color:black;
            font-size: 15px;
            text-decoration: none;
        }

        button {
            background-color: #7a73ee;
            padding: 10px;
            margin-left: 10px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }

        footer {
            background-color: lightblue;
            padding: 30px;
            text-align: center;
        }
    </style>
</head>

<body>
    <header>
        <img src="LogoSISPA2.png" alt="CIVIL DEFEND CLUB MANAGEMENT SYSTEM">
        <div class="head">
            <h2>CIVIL DEFEND CLUB MANAGEMENT SYSTEM</h2>
        </div>
    </header>
    <main>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="type">
            <button><a href="MemberRegForm.jsp"><strong>Member</strong></a></button>
            <button><a href="HcRegForm.jsp"><strong>High Council</strong></a></button>
            <button><a href="#"><strong>Advisor</strong></a></button>
        </div>
        <br>
        <br>
        <br>
        <br>
    </main>
    <footer>
        <p>&copy; 2022 CDCMS. All rights reserved.</p>
    </footer>
</body>

</html>
