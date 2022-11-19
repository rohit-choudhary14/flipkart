<%-- 
    Document   : update_name
    Created on : 4 Apr, 2022, 1:12:25 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<%
    String email=null;
    String name=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user"))
           email=c[i].getValue();  
    }
    if(email!=null){
                     if(request.getParameter("name").length()==0){
                         response.sendRedirect("user_profile.jsp?empty_field");
                     }
                     else{
                           name=request.getParameter("name");
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                          Statement st=cn.createStatement();
                          if(st.executeUpdate("update user set name='"+name+"' where email='"+email+"'")>0){
                              
                          }
                         
                         
                         
                         
                         
                     }
            
        
        
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
    
    
    
    
    %>