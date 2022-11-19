<%-- 
    Document   : pincode_verification
    Created on : 7 Apr, 2022, 12:54:34 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<%
    String email=null;
    String pincode="";
    String state="";
    String dist="";
    int flag=0; 
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user"))
            email=c[i].getValue(); 
    }
    if(email!=null){
                  if(request.getParameter("pincode").length()==0){
                      
                      
                  }
                  else{
                        pincode=request.getParameter("pincode");
                        try{ 
                             Class.forName("com.mysql.jdbc.Driver");
                             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                             Statement st=cn.createStatement();
                             ResultSet rs=st.executeQuery("select * from pincode where pincode='"+pincode+"'");
                             while(rs.next()){
                                 flag=1;
                                 state=rs.getString("state");
                                 dist=rs.getString("dist");
                                 
                             }
                             if(flag==1){
                               out.print(state+"/"+dist);
                             }
                             else{
                                 out.print("try");
                             }
                            
                            
                        }
                        catch(Exception e){}
                      
                      
                  }
        
        
        
    }
    else{
         response.sendRedirect("index.jsp"); 
        
        
    }
    
    
    
    
    
    %>