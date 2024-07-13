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
        <title>CDCMS</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

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
            height: 130%;
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

                .btn {
                    background-color: orange;
                }
            }
        </style>

        <script>
            function confirmDelete(activityId) {
                var confirmation = confirm("Are you sure you want to delete this activity?");
                if (confirmation === true) {
                    window.location.href = "deleteact?activity_id=" + activityId;
                } else {
                    window.location.href = "listacthc?activity_id=" + activityId;
                }
            }
        </script>
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
            <div class="row">
                <div class="container">
                    <h3  class="text-center"><strong>List of Activity</strong></h3>
                    <hr><!-- comment -->
                    <div class="container text-left">
                        <a href="<%=request.getContextPath()%>/newact" class="btn btn-success" style=" background-color: navy;">Add New Activity</a> 
                    </div>
                    <br><!-- comment -->
                    <table id="act">
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Place</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Proposal</th>
                            <th>Action</th>
                        </tr>

                        <c:forEach var="activity" items="${listActHc}">
                            <tr>
                                <td>${activity.activity_title}</td>
                                <td>${activity.activity_description}</td>
                                <td>${activity.activity_place}</td>
                                <td>${activity.activity_date}</td>
                                <td>${activity.activity_time}</td>
                                <td>${activity.activity_status}</td>
                                <td><a class="btn btn-success" href="proposal?activity_proposalname=${activity.activity_proposalname}">Download</a></td>
                                <td>
                                    <a class="btn btn-success" style=" background-color: orangered;" href="editact?activity_id=${activity.activity_id}">Update</a>
                                    <a style="background-color: orangered;" class="btn btn-success" 
                                       href="deleteact?activity_id=${activity.activity_id}&highcouncil_id=${activity.highcouncil_id}" 
                                       onclick="confirmDelete(event, this.href)">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </main>
        <script type="text/javascript">
            function confirmDelete(event, url) {
                event.preventDefault(); // Prevent the default anchor behavior

                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: "Deleted!",
                            text: "Your file has been deleted.",
                            icon: "success"
                        }).then(() => {
                            window.location.href = url; // Redirect to the delete URL
                        });
                    }
                });
            }
        </script>

        <footer>
            <p>&copy; 2024 CDCMS. All rights reserved.</p>
        </footer>
    </body>

</html>
