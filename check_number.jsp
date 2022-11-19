<%-- 
    Document   : check_number
    Created on : 11 Apr, 2022, 1:32:43 AM
    Author     : rohit
--%>
 
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%> 
<%
     String email=null;
   String number="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("number").length()==0){
                      
                  }
                  else{
                       
                       number=request.getParameter("number"); 
                       
                      
     try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                Statement st=cn.createStatement(); 
                ResultSet rs=st.executeQuery("select * from dealer where mb='"+number+"'");
                if(rs.next()){  
                    out.print("success");
                }
                else{
                     out.print("again");
                }
     }
     catch(Exception e){}
     
                  }
   }
   
    
    
    
    
    %>