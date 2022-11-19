<%-- 
    Document   : removefromcart
    Created on : 4 May, 2022, 4:35:55 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String product_code="";
    String product_size="";
    String product_price="";
    String product_img_code="";
    String email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
        
        
    }
    if(email!=null){
                    if(request.getParameter("product_price").length()==0||request.getParameter("product_code").length()==0|| request.getParameter("product_size").length()==0 || request.getParameter("product_img_code").length()==0){
                        
                    }
                    else{
                        product_code=request.getParameter("product_code");
                        product_size=request.getParameter("product_size");
                         product_price=request.getParameter("product_price");
                        product_img_code=request.getParameter("product_img_code");
                        try{
                             Class.forName("com.mysql.jdbc.Driver");
                             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                             Statement st=cn.createStatement(); 
                             if(st.executeUpdate("delete from addtocart where product_code='"+product_code+"' AND photo_code='"+product_img_code+"' AND product_price='"+product_price+"' AND product_size='"+product_size+"' ")>0){
                                 out.print("success");
                             }
                             else{
                                 out.print("something went wrong");
                             }
                        }
                        catch(Exception e){
                            
                        }
                    }
    }
    else{
        
        
    }
    
    
    %>

