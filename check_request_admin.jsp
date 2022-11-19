<%-- 
    Document   : check_request_admin
    Created on : 14 Apr, 2022, 10:00:45 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String seller_email="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
        
        
    
    }
    if(email!=null){
                       if(request.getParameter("seller_email").length()==0){
                           
                       }
                       else{   
                               int status=0;
                               seller_email=request.getParameter("seller_email");
                                try{
                                     Class.forName("com.mysql.jdbc.Driver");
                                     Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                     Statement st=cn.createStatement();
                                     ResultSet rs=st.executeQuery("select * from dealer where seller_email='"+seller_email+"'");
                                     if(rs.next()){
                                        status=rs.getInt("status"); 
                                        
                                        if(status==0){
                                           out.print("0");
                                        }
                                        else if(status==1){
                                            out.print("1");
                                        }
                                     }
                                     else{
                                         out.print("2");
                                     }

                                }
                                catch(Exception e){

                                }
                           
                           
                       }
    }
    else{
        
        
    }
    
    
    
    %>