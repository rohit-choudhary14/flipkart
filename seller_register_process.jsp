<%-- 
    Document   : seller_register_process
    Created on : 5 Apr, 2022, 12:05:34 AM
    Author     : rohit
--%>
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
    String phone="";
    String country_code="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
    }
    
    if(email!=null){
                     if(request.getParameter("phone").length()==0 || request.getParameter("country_code").length()==0){ 
                         
                     }
                     else{
                            phone=request.getParameter("phone");
                            country_code=request.getParameter("country_code");
    
    
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
        
        
        
        </style>
        <script>
           $(document).ready(function(){
              
             $("#password").keyup(function(){
                 var data=[]; 
                var flag_Upper=0;
                var flag_Lower=0;
                 
                 data=$(this).val(); 
                
                 for(var i=0;i<data.length;i++){
                          var num=data[i];
                          
                        if(flag_Lower==0){
                          
                          if(num>='a' && num<='z' ){ 
                             var flag_Lower=1;
                             $("#wrong2").html("<i class='fa fa-check-circle' id='lower'></i>");
                             $("#lower").css("color","green");
                              $("#lower").attr("id","Lower");
                            
                         }
                       }
                       if(flag_Upper==0){
                          
                          if(num>='A' && num<='Z' ){
                             var flag_Upper=1;
                             $("#wrong1").html("<i class='fa fa-check-circle' id='upper'></i>");
                             $("#upper").css("color","green");
                            
                         }
                       }  
                         if(num =='@' || num=='/' || num=='&' || num=='!'|| num=='#'){ 
                             $("#wrong3").html("<i class='fa fa-check-circle' id='special'></i>");
                             $("#special").css("color","green");
                            
                         }
                         
                     }
                   
                 
               
              
                if(data.length<8 && data.length>0){
                      $("#wrong").html("<i class='fa fa-check-circle' id='check'></i>");
                      $("#check").css("color","red");
                    
                 }
               
                 else if(data.length>=8){
                      $("#wrong").html("<i class='fa fa-check-circle' id='check'></i>");
                      $("#check").css("color","green");
                 }
                 
                 
             });
            $("#password").keydown(function(){
                  var data=[]; 
                
                 
                 data=$(this).val(); 
                
                 for(var i=0;i<data.length;i++){
                          
                          
                         if(data[i]!='@' && data[i]!='/' &&data[i]!='&' && data[i]!='!' && data[i]!='#' && data[i]!='$'){ 
                             $("#wrong3").html("<i class='fa fa-check-circle' id='special'></i>");
                             $("#special").css("color","red");
                              $("#special").attr("id","Red");
                            
                         }
                          if(data[i]>='a' && data[i]<='z' ){
                             $("#wrong2").html("<i class='fa fa-check-circle' id='lower'></i>");
                             $("#lower").css("color","green");
                             $("#lower").attr("id","Green");
                            
                         }
                         else{
                         
                            $("#wrong2").html("<i class='fa fa-check-circle' id='lower'></i>");
                             $("#lower").css("color","red");
                             $("#lower").attr("id","Red");
                         
                         }
                          if(data[i]>='A' && data[i]<='Z'){
                            
                             $("#wrong1").html("<i class='fa fa-check-circle' id='upper'></i>");
                             $("#upper").css("color","green");
                              $("#upper").attr("id","Green");
                            
                         }
                         else{
                               
                               $("#wrong1").html("<i class='fa fa-check-circle' id='upper'></i>");
                               $("#upper").css("color","red");
                               $("#upper").attr("id","Red");
                         
                         }
                         
                     }
                   
                 
               
              
                if(data.length<=0){
                  
                      $("#wrong").html("");
                     
                      $("#wrong1").html("");
                     
                      $("#wrong2").html("");
                      
                      $("#wrong3").html("");
                     
                    
                 }
                 if(data.length<8 && data.length>0){
                  
                       $("#wrong").html("<i class='fa fa-check-circle' id='check'></i>");
                      $("#check").css("color","red");
                      
                     
                    
                 }
               
                 
                 
             
             });
              
           }); 
            
            
            
            
            
            </script>
            
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid" style="background-color:#3392F3;" >
        
        <div class="row" id="cardrow" >
           
           
              <%            String name=" ";
                                             try{
                                                                        
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                         ResultSet rs=st.executeQuery("select *  from user where email='"+email+"' ");  
                                                                          if(rs.next()){
                                                                              
                                                                              
                                                                             name=rs.getString("name");
                                                                           
                                                                            
                                                                              
                                                            
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
                   
                   
            <div class="col-sm-6" >
                 
            </div>
            
            <div class="col-sm-5">
                
               
            </div>
             </div>
    </div>
            <div class="container-fluid" style="background-color:#7C0A02;">
                <div class="row" style="height:600px" >
                    
            
            <div class="col-sm-12" >
                <div class="row" style="margin-top:2%">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5"  id="card"style="height:500px" >
                         <div class="row"style="margin-top:5%">
                            <div class="col-sm-12"></div>
                            
                        </div>
                        <center><span ><h4><b>Create your Seller Account</b></h4></span></center>
                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8"> 
                                 <form method="post" action="seller_recored.jsp">
                                <input type="tel"pattern="[+]{1}[0-9]{2}[0-9]{10}"  name="phone" id="phone"class="form-controle" value="<%=country_code%><%=phone%>">
                            </div>
                            <div class="col-sm-2">
                               
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8"> 
                               
                                <input type="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" name="password" id="password" class="form-controle" placeholder="Enter Your Password" required>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                            <div class="col-sm-6">
                                <span>Minimum 8 character</span>
                                
                                
                            </div>
                            <div class="col-sm-4">
                                <span id="wrong"></span>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                            <div class="col-sm-6">
                                <span>Atlest one Uppercase</span>
                              
                               
                            </div>
                            <div class="col-sm-4">
                                <span id="wrong1"> </span>
                            </div>
                             <div class="col-sm-2">
                                
                            </div>
                             <div class="col-sm-6">
                                <span>Atlest one Lowercase</span>
                                
                                
                            </div>
                            <div class="col-sm-4">
                                <span id="wrong2"></span>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                             <div class="col-sm-6">
                                 <span>Atlest one Special Character</span>
                                
                               
                            </div>
                            <div class="col-sm-4">
                                 <span id="wrong3"></span>
                            </div>
                             
                        </div>
                         <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">
                                
                                <input type="email"  name="email" class="form-controle" placeholder="Enter Your Email" required>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">  
                                <input type="text"  name="user"class="form-controle" placeholder="Enter Your Full Name" required>
                            </div>
                            <div class="col-sm-2">
                                
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">  
                                <!--<input type="button" value="Sign UP" style="background-color:blueviolet">-->
                                <button class="btn btn-block btn-success" >Sign UP</button>
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
                              <h5 style="color:white">Sell to millions of customers on E-Shop, Right from your doorstep!</h5>
                            </div>
                          <div class="col-sm-12">  
                            <h6 style="color:white"> All you need to sell on E-Shop is</h6>
                          </div>
                           <div class="col-sm-3"> 
                              <i class="fa fa-bank" style="font-size:30px"></i>
                              <div class="row">
                                  <div class="col-sm-12">
                                      <span>Bank</span>

                                  </div>
                              </div>

                           </div>
                            <div class="col-sm-1" style="border-left: 2px solid white; height:50px;">
                                
                            </div>
                            <div class="col-sm-3">
                              <i class="fas fa-tshirt" style="font-size:30px"></i>
                              <div class="row">
                                  <div class="col-sm-12">
                                      <span>Products</span>
                                             
                                  </div>
                              </div>
                            </div>
                             <div class="col-sm-1" style="border-left: 2px solid white; height:50px;"></div>
                            <div class="col-sm-3">
                             <i class="fa fa-file-text-o" style="font-size:30px"></i>
                             <div class="row">
                                  <div class="col-sm-12">
                                      <span>GSTIN*</span>
                                             
                                  </div>
                              </div>
                             
                            </div>
                              <div class="col-sm-1"></div>
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  <span>*GSTIN is not required for sellers who only sell books</span>
                              </div>
                               <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12" style="height:2px;background-color:white">
                                  
                              </div>
                              <div class="col-sm-12" style="height:20px">
                                  
                              </div>
                              <div class="col-sm-12">
                                  <p>How will this information be used?</p>
                                  <p>    You can use your email address or mobile number as 'Username' to login to your seller Account.</p>
                                  <p>    Please note, the ‘Username’ and ‘Password’ used here are only to access your E-Shop Seller Account and cannot be used on E-shop.coom shopping destination.</p>
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
