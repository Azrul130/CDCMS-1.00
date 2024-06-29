<%-- 
    Document   : activity
    Created on : 3 Jan 2024, 1:38:07 am
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
        <title>Activity Status (Advisor)</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color:steelblue;

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
                filter: blur(2px);
                z-index: -1; /* Places the image behind other content */
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

            .status{
                display: inline;
                padding: 15px;
                margin: 10px;
            }


        </style>
    </head>

    <body>
        <header>
            <img src="LogoSISPA2.png" alt="CDC" class="img-fluid">
            <a href="DashboardAdvisor.jsp" style="text-decoration: none;"><h1>CDCMS</h1></a>
        </header>

        <nav>
            <ul>
                <li><a href="<%=request.getContextPath()%>/listact">Activity</a></li>
                <li><a href="reportactivityAdv">Report</a></li>
                <li><a href="<%=request.getContextPath()%>/viewADVprofile?advisor_id=<c:out value="${advisor.advisor_id}"/>">Account</a></li>
                <li><a href="LoginPage.jsp">Log out</a></li>
            </ul>
        </nav>

        <main>

            <div class="form-container">
                <form action="updateact2?activity_id=${activity.activity_id}&activity_proposalname=${activity.activity_proposalname}&highcouncil_id=${activity.highcouncil_id}" method="post" enctype="multipart/form-data">
                    <h1>Activity Status</h1>
                    <p><strong>Title :      </strong> ${activity.activity_title}</p>
                    <p><strong>Description :</strong> ${activity.activity_description}</p>
                    <p><strong>Place :      </strong> ${activity.activity_place}</p>
                    <p><strong>Date :       </strong>${activity.activity_date}</p>
                    <p><strong>Time :       </strong>${activity.activity_time}</p>


                    <%--
                    <input type="text" id="title" name="title" value="${activity.activity_title}" readonly="">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="5" cols="50" maxlength="200" readonly>${activity.activity_description}</textarea>
                    <label for="place">Place</label>
                    <input type="text" id="place" name="place" value="${activity.activity_place}" readonly>
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" value="${activity.activity_date}" readonly>
                    <label for="time">Time</label>
                    <input type="time" id="time" name="time" value="${activity.activity_time}" readonly>
                    --%>
                    <input type="radio" id="app" name="status" value="Approve">
                    <label for="app">Approve</label>
                    <input type="radio" id="rej" name="status" value="Reject">
                    <label for="rej">Reject</label>
                    <br>
                    <button type="submit">Submit</button>
                </form>
            </div>

        </main>


        <footer>
            <p>&copy; 2022 CDCMS. All rights reserved.</p>
        </footer>
    </body>

</html>