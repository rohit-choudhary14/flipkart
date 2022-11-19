<%-- 
    Document   : ifsc
    Created on : 8 Apr, 2022, 1:26:11 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String email=null;
   String bank="";
   
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user"))
           email=c[i].getValue(); 
   }
   if(email!=null){
       
                  if(request.getParameter("bank").length()==0){
                      
                  }
                  else{
                       
                       bank=request.getParameter("bank"); 
                       String state="";
                       int flag=0;
                       try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from ifsc where bank_name='"+bank+"'");
                            %>
                            <label><b>Choose State</b></label>
                            <select name="state" id="choose_state">
                            
                            <%
                            while(rs.next()){
                                flag=1;
                                state=rs.getString("state");
                              %>
                              
                              
                                <option><%=state%></option>
                                

                             
                              
                              
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