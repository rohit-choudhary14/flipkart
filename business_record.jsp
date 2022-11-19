<%-- 
    Document   : business_record
    Created on : 7 Apr, 2022, 10:23:16 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   
   String GST="";
   String seller_code="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("gst").length()==0){
                      
                  }
                  else{
                       
                       GST=request.getParameter("gst"); 
                       
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select user_code from dealer where email='"+email+"'");
                            if(rs.next()){
                                seller_code=rs.getString("user_code");
                           
                                    PreparedStatement ps=cn.prepareStatement("insert into gst values(?,?)");
                                    ps.setString(1,GST);
                                    ps.setString(2,seller_code); 

                                    if(ps.executeUpdate()>0){ 
                                         response.sendRedirect("bank_details.jsp?code="+seller_code);
                                    }
                                    else{

                                    }
                            }
                       }
                       catch(Exception e){}  
                       
                      
                      
                      
                  }
       
       
   }
   else{
       
       response.sendRedirect("index.jsp");
   }
    
    
    
    
    
    
    %>