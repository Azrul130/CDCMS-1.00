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
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>CDCMS</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

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
                                height: 180%;
                                background-image: url('LogoSISPA2.png');
                                background-size: 50px;
                                filter: blur(2px);
                                z-index: -1; /* Places the image behind other content */
                            }

                            h3{
                                background-color: orange;
                                padding: 10px;
                                border:#000;
                                border-radius: 20px;
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
                                padding: 20px;
                                box-sizing: border-box;
                                background-size: 200%;
                                background-position:center;
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

                                input[type="button"] {
                                    background-color: orange;

                                    margin-bottom: 10px;

                                }


                            }
                        </style>

                        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                        <script type="text/javascript">
                            $("#btnPrint").live("click", function () {
                                var divContents = $("#dvContainer").html();
                                var printWindow = window.open('', '', 'height=400,width=800');
                                printWindow.document.write('<html><head><title>Report</title><style>');
                                printWindow.document.write('table{width: 100%;max-width: 100%;text-align: left;}table, th, td {border:1px solid black;}');
                                printWindow.document.write('</style></head><body >');
                                printWindow.document.write('<h3>Activity Report</h3>');
                                printWindow.document.write(divContents);
                                printWindow.document.write('</body></html>');
                                printWindow.document.close();
                                printWindow.print();
                            });

                            function filterActivities() {
                                var table, tr, td, i;
                                table = document.getElementById("act");
                                tr = table.getElementsByTagName("tr");

                                for (i = 1; i < tr.length; i++) {
                                    td = tr[i].getElementsByTagName("td")[6];
                                    if (td) {
                                        var status = td.textContent || td.innerText;
                                        if (status === "Approve" || status === "Reject") {
                                            tr[i].style.display = "";
                                        } else {
                                            tr[i].style.display = "none";
                                        }
                                    }
                                }
                            }

                            document.addEventListener("DOMContentLoaded", function () {
                                filterActivities();
                            });
                        </script>
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
                                <form id="form1">
                                    <div class="row">
                                        <div class="container">
                                            <h3 class="text-center"><strong>Activity Report</strong></h3>
                                            <div style="margin:5px;">
                                                <a class="btn btn-success" style="background-color:navy" id="btnPrint">Print Report</a>
                                                <a class="btn btn-success" style="background-color:navy" href="reportassetHc">Asset Application Report</a>
                                            </div>
                                            <br>
                                                <div id="dvContainer">
                                                    <table id="act">
                                                        <tr>
                                                            <th>Activity ID</th>
                                                            <th>Title</th>
                                                            <th>Description</th>
                                                            <th>Place</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>Status</th>
                                                        </tr>
                                                        <c:forEach var="activity" items="${listAct}">
                                                            <tr>
                                                                <td>${activity.activity_id}</td>
                                                                <td>${activity.activity_title}</td>
                                                                <td>${activity.activity_description}</td>
                                                                <td>${activity.activity_place}</td>
                                                                <td>${activity.activity_date}</td>
                                                                <td>${activity.activity_time}</td>
                                                                <td>${activity.activity_status}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </table>
                                                </div>
                                        </div>
                                    </div>
                                </form>
                            </main>



                            <footer>
                                <p>&copy; 2022 CDCMS. All rights reserved.</p>
                            </footer>
                        </body>

                        </html>
