<%-- 
    Document   : addtocart
    Created on : 28 Apr, 2022, 12:49:09 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    
    String photo_code="";
    String product_code="";
    String rel_size="";
    String product_price="";
    String address="";
    String email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("user")){
             email=c[i].getValue(); 
         }
        
        
    }
    if(email!=null){
                     if(request.getParameter("pincode").length()==0||request.getParameter("product_price").length()==0||request.getParameter("photo_code").length()==0|| request.getParameter("product_code").length()==0|| request.getParameter("rel_size").length()==0){
    
                      }
                     else{
                           photo_code=request.getParameter("photo_code");
                           product_code=request.getParameter("product_code");
                           rel_size=request.getParameter("rel_size");
                           product_price=request.getParameter("product_price");
                           address=request.getParameter("pincode");
                           try{ 
                               int sn=0;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                Statement st=cn.createStatement();
                                ResultSet rs=st.executeQuery("select MAX(sn) from addtocart");
                                if(rs.next()){
                                    sn=rs.getInt(1);
                                }
                                sn++; 
                                ResultSet rs1=st.executeQuery("select * from addtocart where photo_code='"+photo_code+"' AND product_code='"+product_code+"' AND product_size='"+rel_size+"' AND user_email='"+email+"' AND product_price='"+product_price+"'");
                                if(rs1.next()){
                                    out.print("alredayExist");
                                }
                                else{
                                      PreparedStatement ps=cn.prepareStatement("insert into addtocart values(?,?,?,?,?,?,?)"); 
                                      ps.setInt(1,sn);
                                      ps.setString(2,product_code);
                                      ps.setString(3,rel_size);
                                      ps.setString(4,product_price);
                                      ps.setString(5,email);
                                      ps.setString(6,photo_code);
                                      ps.setString(7,address);
                                      if(ps.executeUpdate()>0){
                                          out.print("success");
                                          
                                      }
                                      else{
                                    
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

