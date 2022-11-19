<%-- 
    Document   : add_question
    Created on : 6 May, 2022, 12:53:41 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   String product_code="";
   String question="";
   String email="";
  
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user")){
           email=c[i].getValue();
       }
       
       
   }
   if(email!=null){
       if(request.getParameter("product_code").length()==0|| request.getParameter("question").length()==0){
           
       }
       else{
             product_code=request.getParameter("product_code");
             question=request.getParameter("question");
             try{
                  int sn=0;
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                  Statement st=cn.createStatement();
                  ResultSet rs=st.executeQuery("select MAX(sn) from QNA");
                  if(rs.next()){
                      sn=rs.getInt(1);
                  }
                  sn++; 
                  ResultSet rs1=st.executeQuery("select question from QNA where product_code='"+product_code+"' AND question='"+question+"'");
                  if(rs1.next()){
                      out.print("try again");
                  }
                  else{
                    PreparedStatement ps=cn.prepareStatement("insert into QNA values(?,?,?,?)");
                    ps.setInt(1,sn);
                    ps.setString(2,product_code);
                    ps.setString(3,question);
                    ps.setString(4,email);
                    if(ps.executeUpdate()>0){
                        out.print("success");
                    }
              }
                  
                  
             }
             catch(Exception e){
                 
             }
       }
       
       
   }
   else{
       
   }
    
    
    
    
    %>
