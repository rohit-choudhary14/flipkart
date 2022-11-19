<%-- 
    Document   : product_size_info
    Created on : 17 Apr, 2022, 5:14:22 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String product_size="";
    String product_color="";
    String product_code="";
    int product_price=0;  
    String product_currency="";
    String email="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("seller")){
            email=c[i].getValue();
        }
        
    }
    if(email!=null){
                     if(request.getParameter("product_currency").length()==0||request.getParameter("product_size").length()==0||request.getParameter("product_color").length()==0||request.getParameter("product_price").length()==0||request.getParameter("product_code").length()==0){
                         
                     }
                     else{
                         int status=0;
                         int sn=0;
                         product_size=request.getParameter("product_size");
                         product_color=request.getParameter("product_color");
                         product_price=Integer.parseInt(request.getParameter("product_price"));
                         product_code=request.getParameter("product_code");
                         product_currency=request.getParameter("product_currency");
                         try{
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                              Statement st=cn.createStatement();
                              ResultSet rs=st.executeQuery("select MAX(sn) from product_list");
                              if(rs.next()){
                                  sn=rs.getInt(1); 
                              }
                              sn++; 
                              ResultSet rs1=st.executeQuery("select *from product_list where product_code='"+product_code+"' AND size='"+product_size+"'AND color='"+product_color+"'AND price='"+product_color+"'");
                              if(rs1.next()){
                                out.print("success1");
                              }
                              else{
                                        PreparedStatement ps=cn.prepareStatement("insert into product_list values(?,?,?,?,?,?,?)");
                                        ps.setInt(1,sn);
                                        ps.setString(2,product_code);
                                        ps.setString(3,product_size);
                                        ps.setString(4,product_color);
                                        ps.setInt(5,product_price);
                                        ps.setString(6,product_currency);
                                        ps.setInt(7,status);

                                        if(ps.executeUpdate()>0){
                                            out.print("success");
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
