<%-- 
    Document   : get_subcategory
    Created on : 14 Apr, 2022, 2:04:54 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<script>
    $(document).ready(function(){
        $("#cat_show_on_load").hide();
       $(".wave").on("click",function(){
          var id=$(this).attr("id");
          var sub_code=$(this).attr("rel");
          var cat_code=$(this).attr("rel1");
          
          var n=id;
          $("#sub-"+id).css("background-color","#F1F2F4");
          $.post(
              
            "prduct_info_form.jsp",{sub_code:sub_code,cat_code:cat_code},function(data){
               $("#show_form").html(data.trim());
            
            
            
            });
        $(".wave-same").on("click",function(){
            $("#sub-"+n).css("background-color","white");
            
            
        });
       });
       
       });
    
</script>
<%
    
    String cat_code="";
    String email="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("seller")){
            email=c[i].getValue();
        
        }
        
    }
    if(email!=null){
        
                  if(request.getParameter("cat_code").length()==0){
                      
                  }
                  else{
                      
                        cat_code=request.getParameter("cat_code");
                        try{
                              String sub_name="";
                              String sub_code="";
                              int status=1;
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                              Statement st=cn.createStatement();
                              ResultSet rs=st.executeQuery("select * from sub_category where cat_code='"+cat_code+"'");
                              %>
                              
                               <h5>Select Sub Category</h5>
                               <div class="row">
                                   <div class="col-sm-4" style="overflow:scroll;height:600px">
                                       
                                  
                              <%
                              int sr=1;
                              while(rs.next()){
                                  sub_name=rs.getString("sub_name");
                                  sub_code=rs.getString("sub_code");
                                  %>
                                  
                                  <div class="row">  
                                      
                                  <div class="col-sm-12 card" id="sub-<%=sr%>" style="height:67px;cursor:pointer;">
                                      <span class="wave" id="<%=sr%>" rel="<%=sub_code%>" rel1="<%=cat_code%>" ><h6 class="wave-same"><%=sub_name%></h6></span> 
                                  </div>
                                 
                                  </div>
                                  
                                  
                                  
                          <%  
                                  sr++;  
                              }
                              %>
                              
                          </div>
                              <div class="col-sm-8"  id="show_form">
                                  <span>Select the sub-category you wish to sell.</span>
                              </div>
                               </div>     
                              <%
                            
                            
                        }
                        catch(Exception e){
                            
                            
                        }
                      
                  }
        
        
        
    }
    
    
    
    
    
    %>

