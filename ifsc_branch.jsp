<%-- 
    Document   : ifsc_branch
    Created on : 8 Apr, 2022, 5:50:55 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   String branch="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("branch").length()==0){
                      
                  }
                  else{
                       
                       branch=request.getParameter("branch"); 
                       String ifsc="";
                       int flag=0;
                       try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from ifsc where branch_name='"+branch+"'");
                            %>
                            <label>IFSC CODE</label>
                            
                            <%
                            if(rs.next()){
                                flag=1;
                                ifsc=rs.getString("ifsc");
                              %>
                              
                              
                              <div class="col-sm-12"   style="background-color:#F5F5F5">
                                  <span id="show_ifsc"><%=ifsc%></span>
                                  
                              </div>
                              <div class="col-sm-4"></div>
                              <div class="col-sm-4">
                                  
                              </div>
                              <div class="col-sm-6">
                                     <input type="button"  rel="<%=ifsc%>" class="close" data-dismiss="modal" style="background-color:darkgrey" id="get" value="Continue">
                                  
                              </div>
                                  

                             
                              
                              
                              <%
                                    
                            }
                            
                            %>
                            
                            
                            <%
                            }
                       
                       catch(Exception e){}  
                       
                      
                      
                      
                  }
       
       
   }
   else{
       
       response.sendRedirect("index.jsp");
   }
    
    
    
    
    
    
    %>