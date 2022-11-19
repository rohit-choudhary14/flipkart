<%-- 
    Document   : bank_details
    Created on : 7 Apr, 2022, 10:28:49 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    String email=null;
    String user_code="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
    }
    
    if(email!=null){
                      if(request.getParameter("code").length()==0){
                          
                      }
                      else{
                              user_code=request.getParameter("code");
    %>
<head>
    <meta charset="utf-8">
    <title>E-Shopp</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="jquery-3.6.0.min.js"></script>
    <style>
 #card{
   box-shadow:15px 15px 15px rgba(0,0, 0, 0.4);
   background-color:white;
  
} 
body {
  
  font-family: Arial, Helvetica, sans-serif;
}
#heart{
    color:white;
}
#account:hover{
    color:blue;
    
}
#address:hover{
    color:blue;
}
#pan:hover{
    color:blue;
}
input{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}  
select{
  width:100%;
  
  height:20%;
} 

        
        
        
        </style>
        <script>
            
            $(document).ready(function(){
                $("#account_number").keyup(function(){
                    var num=[];
                     num=$(this).val();
                     
                     if(num.length>=6){
                         $("#ifsc").html("<input type='text' name='ifsc'placeholder='Enter your IFSC code' id='required_ifsc' required>");
                         $("#card").css("height","500");
                         $("#invalid_info").html("<a  style='color:blue;cursor:pointer'  data-toggle='modal' data-target='#myModal'>I dont know my IFSC code</a>");
                     } 
                    else if(num.length<=5){
                         $("#ifsc").html("");
                         $("#card").css("height","300");
                     }
                     for(var i=0;i<num.length;i++){
                         
                            if(num[i]>='a' && num[i]<='z'){ 
                                $("#info").html("<span style='color:red'>Please enter a valid bank account</span>");
                            }
                            else if(num[i]>='A' && num[i]<='Z'){ 
                                $("#info").html("<span style='color:red'>Please enter a valid bank account</span>");

                            } 
                            else{

                                 $("#info").html("");
                            }
                     }
                    
                });
               
               $("#form_group").on("click",function(){
                   
                $("#bank").on("click",function(){
                   
                   var bank= $(this).val();
                   $.post(
                      "ifsc.jsp",{bank:bank},function(data){
                        
                       $("#prestate").html(data);
                      }
                      );
                  
                    
                    
                    
                });
               });
                $("#prestate").on("click",function(){
                   
                $("#choose_state").on("click",function(){
                   
                   var state= $(this).val();
                   $.post(
                      "ifsc_state.jsp",{state:state},function(data){
                        
                       $("#predist").html(data);
                      }
                      );
                  
                    
                    
                    
                });
               });
               $("#predist").on("click",function(){
                   
                $("#choose_branch").on("click",function(){
                   
                   var city= $(this).val();
                   $.post(
                      "ifsc_city.jsp",{city:city},function(data){
                        
                       $("#prebranch").html(data);
                      }
                      );
                  
                    
                    
                    
                });
               });
               $("#prebranch").on("click",function(){
                   
                $("#branch").on("click",function(){
                   
                   var branch= $(this).val();
                   $.post(
                      "ifsc_branch.jsp",{branch:branch},function(data){
                        
                       $("#get_ifsc").html(data);
                       $("#get").on("click",function(){
                           var ifsc_put=$(this).attr("rel");
                           $("#required_ifsc").val(ifsc_put);
                       });
                      
                      });
                  
                    
                    
                    
                });
               });
               
               
            });
            
            
            </script>
           
</head>

<body >
    <!-- Topbar Start -->
    <div class="container-fluid" style="background-color:#3392F3;" >
        
        <div class="row"  >
           
           
              <%            String seller_email=" ";
                                             try{
                                                                        
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                         ResultSet rs=st.executeQuery("select *  from dealer where seller_email='"+email+"' ");  
                                                                          if(rs.next()){
                                                                              
                                                                              
                                                                             seller_email=rs.getString("seller_email");
                                                                           
                                                                            
                                                                              
                                                            
                                                                     %>
            <div class="col-sm-1" id="Upper_profile" style="padding:8px">
                <img src="category_photos/download (1).jpg" style="height:35px"  class="rounded-circle">
                <div class="row">
                    <div class="col-sm-12">
                         <span style="color:white">Seller hub</span>
                    </div>
                </div>
               
               
                  <%
                                                                          }
                                             }
                                             catch(Exception e){} 




%>  
            </div>    
                   
                   
            <div class="col-sm-9" >
                 
            </div>
            
            <div class="col-sm-2" style="padding:8px;">
                <div class="nav-item dropdown" style="color:white;cursor:pointer">
                             
                    <i class="fa fa-user-circle-o" style="font-size:25px;padding:5px"></i>
                    
                   
                            <span data-toggle="dropdown" style="font-size:15px"><%=seller_email%></span> 
                                
                            <div class="dropdown-menu position-absolute">
                                
                                <a href="seller_logout.jsp" class="dropdown-item"><i class="fa fa-sign-out">Logout</i></a>
                            </div>
                    
                
               
            </div>
            </div>
             </div>
    </div>
             <div id="business">
            <div class="container-fluid" style="background-color:#7C0A02;height:610px">
                <div class="row">
                    
            
            <div class="col-sm-12" >
                <div class="row" style="margin-top:2%">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5"  id="card" style="height:300px">
                         <div class="row"style="margin-top:5%">
                            <div class="col-sm-12"></div>
                            
                        </div>
                        <center><span ><h4><b>Give your Bank Details</b></h4></span></center>
                        
                        <div class="row">
                            <div class="col-sm-2"></div>
                             
                            <div class="col-sm-8"> 
                               <form method="post" action="bank_recored.jsp">
                                     <input type="text"  name="account" class="form-controle" placeholder="Enter Account Holder Name" required>
                                 <div class="row" style="margin-top:2%">
                                    <div class="col-sm-12">
                                           <input type="tel" pattern="[0-9]{14}"  name="account_number"id="account_number" placeholder="Enter bank account number" required>  
                                           <div class="row">
                                               <div class="col-sm-12">
                                                   <span id="info">
                                                       
                                                   </span>
                                               </div>
                                           </div>
                                           <div class="row">
                                               <div class="col-sm-12">
                                                   <span id="ifsc">
                                                       
                                                   </span>
                                               </div>
                                           </div>
                                           <div class="row">
                                               <div class="col-sm-12">
                                                   <span id="invalid_info">
                                                       
                                                   </span>
                                               </div>
                                           </div>
                                    </div>
                                </div>
                                     
                               
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                            
                        </div>
                        
                        
                         <div class="row" style="margin-top:2%">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">  
                                <!--<input type="button" value="Sign UP" style="background-color:blueviolet">-->
                                <button class="btn btn-block btn-success" id="CONTINUE" >CONTINUE</button>
                                </form>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                        </div>
                            
                                
                    </div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-4" style="background-color:#7C0A02;color:white">
                        <div class="row">
                            <div class="col-sm-12">
                              <h5 style="color:white">Get a share of thousands of crores of rupees paid out every week!</h5>
                            </div>
                          
                           
                           
                            
                             
                            
                              
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  <span>How will this information be used?
Your Bank account details will be used to make payments to you. </div>
                               <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                             
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  How will this information be used?
Your pick up Address helps us identify which Logistics partner can pick up your products.
                              </div>
                             <div class="col-sm-12">
                                  What should I do if I don’t have a bank account in my registered business name?
We can only transfer payments to accounts which are in the registered business name. Please open a new bank account with any bank in your registered business name.
                              </div>
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12" style="height:2px;background-color:white">
                                  
                              </div>
                              
                        </div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
                    </div>
                </div>
             </div>
 
   
    <!-- Subscribe Start -->
   
    <!-- Subscribe End -->

 <div class="modal" id="myModal">
                                              <div class="modal-dialog">
                                                <div class="modal-content">

                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                    <h4 class="modal-title">Find IFSC code</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  </div>

                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                              
                                                           <div class="login-form">
                                                                       
                                                                            <div class="form-group" id="form_group">
                                                                                <label><b>Choose Bank</b></label>
                                                                                <select name="bank" id="bank">
                                                                                 
                                                                                   <option>ALLAHABAD BANK</option>
                                                                                    <option>ANDHRA BANK</option>
                                                                                    <option>ALLAHABAD BANK</option>
                                                                                    <option>AXIS BANK</option>
                                                                                    <option>BANK OF BARODA </option>
                                                                                    <option>BANK OF INDIA </option>
                                                                                    <option>BANK OF MAHARASHTRA</option>
                                                                                    <option>CANARA BANK</option>
                                                                                    <option>CORPORATION BANK</option>
                                                                                    
                                                                                   
                                                                                    
                                                                                </select>   
                                                                            </div>
                                                               <div class="form-group" id="prestate">
                                                                               
                                                                                   
                                                                            </div>
                                                               <div class="form-group" id="predist">
                                                                               
                                                                                   
                                                                            </div>
                                                               <div class="form-group" id="prebranch">
                                                                               
                                                                                  
                                                                            </div>
                                                                <div class="form-group" id="get_ifsc">
                                                                               
                                                                                  
                                                                  </div>
                                                                  
                                                                           
                                                                                   
                                                                       
                                                                       
                                                                    </div>
							
						 </div>
						
						
                                                       
						 </div>
                                              </div>
 </div>
						 
                                                 

                                                 
                                                
    <!-- Vendor End -->


    <!-- Footer Start -->
 
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
<%
                     
                      }
    }
    else{  
        
        
        response.sendRedirect("index.jsp"); 
    }
                                             
                                             
                                             
                                             
                                             %>
</html>
