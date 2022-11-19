<%-- 
    Document   : new_listing
    Created on : 14 Apr, 2022, 1:14:47 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<style>
    #cats:hover{
        background-color:#F1F2F4;
    }

</style>
<script>
   $(document).ready(function(){
       $(".nav").on("click",function(){
        var id=$(this).attr("id");
        var n=id;
        $("#cats-"+id).css("background-color","#F1F2F4");
        
        
         var cat_code=$("#catsname-"+id).attr("rel");
         $.post(
             
              "get_subcategory.jsp",{cat_code:cat_code},function(data){
                    
                   $("#show_subcategory").html(data.trim());
              
            
              });
         $(".nav-link").on("click",function(){
       
        $("#cats-"+n).css("background-color","white");
       
           
       });
           
       });
       
       
   }); 
    
    
    
</script>
<div class="container-fluid" style="background-color:#F1F2F4">
    <div class="row">
        <div class="col-sm-12">
            <h6>Add New Listing</h6>
        </div>
        <div class="col-sm-12 card">
            <h5>SELECT VERTICAL</h5>
        </div>
         <div class="col-sm-12 card" >
             <div class="row">
                 <div class="col-sm-2 card"style="overflow-y: scroll;" >
                     <h5>Browse Category</h5>
                     <div class="row">
                          <%
                                             try{
                                                                        int status=1;
                                                                        int sr=1;
                                                                        String album_code=" "; 
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                          Statement st1=cn.createStatement(); 
                                                                         ResultSet rs=st.executeQuery("select *  from category where status="+status+"");  
                                                                          while(rs.next()){
                                                                              
                                                                              
                                                                             String cat_name=rs.getString("cat_name");
                                                                             String cat_code=rs.getString("cat_code");
                                                                            
                                                                              
                                                            
                                                                     %>
                                                                    
                         <div class="col-sm-12 card" style="cursor:pointer;" id="cats-<%=sr%>">
                             <div class="nav" id="<%=sr%>" >
                                 <div class="nav-link">
                             <div class="row">
                                 <div class="col-sm-4" >
                                     <img src="category_photos/<%=sr%>.webp" style="height:50px;" class="img-responsive"> 
                                 </div>
                                 <div class="col-sm-8">
                                     <center><span id="catsname-<%=sr%>" rel="<%=cat_code%>"><%=cat_name%></span></center>
                                 </div>
                                 
                             </div>
                             </div>
                             </div>
                            
                              
                         </div>
                                                                     
                                                                     
                                                                     
                                                                     <%
                                                                       sr++;      
                                                                          }
                                             }
                                             catch(Exception e){}
                                                                             
                                                                             
                                                                             %>
                     </div>
                 </div>
                 <div class="col-sm-10 card">
                     <center><h6 id="cat_show_on_load">Select Category You Wish To Sell</h6></center>
                     <div class="row">
                         
                         <div class="col-sm-12"  id="show_subcategory">
                             
                             
                         </div>
                        
                        
                     </div>
                    
                 </div>
             </div>
            
        </div>
    </div>
</div>