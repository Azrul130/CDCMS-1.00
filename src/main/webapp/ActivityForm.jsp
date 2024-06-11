<%-- 
    Document   : activity
    Created on : 3 Jan 2024, 1:38:07 am
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
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color:steelblue;
                background-image: url('LogoSISPA2.png');
                background-size: 50px;
            }

            h1 {
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
            input[type="time"],
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

        <script>
            function validateForm() {
                var selectedDate = document.getElementById('date').value;
                var currentDate = new Date().toISOString().split('T')[0];

                if (selectedDate < currentDate) {
                    alert('Please select a date not later than the current date.');
                    return false; // Prevent the form from being submitted
                }

                return true; // Allow the form to be submitted
            }

        </script>


    </head>

    <body>
        <header>
            <img src="LogoSISPA2.png" alt="CDC">
            <h1>CDCMS</h1>
        </header>

        <nav>
            <ul>
                <li>
                    <a href="<%=request.getContextPath()%>/listacthc?highcouncil_id=<%=((highcouncil) session.getAttribute("hc")).getHighcouncil_id()%>">Activity</a>
                </li>
                <li><a href="AsetHC.jsp">Aset</a></li>
                <li><a href="#">Report</a></li>
                <li><a href="<%=request.getContextPath()%>/viewhcprofile?highcouncil_id=<%=((highcouncil) session.getAttribute("hc")).getHighcouncil_id()%>">Account</a></li>
                <li><a href="LoginPage.jsp">Log out</a></li>
            </ul>
        </nav>

        <main>
            <div class="form-container">
                <form action="addact" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <h1>New Activity</h1>
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" required>
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="5" cols="50"></textarea>
                    <label for="place">Place</label>
                    <input type="text" id="place" name="place" required>
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" required>
                    <label for="time">Time</label>
                    <input type="time" id="time" name="time" required>
                    <label for="proposal">Proposal</label>
                    <input type="file" id="proposal" name="proposal" required><!-- comment -->
                    <input type="hidden" name="highcouncil_id" value="<%=((highcouncil) session.getAttribute("hc")).getHighcouncil_id() %>">
                    <button type="submit">Submit</button>
                </form>
            </div>
        </main>

        <footer>
            <p>&copy; 2022 CDCMS. All rights reserved.</p>
        </footer>
    </body>

</html>