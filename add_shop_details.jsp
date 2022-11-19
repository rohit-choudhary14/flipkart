<%-- 
    Document   : add_shop_details
    Created on : 13 Apr, 2022, 1:37:05 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email="";
    String shop_name="";
    String shop_des="";
    String seller_code="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        
        if(c[i].getName().equals("seller")){
            email=c[i].getValue(); 
        }
        
        
    }
    if(email!=null){
                      if(request.getParameter("shop_name").length()==0 || request.getParameter("shop_des").length()==0|| request.getParameter("seller_code").length()==0){
                      }
                      else{
                            shop_name=request.getParameter("shop_name"); 
                            shop_des=request.getParameter("shop_des"); 
                            seller_code=request.getParameter("seller_code"); 
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root",""); 
                                Statement st=cn.createStatement();
                                Statement st1=cn.createStatement();
                                ResultSet rs=st.executeQuery("select * from shop_details where user_code='"+seller_code+"'");
                                if(rs.next()){
                                    
                                       if(st.executeUpdate("update shop_details set shop_name='"+shop_name+"' , shop_des='"+shop_des+"' where user_code='"+seller_code+"' ")>0){
                                           out.print("updated");
                                       }
                                }
                                else{
                                    
                                    PreparedStatement ps=cn.prepareStatement("insert into shop_details values(?,?,?)"); 
                                    ps.setString(1,shop_name);
                                    ps.setString(2,shop_des);
                                    ps.setString(3,seller_code);
                                    if(ps.executeUpdate()>0){
                                      out.print("inserted");
                                    }
                                }
                                
                            }
                            catch(Exception e){
                             out.print(e.getMessage());
                            }
                          
                          
                      }
        
    }
    else{
        
        
    }
    
    
    
    
    %>