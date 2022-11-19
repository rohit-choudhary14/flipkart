<%-- 
    Document   : seller_logout
    Created on : 7 Apr, 2022, 1:53:49 AM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie s=new Cookie("seller","");
    s.setMaxAge(0);
    response.addCookie(s);
    
    response.sendRedirect("seller_register.jsp");
    
    
    %>
