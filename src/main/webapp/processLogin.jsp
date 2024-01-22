<%-- 
    Document   : processLogin
    Created on : 9 Jan 2024, 4:49:23 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.cdcms.model.highcouncil" %>
<%@page import="com.cdcms.model.advisor" %>
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
        <jsp:useBean id="hc" class="com.cdcms.model.highcouncil" scope="session" />
        <%-- <jsp:useBean id="ad" class="com.cdcms.model.advisor" scope="session" /> --%>
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
                    session.setAttribute("hc", hc);
                    response.sendRedirect("Dashboard.jsp");                
                } else {
                    request.setAttribute("loginStatus", false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
                    dispatcher.forward(request, response);
                }
                con.close();             
                 }else{
                
                                     response.sendRedirect("listact");                

                /* String Query = "SELECT * FROM advisor where advisor_email = ?";
                PreparedStatement ps = con.prepareStatement(Query);

                ps.setString(1, email );

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
                    adv.setAdvisor_id(rs.getInt(1));
                    adv.setAdvisor_name(rs.getString(2));
                    adv.setAdvisor_email(rs.getString(3));
                    adv.setAdvisor_password(rs.getString(4));
                    adv.setAdvisor_phonenum(rs.getString(5));
                }

                if (adv != null && adv.getAdvisor_email() != null && adv.getAdvisor_email().equals(email) 
                    && adv.getAdvisor_password().equals(pass) ){
                    out.print("<h1>login Success</h1>");
                    session.setAttribute("adv", adv);
                    response.sendRedirect("ActivityAdvisor.jsp");                
                } else {
                    request.setAttribute("loginStatus", false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
                    dispatcher.forward(request, response);
                }
                con.close();
                */
            }
            
            
        %>

    </body>
</html>

