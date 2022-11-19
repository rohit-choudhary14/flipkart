<%-- 
    Document   : seller_info
    Created on : 5 Apr, 2022, 11:10:29 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
body {
  
  font-family: Arial, Helvetica, sans-serif;
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
        
        
        
        </style>
        <script>
           $(document).ready(function(){
             $("#pincode").keyup(function(){
                 var data=$(this).val();
                 
                 if(data.length<6){
                     $("#info").html("<span style='color:red'>Please enter a valid PIN code</span>");
                     $("#CONTINUE").css("cursor","not-allowed");
                     
                    
                 }
               
                 else if(data.length>6){
                     $("#info").html("<span style='color:red'>Please enter a valid PIN code</span>");
                     $("#CONTINUE").css("cursor","not-allowed");
                 }
                 else if(data.length==6){
                     $("#info").html("");
                      $("#CONTINUE").css("cursor","context-menu");
                     
                 }
                 
             });
              $("#pincode").keydown(function(){
                 var data=$(this).val();
                 
                 if(data.length<7){
                    $("#email").html("");
                    $("#card").css("height","300");
                    $("#verify").show();
                    $("#pin").html("");
                    
                    $("#dist").html("");
                   
                    $("#state").html("");
                    
                     
                    
                 }
                 
             });
             $("#verify").on("click",function(){
               var pincode=$("#pincode").val();
               if(pincode.length===6){
               $.post(
                    "pincode_verification.jsp",{pincode:pincode},function(data1){
                     var data=data1.trim();
                   
                      if(data.length>3){
                            var state=data.substring(0,data.indexOf("/")); 
                            
                            var dist=data.substring(data.indexOf("/")+1);
                            
                            $("#address").html("<input type='text' id='pickup' required placeholder='Enter Your Pickup Address' >");
                            $("#card").css("height","500");
                            $("#verify").hide();
                            $("#pin").html("<input type='text' id='pinadd'>");
                            $("#pinadd").val(pincode);
                            $("#dist").html("<input type='text' id='distadd'>");
                            $("#distadd").val(dist);
                            $("#state").html("<input type='text' id='stateadd'>");
                            $("#stateadd").val(state);
                             
                                
                         }
                         else{
                         
                               $("#info").html("<span style='color:red'>Please enter a valid PIN code</span>");
                     
                         
                         }
                         
                    
              });
               }
             
             
             });
             $("#CONTINUE").on("click",function(){
                                var user_code=$(this).attr("rel");
                                
                                var pincode=$("#pincode").val();
                               
                                var dist=$('#distadd').val();
                                
                                var state=$('#stateadd').val();
                                
                                var pickupaddress=$('#pickup').val();
                                
                               
                                if(pickupaddress.length<=0){
                                     
                                     $("#invalid").html("<span style='color:red'>This field cant'b be empty</span>");
                                    
                                }
                                else{
                                     $("#invalid").html("");
                                     $.post(
                                             "business_details.jsp",{user_code:user_code,pincode:pincode,dist:dist,state:state,pickupaddress:pickupaddress},function(data){
                                               $("#business").load("business_info.jsp");
                                             }
                                         );
                                    
                                }
                                

                             });
              
           }); 
            
            
            
            
            
            </script>
</head>

<body >
    <!-- Topbar Start -->
    <div class="container-fluid" style="background-color:#3392F3;" >
        
        <div class="row" id="cardrow" >
           
           
              <%            String seller_email="";
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
                        <center><span ><h4><b>Give your pick up address</b></h4></span></center>
                        
                        <div class="row">
                            <div class="col-sm-2"></div>
                            
                            <div class="col-sm-8"> 
                                
                                     <input type="tel" pattern="[0-9]{6}"   id="pincode" name="pincode"class="form-controle" placeholder="Give Your Pickup Pincode">
                                 <div class="row">
                                    <div class="col-sm-12">
                                        <span id="info"></span>   
                                    </div>
                                </div>
                                     <input type="button" value="Verify" id="verify">
                               
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                            
                        </div>
                        <!---After verification part start-->
                        <!--email part-->
                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" > 
                                 <span id="address"></span>
                                 <span id="invalid"></span>
                                   
                               
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                            
                        </div>
                        <!--email end-->
                        <!-- pincode AND dist. part start   -->
                         <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-4" > 
                                <span id="pin"></span>
                                   
                               
                            </div>
                            <div class="col-sm-4" > 
                                  <span id="dist"></span>
                                   
                               
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                            
                        </div>
                        <!-- pincode AND dist. part end   -->
                        <!-- stat part start-->
                        <div class="row">
                            <div class="col-sm-2"></div>
                            
                            <div class="col-sm-8" > 
                                <span id="state"></span>
                                   
                               
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                            
                        </div>
                        <!-- stat part end-->
                       <!---After verification part end-->
                        
                        
                        
                         <div class="row" style="margin-top:2%">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">  
                                <!--<input type="button" value="Sign UP" style="background-color:blueviolet">-->
                                <button class="btn btn-block btn-success" id="CONTINUE"  rel="<%=user_code%>"style="cursor:not-allowed">CONTINUE</button>
                               
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                        </div>
                            
                                
                    </div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-4" style="background-color:#7C0A02;color:white">
                        <div class="row">
                            <div class="col-sm-12">
                              <h5 style="color:white">Tell us from where you will ship your products to buyers all across India!</h5>
                            </div>
                          
                           
                           
                            
                             
                            
                              
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  <span>What are "Large Products"?
Bulky or heavy products like sofas, washing machines, refrigerators etc are called "Large products". Large products can be picked up from a limited set of pincodes.</span>
                              </div>
                               <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                             
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  How will this information be used?
Your pick up Address helps us identify which Logistics partner can pick up your products.
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
