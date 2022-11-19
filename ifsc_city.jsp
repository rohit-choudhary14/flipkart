<%-- 
    Document   : ifsc_city
    Created on : 8 Apr, 2022, 5:45:25 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   String city="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("city").length()==0){
                      
                  }
                  else{
                       
                       city=request.getParameter("city"); 
                       String branch="";
                       int flag=0;
                       try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from ifsc where city='"+city+"'");
                            %>
                            <label><b>Choose branch</b></label>
                            <select  id="branch">
                            
                            <%
                            while(rs.next()){
                                flag=1;
                                branch=rs.getString("branch_name");
                              %>
                              
                              
                                <option><%=branch%></option>
                                

                             
                              
                              
                              <%
                                    
                            }
                            
                            %>
                             </select> 
                            
                            <%
                            }
                       
                       catch(Exception e){}  
                       
                      
                      
                      
                  }
       
       
   }
   else{
       
       response.sendRedirect("index.jsp");
   }
    
    
    
    
    
    
    %>