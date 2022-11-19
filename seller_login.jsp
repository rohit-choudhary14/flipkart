<%-- 
    Document   : seller_login
    Created on : 11 Apr, 2022, 12:19:32 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    String email=" ";
    String password=" ";
   
    if(request.getParameter("email").length()==0 || request.getParameter("password").length()==0){
        
        response.sendRedirect("seller_register.jsp?All field required");
        
    }
    else{
        
         email=request.getParameter("email");
         password=request.getParameter("password");
        
          try{ 
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                Statement st=cn.createStatement(); 
                ResultSet rs=st.executeQuery("select * from dealer where seller_email='"+email+"' AND password='"+password+"'");
                if(rs.next()){  
                    if(rs.getString("seller_email").equals(email)){
                        if(rs.getString("password").equals(password)){
                            Cookie c=new Cookie("seller",email);
                            c.setMaxAge(36000);
                            response.addCookie(c);
                            response.sendRedirect("sellerOnboarding.jsp");
                           
                        }
                        else{
                            
                             response.sendRedirect("seller_register.jsp?invalid_password");
                        }
                      
                    }
                    else{
                        
                       
                         response.sendRedirect("seller_register.jsp?invalid_email");
                    }
                }
                else{
                     response.sendRedirect("seller_register.jsp?email_does't_exit");
                    
                }
              
              
              
          }
          catch(Exception e){
              out.print(e.getMessage()); 
          }
        
        
        
        
    }
    
    
    
    
    %>