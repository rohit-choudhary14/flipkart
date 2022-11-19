<%-- 
    Document   : Update_email
    Created on : 4 Apr, 2022, 1:44:46 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<%
    String email=null;
    String email_change=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user"))
           email=c[i].getValue();  
    }
    if(email!=null){
                     if(request.getParameter("email").length()==0){
                         response.sendRedirect("user_profile.jsp?empty_field");
                     }
                     else{
                           String user_code=" ";
                           email_change=request.getParameter("email");
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                          Statement st=cn.createStatement();
                          ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                          if(rs.next()){
                              user_code=rs.getString("user_code");
                          }
                          if(st.executeUpdate("update user set email='"+email_change+"' where user_code='"+user_code+"'")>0){
                             response.sendRedirect("index.jsp");
                          }
                         
                         
                         
                         
                         
                     }
            
        
        
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
    
    
    
    
    %>