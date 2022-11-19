<%-- 
    Document   : fav_product
    Created on : 16 May, 2022, 10:15:15 AM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

<%
    String email=null;
    String product_code="";
    Cookie c[]=request.getCookies(); 
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                 if(request.getParameter("product_code").length()==0){
                     
                 }
                 else{
                     product_code=request.getParameter("product_code");
                     try{
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                          Statement st=cn.createStatement();
                          ResultSet rs=st.executeQuery("select * from fav_product where product_code='"+product_code+"' AND email='"+email+"'");
                          if(rs.next()){
                              if(st.executeUpdate("delete from fav_product where product_code='"+product_code+"' AND email='"+email+"'")>0){
                                   out.print("gray"); 
                              }
                             
                          }
                          else{
                                PreparedStatement ps=cn.prepareStatement("insert into fav_product values(?,?,?)");
                                ps.setString(1,product_code);
                                ps.setString(2,email);
                                ps.setString(3,"red");
                                if(ps.executeUpdate()>0){
                                    out.print("red");
                                }
                          }
                          
                     }
                     catch(Exception e){
                         
                     }
                 }
        
    }
    else{
        
    }
    
    
    
    %>