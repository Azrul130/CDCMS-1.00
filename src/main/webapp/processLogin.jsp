<%-- 
    Document   : processLogin
    Created on : 9 Jan 2024, 4:49:23 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.cdcms.model.*" %>
<%@page  import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Login</title>
    </head>
    <body>
        <jsp:useBean id="hc" class="com.cdcms.model.highcouncil" scope="session"></jsp:useBean>
        <jsp:useBean id="advisor" class="com.cdcms.model.Advisor" scope="session"></jsp:useBean>
        <jsp:useBean id="mbr" class="com.cdcms.model.member" scope="session"></jsp:useBean>


        <%
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            int loginType = Integer.parseInt(request.getParameter("loginType"));
            
            String url = "jdbc:mysql://localhost:3306/cdcms";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,"root","admin");
            
            
             if (loginType == 2){
             
                String Query = "SELECT * FROM highcouncil where highcouncil_email = ?";
                PreparedStatement ps = con.prepareStatement(Query);

                ps.setString(1, email );

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
                    hc.setHighcouncil_id(rs.getInt(1));
                    hc.setHighcouncil_name(rs.getString(2));
                    hc.setHighcouncil_email(rs.getString(3));
                    hc.setHighcouncil_password(rs.getString(4));
                    hc.setHighcouncil_phonenum(rs.getString(5));
                    hc.setHighcouncil_bodynum(rs.getString(6));
                }
                
                

                if (hc != null && hc.getHighcouncil_email() != null && hc.getHighcouncil_email().equals(email) 
                    && hc.getHighcouncil_password().equals(pass) ){
                    out.print("<h1>login Success</h1>");
                    session.setAttribute("highcouncil", hc);
                    response.sendRedirect("Dashboard.jsp");                
                } else {
                    request.setAttribute("loginStatus", false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
                    dispatcher.forward(request, response);
                }
                con.close();             
                 }else if(loginType == 3){
                
                                     //response.sendRedirect("listact");                

                String Query = "SELECT * FROM advisor where advisor_email = ?";
                PreparedStatement ps = con.prepareStatement(Query);

                ps.setString(1, email );

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
                    advisor.setAdvisor_id(rs.getInt(1));
                    advisor.setAdvisor_name(rs.getString(2));
                    advisor.setAdvisor_email(rs.getString(3));
                    advisor.setAdvisor_password(rs.getString(4));
                    advisor.setAdvisor_phonenum(rs.getString(5));
                }

                if (advisor != null && advisor.getAdvisor_email() != null && advisor.getAdvisor_email().equals(email) 
                    && advisor.getAdvisor_password().equals(pass) ){
                    out.print("<h1>login Success</h1>");
                    session.setAttribute("advisor", advisor);
                    response.sendRedirect("DashboardAdvisor.jsp");                
                } else {
                    request.setAttribute("loginStatus", false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
                    dispatcher.forward(request, response);
                }
                con.close();
                
            }else{                         

                String Query = "SELECT * FROM member where member_email = ?";
                PreparedStatement ps = con.prepareStatement(Query);

                ps.setString(1, email );

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
                    mbr.setMember_id(rs.getInt(1));
                    mbr.setMember_name(rs.getString(2));
                    mbr.setMember_email(rs.getString(3));
                    mbr.setMember_password(rs.getString(4));
                    mbr.setMember_phonenum(rs.getString(5));
                }

                if (mbr != null && mbr.getMember_email() != null && mbr.getMember_email().equals(email) 
                    && mbr.getMember_password().equals(pass) ){
                    out.print("<h1>login Success</h1>");
                    session.setAttribute("member", mbr);
                    response.sendRedirect("DashboardMember.jsp");                
                } else {
                    request.setAttribute("loginStatus", false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
                    dispatcher.forward(request, response);
                }
                con.close();
                
            }
            
            
        %>

    </body>
</html>

