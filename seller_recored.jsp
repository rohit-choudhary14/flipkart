<%-- 
    Document   : seller_recored
    Created on : 5 Apr, 2022, 11:41:17 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    
    String email=null;
    String phone="";
    String seller_email="";
    String password="";
    String user_name="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user"))
            email=c[i].getValue(); 
    }
    if(email!=null){
                     if(request.getParameter("phone").length()==0 || request.getParameter("password").length()==0 || request.getParameter("email").length()==0 || request.getParameter("user").length()==0){
                        response.sendRedirect("seller_register_process.jsp?Empty_Field");
                     }
                     else{
                                int sn=0; 
                                String user_code="";
                                int status=0;
                                phone=request.getParameter("phone");
                                seller_email=request.getParameter("email");
                                password=request.getParameter("password");
                                user_name=request.getParameter("user");
                                 try{
                                         Class.forName("com.mysql.jdbc.Driver");
                                 
                                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                        Statement st=cn.createStatement();
                                        ResultSet rs=st.executeQuery("select MAX(sn) from dealer");
                                        if(rs.next()){
                                            sn=rs.getInt(1);
                                        }
                                        sn++;
                                        LinkedList l=new LinkedList();
                                        for(int i=0;i<=9;i++){
                                            l.add(i);
                                        }
                                        for(char i='A';i<='Z';i++){
                                            l.add(i+"");
                                        }
                                        for(char i='a';i<'z';i++){
                                            l.add(i+"");
                                        }
                                        Collections.shuffle(l);
                                        for(int i=0;i<=6;i++){
                                            user_code=user_code+l.get(i); 
                                        }
                                      
                                           PreparedStatement ps=cn.prepareStatement("insert into dealer values(?,?,?,?,?,?,?,?)");
                                              
                                           ps.setInt(1,sn);
                                           ps.setString(2,user_code);
                                           ps.setString(3,phone);
                                           ps.setString(4,seller_email);
                                           ps.setString(5,password);
                                           ps.setString(6,user_name);
                                           ps.setString(7,email);
                                           ps.setInt(8,status);
                                            if(ps.executeUpdate()>0){

                                                response.sendRedirect("seller_info.jsp?code="+user_code);
                                            }
                                        
                                 }
                                 catch(Exception e){
                                 
                                 } 
                                   
                                }
                       
                     }
        
    
    else{
        response.sendRedirect("index.jsp");
    }
    
    
    
    %>