<%-- 
    Document   : set_price
    Created on : 27 Apr, 2022, 3:36:15 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*" pageEncoding="UTF-8"%>

<%
    String email=null;
    String pid="";
    String size="";
    String price="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
            
        }
    }
    if(email!=null){
                    if(request.getParameter("pid").length()==0|| request.getParameter("size").length()==0){
                        
                    }
                    else{
                        size=request.getParameter("size");
                        pid=request.getParameter("pid");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root",""); 
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from product_list where size='"+size+"' AND product_code='"+pid+"' ");
                            if(rs.next()){
                                price=rs.getString("price");
                                out.print(price);
                            }
                            else{
                                
                            }
                            
                            
                        }
                        catch(Exception e){
                            
                        }
                        
                    }
        
        
    }
    else{
        
    }
    
    
    
    %>
