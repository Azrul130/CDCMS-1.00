<%-- 
    Document   : AssetForm
    Created on : 22 May 2024, 5:08:27 pm
    Author     : Azrul Hafizam
--%>


<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.cdcms.dao.*" %>
<%@page import="com.cdcms.model.*" %>
<%@page import="com.cdcms.controller.*" %>
<%@page import="jakarta.servlet.ServletContext" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CDCMS</title>
        <style>
                        html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: steelblue;
            }

            body::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('LogoSISPA2.png');
                background-size: 50px;
                height: 150%;
                filter: blur(2px);
                z-index: -1; /* Places the image behind other content */
            }

            h2 {
                text-align: center;
            }

            header {
                background-color: lightblue;
                background-image: url('BGHeader2.png');
                background-size: 600px;
                padding: 20px;
                text-align: left;
                display: flex;
                align-items: center;
                justify-content: left;
            }

            img {
                width: 8%;
                height: 10%;
            }

            header h1 {
                padding-left: 20px;
                color: black;
                text-shadow:
                    -1px -1px 0 white,
                    1px -1px 0 white,
                    -1px 1px 0 white,
                    1px 1px 0 white;
            }

            nav ul {
                background-color: #333;
                list-style-type: none;
                margin: 0;
                padding: 0;
                text-align: center;

            }

            nav ul li {
                display: inline;
            }

            nav ul li a {
                color: white;
                display: inline-block;
                padding: 14px 16px;
                margin: 0;
                text-decoration: none;
            }

            nav ul li a:hover {
                background-color: #ddd;
                color: black;
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
            input[type="number"],
            input[type="file"],
            input[type="date"],
            textarea {
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

            main {
                padding: 20px;
                box-sizing: border-box;

            }

            footer {
                background-color: lightblue;
                padding: 10px;
                text-align: center;
            }

            table {
                border: 1px;
            }

            textarea {
                resize: none;
            }
        </style>
        
    </head>

    <body>
        <header>
            <img src="LogoSISPA2.png" alt="CDC" class="img-fluid">
            <a href="Dashboard.jsp" style="text-decoration: none;"><h1>CDCMS</h1></a>
        </header>

        <nav>
            <ul>
                <li>
                    <a href="<%=request.getContextPath()%>/listacthc?highcouncil_id=<%=((highcouncil) session.getAttribute("hc")).getHighcouncil_id()%>">Activity</a>
                </li>
                <li><a href="<%=request.getContextPath()%>/listAsset">Asset</a></li>
                <li><a href="reportactivityHc">Report</a></li>
                <li><a href="<%=request.getContextPath()%>/viewhcprofile?highcouncil_id=<%=((highcouncil) session.getAttribute("hc")).getHighcouncil_id()%>">Account</a></li>
                <li><a href="LoginPage.jsp">Log out</a></li>
            </ul>
        </nav>

        <main>
            <div class="form-container">
                <form action="addAsset" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <h2>New Asset</h2>
                    <label for="name">Asset Name</label>
                    <input type="text" id="name" name="name" required>
                    <label for="quantity">Quantity</label>
                    <input type="number" id="quantity" name="quantity" required>
                    <label for="photo">Photo</label>
                    <input type="file" id="photo" name="photo" required>                    
                    <button type="submit">Submit</button>
                </form>
            </div>
        </main>

        <footer>
            <p>&copy; 2022 CDCMS. All rights reserved.</p>
        </footer>
    </body>

</html>
