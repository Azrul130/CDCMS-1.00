<%-- 
    Document   : Dashboard
    Created on : 3 Jan 2024, 12:39:16 am
    Author     : Azrul Hafizam
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                display: flex;
                flex-direction: column;
                background-color:steelblue;
                background-image: url('LogoSISPA2.png');
                background-size: 50px;

            }

            h2{
                padding: 10px;
                font-size: 30px;
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



            main {
                background-color: white; 
                padding: 20px;
                margin-left: 30px;
                margin-right:30px;
                margin-bottom: 150px;
                margin-top: 50px;
                box-sizing: border-box;
                background-size: 200%;
                background-position:center;
                border-radius: 30px;
                height: 30px;
                padding-bottom: 150px;

            }

            footer {
                background-color: darkslategray;
                color: white;
                padding: 10px;
                padding-bottom: 100px;
                text-align: center;
            }

            table{
                width: 100%;
                max-width: 100%
            }

            #act td, #act th {
                padding: 8px;
                border-bottom: 1px solid #000;
            }

            #act tr:nth-child(even){
                background-color: #f2f2f2;
            }

            #act tr:nth-child(odd){
                background-color: #f3f3f3;
            }

            #act tr:hover {
                background-color: #ddd;
            }

            #act th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:cornflowerblue;
                color: white;

                a {
                    text-decoration: none;
                    margin-bottom: 10px;
                }

                .btn {
                    background-color: orange;
                }
                
                    #welcome-message {
            text-align: center;
            margin-top: 20px;
            font-size: 24px;
            color: white;
            text-shadow: 1px 1px 1px #333;
        }


            }
        </style>
    </head>
    <body>
        <header>
            <h1>CDCMS</h1>
        </header>

        <nav>
            <ul>
                <li>
                    <a href="listact">Activity</a>
                </li>
                <li><a href="#">Report</a></li>
                <li><a href="#">Account</a></li>
                <li><a href="LoginPage.jsp">Log out</a></li>
            </ul>
        </nav>

        <main>
        <!-- Welcoming message -->
        <div id="welcome-message">
            <h2>Welcome, <c:out value="${advisor.advisor_name}"/>!</h2>
        </div>

        <!-- Rest of your content goes here -->
    </main>

        <footer>
            <p>&copy; 2022 CDCMS. All rights reserved.</p>
        </footer>
    </body>
</html>