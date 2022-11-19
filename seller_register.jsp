<%-- 
    Document   : seller_register
    Created on : 4 Apr, 2022, 5:32:38 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    String email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
    }
    
    if(email!=null){
     
                           
                          
    
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
 
  
   box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);
   
    
   
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
  width:40%;
  padding: 5px 20px;
  margin: 5px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
#register{
  width:30%;
  padding: 6px 20px;
  margin: 5px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
select{
    width:10%;
  padding:6px 0px;
 
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
#user_login{
    
     width:35%;
  padding: 5px 20px;
  margin: 5px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
    
}
#login_button{
    width:80%;
 box-shadow:2px 2px 10px rgba(0,0, 0, 0.4);
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
} 
#form{
     background-image: url("category_photos/Welcome_FKK2.png");
     height:300px;
     width:1347px;
    
}

        
        
        </style>
        <script>
           $(document).ready(function(){
               
              $("#next").on("click",function(){
                var email=$("#phone").val();
                
                if(email.length<=1){
                    $("#msg").html("<span style='color:red'>Something went wrong. Please try again</span>");
                }
                else{
                    $("#msg").html("");
                    $("#button").html("<input type='button'  value='Next' style='background-color:#3392F3;width:40%' id='user_login'>");
                    
                    $("#user_login").on("click",function(){
                        var seller_email=$("#phone").val();
                        
                       $.post(
                          "check_request_admin.jsp",{seller_email:seller_email},function(data){
                            if(data.trim()==="0"){
                                
                                 $("#information").html("<span style='color:red'>Your seller account has't been activated yet.you will be notified when account is activated</span>");
                            }
                            else if(data.trim()==="2"){
                               
                                 $("#information").html("");
                                 $("#information").html("<span style='color:red'>Please Enter A Valid Email</span>");
                            }
                            else if(data.trim()==="1"){
                                $("#user_password").html("<label>Password</label><input type='password'  name='password'placeholder='Enter Password' id='pass_user'  class='form-control'>");
                                $("#button").html("<button  style='background-color:#3392F3;border-color:#3392F3;' id='user_login' >Login</button>");
                    
                            }
                          });
                        
                    });
                    
                     
               }   
                
              
              }); 
              $("#number").keyup(function(){
                  var number=$(this).val(); 
                  
                  if(number.length==10){
                      var pattern=$("select").val();
                      
                      number=pattern+number;
                      
                     
                    $.post(
                            "check_number.jsp",{number:number},function(data){
                            
                             if(data.trim()=="success"){
                                 $("#register").css("cursor","not-allowed");
                                 $("#number").css("border-color","red");
                                 $("#info").html("<span style='color:white'><i  style='color:red' class='fa fa-warning'></i>This phone number is already registered with us.<a style='cursor:pointer' data-toggle='modal' data-target='#myModal1'><u>Login here</u></a></span>")
                                  
                                 $("#add").html("<input type='button' id='register' class='btn btn-warning'   value='Register Now'>")
                                 
                              }
                             else if(data.trim()=="again"){
                                 
                                 $("#info").html("");
                                  $("#number").css("border-color","black");
                                  $("#register").css("cursor","allowed");
                                 $("#add").html("<button id='register' class='btn btn-warning'>Register Now</button>")
                                 
                             }
                            }
                        );
                  }
                  
              });
               
            $("#register").on("click",function(){
             var number=$("#number").val();
             
             if(number.length<=0){
                 $("#info").html("<span style='color:red'>*This field can't be empty.</span>");
                                 
             }
             if(number.length>0 && number.length<10){
                $("#info").html("<span style='color:red'>*Mobile number must be of 10 digit.</span>");
                                 
             }
             
                  
            
            
            });
        }); 
              
              
           
            
            
            
            
            </script>
</head>

<body  style="background-color:#F5F5F5">
    <!-- Topbar Start -->
     <nav class="navbar sticky-top" style="background-color:#3392F3;">
    
           
               <a href="dashboard.jsp"  > <h4 style="color:white;font-family:AR BERKLEY">Flipkart</h4></a>
                  <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
           
           
            <div class="col-sm-1" >
               
                   <!---search bar start -->
                   <a href="dashboard.jsp" style="color:white">Home</a>
                  
                   
                   <!-- search barr end-->
               
            </div>
             <div class="col-sm-1" >
               
                   <!---search bar start -->
                   <a href="dashboard.jsp" style="color:white">Structure</a>
                  
                   
                   <!-- search barr end-->
               
            </div>
            <div class="col-sm-1" >
               
                   <!---search bar start -->
                   <a href="#" style="color:white">Services</a>
                  
                   
                   <!-- search barr end-->
               
            </div>
              <%            String name=" ";
                                             try{
                                                                        
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                         ResultSet rs=st.executeQuery("select *  from user where email='"+email+"' ");  
                                                                          while(rs.next()){
                                                                              
                                                                              
                                                                             name=rs.getString("name");
                                                                           
                                                                            
                                                                              
                                                            
                                                                     %>
            <div class="col-sm-1" id="Upper_profile" >
                <!---profile start-->
                 <a href="#"style="color:white">Resources</a>
                <!-- profile end---->
               
                 
                  <%
                                                                          }
                                             }
                                             catch(Exception e){} 




%>  
            </div>    
                   
                   
            <div class="col-sm-1" >
                 <!--- more part start-->
                 <a href="#" style="color:white">FAQs</a>
                 
                 <!-- more parrt end-->
            </div>
            <div class="col-sm-2" >
                
            </div>
            <div class="col-sm-3" >
                
                
                <!-- add to cart part start-->
                <button  class="btn btn-danger" style="background-color:#3392F3;border-color:#3392F3;" id="login_button" data-toggle="modal" data-target="#myModal1"> <i class="fa fa-user-circle-o"> Login for existing sellers</i></button>
                
                <!-- add to cart part end-->
            </div>
        </div>
    </div>
     </nav>
  <!--Toppbar end-->
  <div class="container-fluid">
      <div class="row"  >
          <div class="col-sm-12" id="form" >
              <div class="row">
                  
                  <div class="col-sm-7">
                      
                  </div>
                  
                  <div class="col-sm-5" style="margin-top:7%">
                       <h2 style="color:white;">Sign up now</h2>
                       <div class="row" style="margin-top:6%">
                           <div class="col-sm-12">
                               <form method="post" action="seller_register_process.jsp">
                  <select name="country_code"> 
                <option  value="+91" >+91</option>
                <option  value="+92" >+92</option>
                <option  value="+93" >+93</option>
                <option  value="+94" >+94</option>
                <option  value="+95" >+95</option>
                
                 </select>
                  
                  <input type="tel"  name="phone"  id="number" pattern="[0-9]{10}"required>
                  
                  <span id="add">
             <!---- <button id="register" class="btn btn-warning">Register Now</button>--->
          <input type="button" id="register" class="btn btn-warning"  value="Register Now">
                  </span>
                 
              </form>
                       </div>
                           <div class="col-sm-12">
                               <span id="info"></span>
                           </div>
                            
                       </div>
               
                  </div>
              </div>
      </div>
         
         
          
      </div>
  </div>
  <div class="container-fluid">
      <div class="row">
          <div class="col-sm-5"></div>
          <div class="col-sm-7" style="margin-top:1%">
              <h2 style="color:black">SELL ON E-SHOP</h2>
          </div>
         
          <div class="col-sm-1" ></div>
          <div class="col-sm-10" style="margin-top:2%;margin-bottom: 2%">
              
              <p>E-shop Marketplace is India’s leading platform for selling online. Be it a manufacturer, vendor or supplier, simply sell your products online on E-shop and become a top e-commerce player with minimum investment. Through a team of experts offering exclusive seller workshops, training, and seller support, E-shop focuses on empowering sellers across India.

                Selling on E-shop.com is easy and absolutely free. All you need is to register, list your catalog and start selling your products.

                What's more? We have third party ‘Ecommerce Service Providers’ who provide logistics, cataloging support, product photoshoot and packaging materials. We have a program called Seller Protection Fund to safeguard sellers from losses via compensations. We provide E-shop Fulfilment services through which you can ensure faster delivery of your items, quality check by our experts and a delightful packaging. Combine these with the fastest payments in the industry and you get an excellent seller portal. No wonder E-shop is India’s favourite place to sell online.</p>
          </div>
          <div class="col-sm-1"></div>
      </div>
  </div>
   
   
    <!-- Subscribe Start -->
   
    <!-- Subscribe End -->

 <div class="modal" id="myModal1" style="margin-top:10%">
                                              <div class="modal-dialog">
                                                <div class="modal-content">

                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                    <h4 class="modal-title">Log in</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  </div>

                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                                   
                                                           <div class="login-form">
                                                                        <form action="seller_login.jsp"  method="post">
                                                                            <div class="form-group">
                                                                                <label>Email</label>
                                                                                
                                                                                <input type="email"   id="phone"name="email" placeholder="Enter your Email" class="form-control"required="required">
                                                                                <span id="msg"></span>
                                                                            </div>
                                                                            <div class="form-group" id="user_password">
                                                                                
                                                                            </div>
                                                                            <div class="form-group" id="information">
                                                                                
                                                                            </div>
                                                                             <div class="form-group" id="button">
                                                                                
                                                                                <input type="button" value="Next" id="next" style="background-color:#3392F3">
                                                                            </div>
                                                                            
                                                                           
                                                                                   
                                                                        </form>
                                                                       
                                                                    </div>
							
						 </div>
						
						
                                                       
						 </div>
						 
                                                 

                                                 
                                                 </div>
                                              </div>
            <!-- Login Modal end-->
    
 
    <!-- Vendor End -->


    <!-- Footer Start -->
     
        <!-- Featured End -->


        <!-- Vendor Start -->
       
        <!-- Vendor End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-light font-weight-bold border border-white px-3 mr-1">flipkart</span>Shopper</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-light mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-light mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-light mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-light mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-light mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-light mb-2" href="detail.jsp"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-light mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-light mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-light" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-light mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-light mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-light mb-2" href="detail.jsp"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-light mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-light mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-light" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-light mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-danger btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-light">
                        &copy; <a class="text-light font-weight-semi-bold" href="#">Eshop</a>. All Rights Reserved. Designed
                        by Rohit Choudhary
                       
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-success back-to-top"><i class="fa fa-angle-double-up"></i></a>



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
    else{
        
        
        response.sendRedirect("index.jsp"); 
    }
                                             
                                             
                                             
                                             
                                             %>
</html>
