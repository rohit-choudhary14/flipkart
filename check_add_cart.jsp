<%-- 
    Document   : check_add_cart
    Created on : 16 May, 2022, 4:47:08 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%

String email=null;
String product_code="";
String product_size="";
String photo_code=""; 
Cookie c[]=request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("user")){
         email=c[i].getValue();
    }
       
       
}
if(email!=null){
                if(request.getParameter("pid").length()==0|| request.getParameter("size").length()==0||request.getParameter("photo_code").length()==0){
                    
                }
                else{
                      product_code=request.getParameter("pid");
                      product_size=request.getParameter("size");
                      photo_code=request.getParameter("photo_code");
                      try{
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                           Statement st=cn.createStatement();
                           ResultSet rs=st.executeQuery("select * from addtocart where product_code='"+product_code+"' AND product_size='"+product_size+"' AND photo_code='"+photo_code+"' ");
                           if(rs.next()){
                               out.print("success");
                           }
                           else{
                               out.print("try");
                           }
                           
                      }
                      catch(Exception e){
                          out.print(e.getMessage());
                          
                      }
                }
}
else{
    out.print("email");
    
}







%>
        
        
        
        
        
        
