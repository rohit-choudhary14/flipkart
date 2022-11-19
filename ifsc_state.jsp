<%-- 
    Document   : ifsc_state
    Created on : 8 Apr, 2022, 5:35:28 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   String state="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("state").length()==0){
                      
                  }
                  else{
                       
                       state=request.getParameter("state"); 
                       String city="";
                       int flag=0;
                       try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from ifsc where state='"+state+"'");
                            %>
                            <label><b>Choose City</b></label>
                            <select name="city" id="choose_branch">
                            
                            <%
                            while(rs.next()){
                                flag=1;
                                city=rs.getString("city");
                              %>
                              
                              
                                <option><%=city%></option>
                                

                             
                              
                              
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