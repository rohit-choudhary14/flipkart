<%-- 
    Document   : bank_recored
    Created on : 7 Apr, 2022, 11:06:39 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   
   String account_holder_name="";
   String account_number=""; 
   String seller_code="";
   String ifsc=""; 
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("account").length()==0 || request.getParameter("account_number").length()==0 || request.getParameter("ifsc").length()==0){
                      
                  }
                  else{
                       
                       account_holder_name=request.getParameter("account"); 
                       account_number=request.getParameter("account_number");
                       ifsc=request.getParameter("ifsc");
                       
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select user_code from dealer where email='"+email+"'");
                            if(rs.next()){
                                seller_code=rs.getString("user_code");
                           
                                    PreparedStatement ps=cn.prepareStatement("insert into bank values(?,?,?,?)");
                                    ps.setString(1,account_holder_name);
                                    ps.setString(2,account_number); 
                                    ps.setString(3,ifsc);
                                    ps.setString(4,seller_code);

                                    if(ps.executeUpdate()>0){ 
                                         response.sendRedirect("seller_register.jsp"); 
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