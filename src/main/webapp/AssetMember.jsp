<%-- 
    Document   : activity
    Created on : 3 Jan 2024, 1:38:07 am
    Author     : Azrul Hafizam
--%>

<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.cdcms.dao.*" %>
<%@page import="com.cdcms.model.*" %>
<%@page import="com.cdcms.controller.*" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aset Management(ADMIN)</title>
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
            height: 170%;
            background-image: url('LogoSISPA2.png');
            background-size: 50px;
            filter: blur(2px);
            z-index: -1; /* Places the image behind other content */
        }

        .title-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: orange;
            padding: 10px;
            border: #000;
            border-radius: 10px;
            position: relative;
        }

        .title {
            text-align: center;
            flex: 1;
        }

        h3 {
            margin: 0;
        }

        .custom-button {
            background-color: navy;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 0;
            cursor: pointer;
            border-radius: 5px;
            position: absolute;
            right: 10px;
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
        
                .container {
                height: 100px;
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
            background-position: center;
            padding-bottom: 150px;
        }

        footer {
            background-color: darkslategray;
            color: white;
            padding: 10px;
            padding-bottom: 100px;
            text-align: center;
        }

        table {
            width: 100%;
            max-width: 100%;
        }

        #act td, #act th {
            padding: 8px;
            border-bottom: 1px solid #000;
        }

        #act tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #act tr:nth-child(odd) {
            background-color: #f3f3f3;
        }

        #act tr:hover {
            background-color: #ddd;
        }

        #act th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: cornflowerblue;
            color: white;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 16px;
            padding: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }

        .product-card {
            display: flex;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card img {
            width: 150px;
            height: auto;
        }

        .product-info {
            padding: 16px;
            flex: 1;
        }

        .product-info h2 {
            font-size: 1rem;
            margin: 0 0 10px;
            color: #333;
        }

        .product-info .price {
            font-size: 1.2rem;
            color: #e60000;
            margin: 0 0 10px;
        }

        .product-info .sold {
            font-size: 0.9rem;
            color: #777;
        }

        .product-info .location {
            font-size: 0.8rem;
            color: #aaa;
        }
    </style>
</head>

<body>
    <header>
        <img src="LogoSISPA2.png" alt="CDC" class="img-fluid">
        <a href="DashboardMember.jsp" style="text-decoration: none;">
            <h1>CDCMS</h1>
        </a>
    </header>

    <nav>
        <ul>
            <li><a href="listActMember">Activity</a></li>
            <li><a href="<%=request.getContextPath()%>/listAssetMember?member_id=<c:out value="${member.member_id}"/>">Asset</a></li>
            <li><a href="<%=request.getContextPath()%>/viewmemberprofile?member_id=<c:out value="${member.member_id}"/>">Account</a></li>
            <li><a href="LoginPage.jsp">Log out</a></li>
        </ul>
    </nav>

    <main>
        <div class="title-container">
            <div class="title">
                <h3><strong>List Asset</strong></h3>
            </div>
            <a class="custom-button" href="listAssetBorrowerMember?member_id=<c:out value="${member.member_id}"/>">View Application</a>
        </div>

        <div class="product-grid">
            <c:forEach var="asset" items="${listAsset}">
                <div class="product-card">
                    <c:set var="base64Picture" value="${asset.getAsset_photoBase64()}" />
                    <c:if test="${not empty base64Picture}">
                        <img src="data:image/png;base64,${base64Picture}" width="100" height="100" />
                    </c:if>
                    <div class="product-info">
                        <h2><c:out value="${asset.asset_name}" /></h2>
                        <%--    <p class="price"><c:out value="${asset.asset_quantity}" /></p> --%>
                        <p class="sold"><c:out value="${asset.asset_status}" /></p>
                        <a class="btn btn-success" style="background-color: orangered;" 
                           href="borrowform?asset_id=<c:out value="${asset.asset_id}" />&member_id=<c:out value="${member.member_id}"/>">Apply</a>
                    </div>
                </div>                         
            </c:forEach>
        </div>
    </main>

    <footer>
        <p>&copy; 2022 CDCMS. All rights reserved.</p>
    </footer>
</body>

</html>
