<%-- 
    Document   : add_product_info
    Created on : 15 Apr, 2022, 11:19:57 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    String product_title="";
    String product_category="";
    String product_sub_category="";
    String product_description="";
    String seller_code=""; 
    String seller_email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        
        if(c[i].getName().equals("seller")){
            seller_email=c[i].getValue();
        }
    }
    if(seller_email!=null){
             if(request.getParameter("product_description").length()==0||request.getParameter("seller_code").length()==0||request.getParameter("product_title").length()==0|| request.getParameter("product_category").length()==0||request.getParameter("product_sub_category").length()==0){
                 
             }
             else{
                   product_title=request.getParameter("product_title");
                   product_category=request.getParameter("product_category");
                   product_sub_category=request.getParameter("product_sub_category");
                   seller_code=request.getParameter("seller_code");
                   product_description=request.getParameter("product_description");
                   int status=0;
                   int sn=0;
                   String product_code="";
                   LinkedList l=new LinkedList();  
                    for(int i=0;i<=9;i++){
                                 l.add(new Integer(i));
                           }
                    for(char i='A';i<='Z';i++){
                                l.add(i+"");
                    }
                    for(char i='a';i<='z';i++){
                                l.add(i+"");
                    }
                    Collections.shuffle(l);
                    for(int i=0;i<7;i++){
                          product_code=product_code+l.get(i);
                    }
                   
                   
                   try{
                         Class.forName("com.mysql.jdbc.Driver");
                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                         Statement st=cn.createStatement();
                         ResultSet rs=st.executeQuery("select MAX(sn) from product");
                         if(rs.next()){
                             sn=rs.getInt(1); 
                         }
                         sn++;
                         java.util.Date date=new java.util.Date();
                         java.sql.Date sqlDate=new java.sql.Date(date.getTime()); 
                         String dat=sqlDate+"";          
                         PreparedStatement ps=cn.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?)");
                         ps.setInt(1,sn);
                         ps.setString(2,product_code);
                         ps.setString(3,seller_code);
                         ps.setString(4,dat);
                         ps.setInt(5,status);
                         ps.setString(6,product_title);
                         ps.setString(7,product_description); 
                         ps.setString(8,product_category);
                         ps.setString(9,product_sub_category);
                         if(ps.executeUpdate()>0){
                             out.print("success/"+product_code);
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