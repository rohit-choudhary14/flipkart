<%-- 
    Document   : password_change
    Created on : 4 Apr, 2022, 3:13:53 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String Current_password="";
    String new_password="";
    String confirm_password=""; 
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                   if(request.getParameter("password").length()==0 || request.getParameter("npass").length()==0 || request.getParameter("rpass").length()==0){
                       response.sendRedirect("user_profile.jsp?empty_field");
                   }
                   else{
                            String pass=""; 
                           Current_password=request.getParameter("password");
                           new_password=request.getParameter("npass");
                           confirm_password=request.getParameter("rpass");
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                           Statement st=cn.createStatement();
                           Statement st1=cn.createStatement();
                           ResultSet rs=st.executeQuery("select password from user where email='"+email+"'");
                           if(rs.next()){
                               pass=rs.getString("password");
                               if(pass.equals(Current_password)){ 
                                   
                                    if(new_password.equals(confirm_password)){
                                        if(st1.executeUpdate("update user set password="+new_password+" ,confirm_password="+new_password+" where email='"+email+"' ")>0){
                                            response.sendRedirect("logout.jsp");
                                        }
                                    }
                                    else{
                                            response.sendRedirect("user_profile.jsp?link=home_account&current_password_AND_retype_password_does't_match");
                                    }

                               }
                               else{
                                   response.sendRedirect("user_profile.jsp?link=home_account&Current password does't match");
                               }
                           }
                           
                           
                           
                           
                           
                          
                       
                       
                   }
        
        
    }
    else{
        response.sendRedirect("index.jsp"); 
    }
    
    
    
    
    
    
    %>
