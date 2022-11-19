<%-- 
    Document   : business_details
    Created on : 7 Apr, 2022, 6:32:01 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   String pickupaddress="";
   String user_code="";
   String pin_code="";
   String dist="";
   String state=""; 
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("pincode").length()==0 || request.getParameter("user_code").length()==0 || request.getParameter("dist").length()==0|| request.getParameter("state").length()==0 || request.getParameter("pickupaddress").length()==0){
                     
                  }
                  else{
                       
                       pin_code=request.getParameter("pincode"); 
                       user_code=request.getParameter("user_code");
                       dist=request.getParameter("dist");
                       state=request.getParameter("state");
                       pickupaddress=request.getParameter("pickupaddress");
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            PreparedStatement ps=cn.prepareStatement("insert into pickup values(?,?,?,?,?)");
                            ps.setString(1,pin_code);
                            ps.setString(2,pickupaddress);
                            ps.setString(3,state);
                            ps.setString(4,dist);
                            ps.setString(5,user_code);
                            if(ps.executeUpdate()>0){ 
                               
                            }
                            else{
                               
                            }
                       }
                       catch(Exception e){}  
                       
                      
                      
                      
                  }
       
       
   }
   else{
       
       response.sendRedirect("index.jsp");
   }
    
    
    
    
    
    
    %>