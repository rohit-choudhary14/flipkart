<%-- 
    Document   : user_register
    Created on : 3 Apr, 2022, 12:29:10 AM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("user").length()==0 || request.getParameter("email").length()==0 || request.getParameter("pass").length()==0|| request.getParameter("cpass").length()==0){
           response.sendRedirect("index.jsp?empty=1");
    }
    else{
             String name=request.getParameter("user");
             String email=request.getParameter("email");
             String pass=request.getParameter("pass");
             String cp=request.getParameter("cpass");
             if(!pass.equals(cp)){
                 response.sendRedirect("index.jsp?password and confirm Password does't match");
             }
            
             else{
                           int sn=0;
                           LinkedList l = new LinkedList();
                           String code=" ";
                           for(int i=0;i<=9;i++){
                                 l.add(new Integer(i));
                           }
                           for(char c='A';c<='Z';c++){
                                l.add(c+"");
                           }
                           for(char c='a';c<='z';c++){
                                l.add(c+"");
                           }
                           Collections.shuffle(l);
                           for(int i=0;i<7;i++){
                                 code=code+l.get(i);
                           }
                           try{
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                 Statement st=cn.createStatement();
                                 ResultSet rs=st.executeQuery("select MAX(sn) from user");
                                 if(rs.next()){
                                     sn=rs.getInt(1);
                                 }
                                 sn++;
                                 code=sn+"_"+code;
                                 PreparedStatement ps=cn.prepareStatement("insert into user values(?,?,?,?,?,?)");
                                 ps.setInt(1,sn);
                                 ps.setString(2,code);
                                 ps.setString(3,name);
                                 ps.setString(4,email);
                                 ps.setString(5,pass);
                                 ps.setString(6,cp);
                                 
                                 if(ps.executeUpdate()>0){
                                     response.sendRedirect("index.jsp?register_Successfully");
                                     
                                 }
                                 else{
                                      response.sendRedirect("index.jsp?Try_Again=1");
                                 }
                           }
                          catch(Exception e){
                                
                                out.println(e.getMessage());
                          }
             }

    }
    

    
    
    
    
    %>