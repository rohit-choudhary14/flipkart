<%-- 
    Document   : prduct_info_form
    Created on : 14 Apr, 2022, 3:45:58 AM
    Author     : rohit
--%>
<%
    String pc="";
    
    
    
    %>
<style>
  
.login-form {
    width:100%;
    margin: auto;
  	font-size: 15px;
}
.login-form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}
.btn {        
    font-size: 15px;
    font-weight: bold;
}
button.input-group-addon {
  position: absolute;
  right: -38px;
  top: 0;
  padding: 2px;
  z-index: 999;
  height: 38px;
  width: 38px;
}
#size{
    display:none;
}
#price{
    display:none;
}
</style>
<script>
    $(document).ready(function(){ 
       $("#submit").on("click",function(){
           var seller_code=$(this).attr("rel");
           var product_title=$("#product_title").val();
           var product_category=$("#product_category").val();
           var product_sub_category=$("#product_sub_category").val();
           var product_description=$("#product_description").val();
          
          $.post(
               "add_product_info.jsp",{product_description:product_description,product_title:product_title,product_category:product_category,product_sub_category:product_sub_category,seller_code:seller_code},function(data){
                 
                  var product_code=data.substring(data.indexOf("/")+1);
                  var info=data.substring(0,data.indexOf("/"));
                  
                  if(info.trim()==="success"){
                      $("#next_form").load("product_info_form_1.jsp");
                      
                  }
                   $("#code").attr("rel",product_code);
                   var pc_code=$("#code").attr("rel");
                  
                     
            
            });
           
          
       });
       $("#show_size_box").on("click",function(){
           $("#size").show();
           
       });
       $("#show_price").on("click",function(){
           $("#price").show();
           
       });
        
    });
    
    </script>
<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%   
    String seller_code="";
     String cat_name="";
     String sub_name="";
    String cat_code="";
    String sub_code=""; 
    String email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("seller")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                  if(request.getParameter("sub_code").length()==0 || request.getParameter("cat_code").length()==0){
                      
                  }
                  else{
                     
                      sub_code=request.getParameter("sub_code");
                      cat_code=request.getParameter("cat_code");
                       
                      try{
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root",""); 
                           Statement st=cn.createStatement();
                           ResultSet rs=st.executeQuery("select * from category where cat_code='"+cat_code+"'");
                           if(rs.next()){
                               cat_name=rs.getString("cat_name");
                           }
                           ResultSet rs1=st.executeQuery("select * from sub_category where cat_code='"+cat_code+"' AND sub_code='"+sub_code+"'");
                           if(rs1.next()){
                               sub_name=rs1.getString("sub_name");
                           }
                          
                            ResultSet rs2=st.executeQuery("select * from dealer where seller_email='"+email+"'");
                           if(rs2.next()){
                               seller_code=rs2.getString("user_code");
                           }
                          
                          
                      }
                      catch(Exception e){
                          
                          
                      }
                  }
        
        
        
        
    }
    
    
    
    
    
    %>

    <div class="container-fluid">
        <div class="row" >
            <div class="col-sm-12">
                <i  id="code" rel=""><span></span></i>
            </div>
            <div class="col-sm-12" id="next_form" >
                
           
                               <div class="login-form" >
                                                                        
                                                                             
                                                                            <div class="form-group">
                                                                                <label>Product Title:</label>
                                                                                <input type="text"  name="title" id="product_title" class="form-control" placeholder="Enter Title..."required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Product Category:</label>
                                                                                <input type="text"  name="category" id="product_category"class="form-control"  value="<%=cat_name%>" readonly required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Product Sub Category:</label>
                                                                                <input type="text"  name="subcategory" id="product_sub_category"class="form-control" value="<%=sub_name%>" readonly required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Product Description:</label>
                                                                                <textarea cols="50"rows="5"  style="resize:none"class="form-control" id="product_description"></textarea>
                                                                            
                                                                            </div>
                                                                             
                                                                            <div class="form-group">
                                                                                <input  type="button" class="btn btn-primary btn-block" id="submit"  value="Next"  rel="<%=seller_code%>"style="background-color:#3392F3;border-color:#3392F3">
                                                                            </div>
                                                                            <div class="clearfix">
                                                                                
                                                                            </div>        
                                                                        
                                                                        
                                                                    </div>
                                                                              </div>
        </div>
    </div>
							