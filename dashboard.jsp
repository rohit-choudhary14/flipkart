<%-- 
    Document   : dashboard
    Created on : 3 Apr, 2022, 12:35:40 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        String email = null;
        Cookie c[] = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("user")) {
                email = c[i].getValue();
            }
        }

        if (email != null) {




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
        <script src="jquery-3.6.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet">

        <style>
            #card{


                box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);



            }
             #cardforoffer{


                box-shadow:1px 1px 1px rgba(0,0, 0, 0.2);
                background-color:#483D8B;
                border-radius:15px ;
                color:white;
                margin-top:1%;
                margin-bottom:1%;
                margin-left:4%;
               
               


            }
            #cardforviewall{
                box-shadow:1px 1px 1px rgba(0,0, 0, 0.2);

            }
            #card_for_product_div{
                box-shadow:5px 5px 12px rgba(0,0, 0, 0.2);
                margin-right:3px;
                margin-left:3px;

            }
            body {

                font-family: Arial, Helvetica, sans-serif;
            }
            #heart{
                color:white;
            }
            .carousel-control-prev, .carousel-control-next {
                height: 100px;
                width: 40px;
                background: none;
                margin: auto 0;
                background: rgba(0,0,0,0.2);
            }
            .carousel-control-prev i, .carousel-control-next i {
                font-size: 30px;
                position: absolute;
                top: 50%;
                display: inline-block;
                margin: -16px 0 0 0;
                z-index: 5;
                left: 0;
                right: 0;
                color: rgba(0, 0, 0, 0.8);
                text-shadow: none;
                font-weight: bold;
            }
          
.fa-stack[data-count]:after{
  position:absolute;
  right:15px;
  top:1px;
  content: attr(data-count); 
  font-size:65%;
  padding:.6em;
  border-radius:999px;
  line-height:.75em;
  color: white;
  background:rgba(255,0,0,.85);
  text-align:center;
  min-width:2em;
  font-weight:bold;
}



        </style>
        <script>
            $(document).ready(function() {
               
                var x = 1;
                $("#login").mouseover(function() {

                    $("#show_login").show();

                });
                $("#login").mouseout(function() {
                    $("#show_login").hide();

                });
                $("#more").mouseover(function() {

                    $("#show_more").show();

                });
                $("#more").mouseout(function() {
                    $("#show_more").hide();

                });
                $(".nav").mouseover(function() {
                    var rel = $(this).attr("rel");

                    $("#navlink-" + rel).css("color", "#3392F3");
                    $("#down-" + rel).attr("class", "fa fa-angle-up");
                    $("#subcat-" + rel).show();

                });
                $(".nav").mouseout(function() {
                    var rel = $(this).attr("rel");

                    $("#navlink-" + rel).css("color", "black");
                    $("#down-" + rel).attr("class", "fa fa-angle-down");
                    $("#subcat-" + rel).hide();

                });
                 $("#input").keyup(function(){
                   var search_keyword=$(this).val();
                   if(search_keyword.length>0){
                      
                       $.post(
                          "searchproduct.jsp",{search_keyword:search_keyword},function(data){
                          
                          $("section").html(data.trim());
                          }
                
                
                    );
                       
                   }
                    
                });



            });





        </script>
    </head>

    <body >
        <!-- Topbar Start -->
        <nav class="navbar sticky-top" style="background-color:#3392F3;">
           
              <h4 style="color:white;font-family:AR BERKLEY">Flipkart</h4>
    <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
     
           
                <div class="col-sm-4" >

                    <div class="input-group" style="background-color:white">
                        <input type="text"  id="input"class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"  style="color:#3392F3"></i>
                            </span>
                        </div>
                    </div>

                </div>
                <%
                   int addtocart=0;
                    try {
                        String name = " ";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                         Statement st1 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select *  from user where email='" + email + "' ");
                        if (rs.next()) {


                            name = rs.getString("name");
                             ResultSet rs1 = st1.executeQuery("select count(*) from addtocart where user_email='" + email + "' ");
                        if (rs1.next()) {
                        addtocart=rs1.getInt(1); 
                        }




                %>
                <div class="col-sm-2"  id="login">
                    <div class="nav-item dropdown" style="color:white;width:auto">
                        <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown"><%=name%>
                            <i class="fa fa-angle-down" style="padding:10px"></i></a>
                        <div class="dropdown-menu position-absolute" id="show_login">
                            <div class="row" >
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="user_profile.jsp?link=home_account" class="dropdown-item">
                                        <i class="fa fa-user-circle-o" style="color:#3392F3">
                                        </i>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>My Profile</span>
                                    </a>
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="user_profile.jsp?link=home_wishlist" class="dropdown-item">
                                        <i class="fa fa-heart" style="color:#3392F3"></i>

                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Wish-List</span></a>
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" >
                                        <i class="fa fa-shopping-cart" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Orders</span></a>
                                    <!--<s>hi</s>--->
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" >
                                        <i class="fa fa-gift" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp
                                        <span>Gift Cards</span>
                                    </a>
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item">
                                        <i class="fa fa-trophy" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp
                                        <span>Rewards</span>
                                    </a>
                                </div>

                                <div class="col-sm-12" >
                                    <a href="logout.jsp" class="dropdown-item"><i class="fa fa-sign-out" style="color:#3392F3">
                                        </i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Logout</span></a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%
                            }
                        } catch (Exception e) {
                        }




                    %>  
                </div>    

                <div class="col-sm-1" id="more" >
                    <div class="nav-item dropdown" style="color:white;width:300px">
                        <a style="cursor:pointer;font-size:20px"data-toggle="dropdown" >More 
                            <i class="fa fa-angle-down" style="padding:10px"></i></a>
                        <div class="dropdown-menu position-absolute"  id="show_more">
                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="seller_register.jsp" class="dropdown-item">
                                        <i class="fas fa-store fa-lg" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Become a Seller</span></a>

                                </div>
                                <div class="col-sm-12" style="height:10px"></div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item"><i class="fa fa-phone" style="font-size:25px;color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp; <span>24*7 Customer Care</span></a>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="col-sm-2">
                    <a href="seller_register.jsp" style="color:white" >
                        <span style="font-size:20px" > Become a Seller</span> 

                    </a>
                </div> 
                <div class="col-sm-1" >

                    <a href="ucart.jsp" style="cursor:pointer" >
                        <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                        <span class="fa-stack fa" data-count="<%=addtocart%>"></span>
                       <!-- <span id="heart" style="font-size:20px">Cart</span>-->
                    </a>
                </div>
            </div>
        </div>
        </nav>
        <!-- Topbar End -->
        <!-- Navbar Start -->
        <div class="container-fluid">
            <div class="row" id="card">



                <%
                    try {
                        int status = 1;
                        int sr = 1;
                        String album_code = " ";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select *  from category where status=" + status + " limit 0,6 ");
                        while (rs.next()) {


                            String cat_name = rs.getString("cat_name");
                            String cat_code = rs.getString("cat_code");



                %>

                <div class="col-sm-2"     > 

                    <img src="category_photos/<%=sr%>.webp" style="height:50px;" class="img-responsive"> 
                    <div class="row">
                        <div class="nav" rel="<%=cat_code%>">
                            <a href="#" class="nav-link" data-toggle="dropdown" style="color:black"  id="navlink-<%=cat_code%>" ><span id="nav-<%=cat_code%>"><%=cat_name%></span>
                                <i class="fa fa-angle-down" id="down-<%=cat_code%>"></i></a> 
                            <div class="dropdown-menu position-absolute  rounded-0 w-100 m-0" id="subcat-<%=cat_code%>" style="background-color:white">
                                <%
                                    ResultSet rs1 = st1.executeQuery("select *  from sub_category where cat_code='" + cat_code + "' ");
                                    while (rs1.next()) {


                                        String sub_name = rs1.getString("sub_name");



                                %>

                                <a href="viewall.jsp?cid=<%=sub_name%>" class="dropdown-item"><%=sub_name%></a>


                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                </div>
                <%
                        sr++;
                    }
                %>
            </div>                
        </div>



        <%
            } catch (Exception e) {
            }



        %>
        <section>
        <div class="container-fluid" style="margin-top:5px;">

            <div class="row" >
                <div class="col-lg-12" style="margin-top:1%;margin-bottom:1%" >

                    <div id="header-carousel" class="carousel slide" data-ride="carousel" >
                        <div class="carousel-inner">

                            <div class="carousel-item active" >

                                <img class="img-fluid" src="brand_photos/aede91990f2a1f7f.webp" alt="Image">


                            </div>

                            <div class="carousel-item" >

                                <img class="img-fluid" src="category_photos/f178ebd4a29bba0b.webp" alt="Image">
                            </div>


                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>

            </div>
        </div>
        <!-- Navbar End -->



        <!-- Categories Start -->
        <div class="container-fluid"    >
            <div class="row"   >
                 <div class="col-sm-12" >
                  
                            <div class="row" id="card_for_product_div" >
                        <div class="col-sm-12" style="margin-top:2%">
                            <h5 style="float:left">Men Footwear</h5>
                            <button   class="btn btn-primary" id="cardforviewall"  style="float:right;;color:white;margin-bottom:1%"><a href="viewall.jsp?cid=Men Footwear" style="color:white" >VIEW ALL</a></button>
                       
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12">
                            
                                     
                            <div id="header-carousel1" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="carousel-inner">
                                 <div class="carousel-item active" >
                                                <div class="row">
                     

                <%        
                    try {
                    String product_title = "";
                    String product_code = "";
                    String img_code = "";
                    String product_price = "";
                    String product_cat = "";
                    String product_code_store_value=""; 
                    
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        String sub_category="Men Footwear";
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' ORDER BY RAND() limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            %>
                          
                                    
                                           
                                           
                                        <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                           
                                            <div class="cat-item d-flex flex-column mb-4"  style="height:230px">
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code%>" class="cat-img position-relative overflow-hidden mb-3">
                                                    <img class="img-fluid" src="product_photos/<%=img_code%>.jpg" style="height:120px" alt=""/> 
                                                </a>

                                                <h6 ><%=product_title%></h6> 
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                            </div>
                                        </div>
    <%
                        }
                            %>
                          </div>
                                                </div>
                                                      
                            <div class="carousel-item" >
                           <div class="row">
                              
                            <%
                           
                           
                            String product_code_for_new=""; 
                            String product_title_for_new=""; 
                            String product_price_for_new="";  
                            String img_code_for_new="";   
                            ResultSet rs2 = st1.executeQuery("select * from product where status='1'  AND sub_category='"+sub_category+"' limit 5,8");
                            while(rs2.next()) {

                            product_code_for_new=rs2.getString("product_code");
                            product_title_for_new=rs2.getString("title");
                             ResultSet rs3 = st2.executeQuery("select * from product_list where status='1' AND product_code='" +product_code_for_new+ "' ");
                            if (rs3.next()) {
                               product_price_for_new=rs3.getString("price");
                               img_code_for_new=product_code_for_new+"_"+1;
                            }
                            //
                %>
               
                                 

                                 
                                       
                                                 <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                            <div class="cat-item d-flex flex-column mb-4"  style="height:230px">
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code_for_new%>" class="cat-img position-relative overflow-hidden mb-3">
                                                    <img class="img-fluid" src="product_photos/<%=img_code_for_new%>.jpg" style="height:120px" alt=""/> 
                                                </a>

                                                <h6 ><%=product_title_for_new%></h6> 
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price_for_new%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                            </div>
                                        </div>
                                   

                <%
                        }
                            %>
                             </div>
                                              </div>
 
                               
                            <%
                        }
                        



                     catch (Exception e) {
                    }



                %>
        
                                 
 </div>

                            </div>
                            <a class="carousel-control-prev" href="#header-carousel1" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel1" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                             
                        </div>
                    </div>
                       </div>   
                              
                
                               
             </div>
        </div>
           <!---- MEN T-shirt part-->
             <div class="container-fluid"    >
            <div class="row"   style="margin-top:1%" >
                 <div class="col-sm-12" >
                  
                            <div class="row" id="card_for_product_div" >
                        <div class="col-sm-12" style="margin-top:2%">
                            <h5 style="float:left">Men T-Shirt</h5>
                            <button   class="btn btn-primary" id="cardforviewall" style="float:right;;color:white;margin-bottom:1%"><a href="viewall.jsp?cid=Men T-Shirts" style="color:white">VIEW ALL</a></button>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12">
                            
                                     
                            <div id="header-carousel2" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="carousel-inner">
                                 <div class="carousel-item active" >
                                                <div class="row">
                     

                <%        
                    try {
                    String product_title = "";
                    String product_code = "";
                    String img_code = "";
                    String product_price = "";
                    String product_cat = "";
                    String product_code_store_value=""; 
                    
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        String sub_category="Men T-Shirts";
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' ORDER BY RAND() limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            %>
                          
                                    
                                           
                                           
                                        <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                            
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code%>" class="cat-img position-relative overflow-hidden mb-3">
                                                     <img class="img-fluid" src="product_photos/<%=img_code%>.jpg" style="height:150px" alt=""/>
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                    <h6><%=product_title%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                     
                                                   
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                           
                                        </div>
    <%
                        }
                            %>
                          </div>
                                                </div>
                                                      
                            <div class="carousel-item" >
                           <div class="row">
                              
                            <%
                           
                           
                            String product_code_for_new=""; 
                            String product_title_for_new=""; 
                            String product_price_for_new="";  
                            String img_code_for_new="";   
                            ResultSet rs2 = st1.executeQuery("select * from product where status='1'  AND sub_category='"+sub_category+"' limit 4,8");
                            while(rs2.next()) {

                            product_code_for_new=rs2.getString("product_code");
                            product_title_for_new=rs2.getString("title");
                             ResultSet rs3 = st2.executeQuery("select * from product_list where status='1' AND product_code='" +product_code_for_new+ "' ");
                            if (rs3.next()) {
                               product_price_for_new=rs3.getString("price");
                               img_code_for_new=product_code_for_new+"_"+1;
                            }
                            //
                %>
               
                                 

                                 
                                       
                                                 <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                                   
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code_for_new%>" class="cat-img position-relative overflow-hidden mb-3">
                                                    <img class="img-fluid" src="product_photos/<%=img_code_for_new%>.jpg"  style="height:150px" alt=""/> 
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                     <h6 ><%=product_title_for_new%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price_for_new%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                            
                                        </div>
                                   

                <%
                        }
                            %>
                             </div>
                                              </div>
 
                               
                            <%
                        }
                        



                     catch (Exception e) {
                    }



                %>
        
                                 
 </div>

                            </div>
                            <a class="carousel-control-prev" href="#header-carousel2" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel2" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                             
                        </div>
                    </div>
                       </div>   
                              
                
                               
             </div>
        </div>
                
           
           
           
           <!----Men t-shirt part end-->
            <!----offer part start-->

           <div class="container-fluid">
               <div class="row" style="margin-left:3px;margin-top:1%;margin-right:3px;cursor:pointer">
                   
                   <div class="col-sm-3 card" >
                       <a href="offerlist.jsp?content=199">
                       <div class="row">
                           
                           <div class="col-sm-11" id="cardforoffer">
                               <center><h5 style="margin-top:1%;color:white;font-size:30px">UNDER</h5></center>
                               <center><h5><i class="fa fa-rupee" style="color:white;font-size:70px ">199</i></h5></center>
                               
                           </div>
                           <div class="col-sm-1"></div>
                       </div>
                       </a>
                   </div>
                   
                    <div class="col-sm-3 card" >
                        <a href="offerlist.jsp?content=299">
                       <div class="row">
                           
                           <div class="col-sm-11" id="cardforoffer">
                               <center><h5 style="margin-top:1%;color:white;font-size:30px">UNDER</h5></center>
                               <center><h5><i class="fa fa-rupee" style="color:white;font-size:70px ">299</i></h5></center>
                               
                           </div>
                           <div class="col-sm-1"></div>
                       </div>
                       </a>
                   </div>
                   
                    <div class="col-sm-3 card" >
                        <a href="offerlist.jsp?content=499">
                       <div class="row">
                           
                           <div class="col-sm-11" id="cardforoffer">
                               <center><h5 style="margin-top:1%;color:white;font-size:30px">UNDER</h5></center>
                               <center><h5><i class="fa fa-rupee" style="color:white;font-size:70px ">499</i></h5></center>
                               
                           </div>
                           <div class="col-sm-1"></div>
                       </div>
                       </a>
                   </div>
                   
                    <div class="col-sm-3 card" >
                        <a href="offerlist.jsp?content=599" >
                       <div class="row">
                           
                           <div class="col-sm-11" id="cardforoffer">
                               <center><h5 style="margin-top:1%;color:white;font-size:30px">UNDER</h5></center>
                               <center><h5><i class="fa fa-rupee" style="color:white;font-size:70px ">599</i></h5></center>
                               
                           </div>
                           <div class="col-sm-1"></div>
                       </div>
                       </a>
                   </div>
               </div>
           </div>
<!----offer part end-->
<!-- laptop part start-->
 <div class="container-fluid"    >
            <div class="row"   style="margin-top:1%" >
                 <div class="col-sm-12" >
                  
                            <div class="row" id="card_for_product_div" >
                        <div class="col-sm-12" style="margin-top:2%">
                            <h5 style="float:left">Laptop</h5>
                            <button   class="btn btn-primary" id="cardforviewall" style="float:right;;color:white;margin-bottom:1%"><a href="viewall.jsp?cid=Laptops" style="color:white">VIEW ALL</a></button>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12">
                            
                                     
                            <div id="header-carousel3" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="carousel-inner">
                                 <div class="carousel-item active" >
                                                <div class="row">
                     

                <%        
                    try {
                    String product_title = "";
                    String product_code = "";
                    String img_code = "";
                    String product_price = "";
                    String product_cat = "";
                    String product_code_store_value=""; 
                    
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        String sub_category="Laptops";
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' ORDER BY RAND() limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            %>
                          
                                    
                                           
                                           
                                        <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                           
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code%>" class="cat-img position-relative overflow-hidden mb-3">
                                                     <img class="img-fluid" src="product_photos/<%=img_code%>.jpg"style="height:150px"  alt=""/>
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                    <h6><%=product_title%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                     
                                                   
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                          
                                        </div>
    <%
                        }
                            %>
                          </div>
                                                </div>
                                                      
                            <div class="carousel-item" >
                           <div class="row">
                              
                            <%
                           
                           
                            String product_code_for_new=""; 
                            String product_title_for_new=""; 
                            String product_price_for_new="";  
                            String img_code_for_new="";   
                            ResultSet rs2 = st1.executeQuery("select * from product where status='1'  AND sub_category='"+sub_category+"' limit 4,8");
                            while(rs2.next()) {

                            product_code_for_new=rs2.getString("product_code");
                            product_title_for_new=rs2.getString("title");
                             ResultSet rs3 = st2.executeQuery("select * from product_list where status='1' AND product_code='" +product_code_for_new+ "' ");
                            if (rs3.next()) {
                               product_price_for_new=rs3.getString("price");
                               img_code_for_new=product_code_for_new+"_"+1;
                            }
                            //
                %>
               
                                 

                                 
                                       
                                                 <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                                
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code_for_new%>" class="cat-img position-relative overflow-hidden mb-3">
                                                    <img class="img-fluid" src="product_photos/<%=img_code_for_new%>.jpg"  style="height:150px" alt=""/> 
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                     <h6 ><%=product_title_for_new%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price_for_new%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                            
                                        </div>
                                   

                <%
                        }
                            %>
                             </div>
                                              </div>
 
                               
                            <%
                        }
                        



                     catch (Exception e) {
                    }



                %>
        
                                 
 </div>

                            </div>
                            <a class="carousel-control-prev" href="#header-carousel3" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel3" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                             
                        </div>
                    </div>
                       </div>   
                              
                
                               
             </div>
        </div>
                
           
           
           
           



<!--laptop part end--->

<!---- washing machine part-->
             <div class="container-fluid"    >
            <div class="row"   style="margin-top:1%" >
                 <div class="col-sm-12" >
                  
                            <div class="row" id="card_for_product_div" >
                        <div class="col-sm-12" style="margin-top:2%">
                            <h5 style="float:left">Washing Machines</h5>
                            <button   class="btn btn-primary" id="cardforviewall" style="float:right;;color:white;margin-bottom:1%"><a href="viewall.jsp?cid=Washing Machines" style="color:white">VIEW ALL</a></button>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12">
                            
                                     
                            <div id="header-carousel4" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="carousel-inner">
                                 <div class="carousel-item active" >
                                                <div class="row">
                     

                <%        
                    try {
                    String product_title = "";
                    String product_code = "";
                    String img_code = "";
                    String product_price = "";
                    String product_cat = "";
                    String product_code_store_value=""; 
                    
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        String sub_category="Washing Machines";
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"'  ORDER BY RAND() limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            %>
                          
                                    
                                           
                                           
                                        <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                           
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code%>" class="cat-img position-relative overflow-hidden mb-3">
                                                     <img class="img-fluid" src="product_photos/<%=img_code%>.jpg" style="height:170px" alt=""/>
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                    <h6><%=product_title%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                     
                                                   
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                           
                                        </div>
    <%
                        }
                            %>
                          </div>
                                                </div>
                                                      
                            <div class="carousel-item" >
                           <div class="row">
                              
                            <%
                           
                           
                            String product_code_for_new=""; 
                            String product_title_for_new=""; 
                            String product_price_for_new="";  
                            String img_code_for_new="";   
                            ResultSet rs2 = st1.executeQuery("select * from product where status='1'  AND sub_category='"+sub_category+"' limit 4,8");
                            while(rs2.next()) {

                            product_code_for_new=rs2.getString("product_code");
                            product_title_for_new=rs2.getString("title");
                             ResultSet rs3 = st2.executeQuery("select * from product_list where status='1' AND product_code='" +product_code_for_new+ "' ");
                            if (rs3.next()) {
                               product_price_for_new=rs3.getString("price");
                               img_code_for_new=product_code_for_new+"_"+1;
                            }
                            //
                %>
               
                                 

                                 
                                       
                                                 <div class="col-sm-3"  style="background-color:white;padding:20px;">
                                            
                                                
                                                <!---<p class="text-right">15 Products</p>-->
                                                <a href="viewproduct.jsp?v=<%=product_code_for_new%>" class="cat-img position-relative overflow-hidden mb-3">
                                                    <img class="img-fluid" src="product_photos/<%=img_code_for_new%>.jpg" style="height:170px"  alt=""/> 
                                                </a>
                                                <div class="row"> 
                                                    <div class="col-sm-8">
                                                     <h6 ><%=product_title_for_new%></h6> 
                                                    </div>
                                                    <div class="col-sm-4"></div>
                                                </div>
                                                
                                                <h6  style="color:green"><i class="fa fa-rupee"></i><%=product_price_for_new%>&nbsp;40% off</h6> 
                                                <h6>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </h6>
                                           
                                        </div>
                                   

                <%
                        }
                            %>
                             </div>
                                              </div>
 
                               
                            <%
                        }
                        



                     catch (Exception e) {
                    }



                %>
        
                                 
 </div>

                            </div>
                            <a class="carousel-control-prev" href="#header-carousel4" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel4" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                             
                        </div>
                    </div>
                       </div>   
                              
                
                               
             </div>
        </div>
                
           
           
           
           <!----washing machine part end-->


        <!-- Offer Start -->
       
        <!-- Products End -->


        <!-- Subscribe Start -->

        <!-- Subscribe End -->


       
        <!-- Products End -->
        <!-- Featured Start -->
        </section>
        <div class="container-fluid pt-5" >
            <div class="row px-xl-5 pb-3" >
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 38px;">
                        <h1 class="fa fa-check text-danger m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 38px;">
                        <h1 class="fa fa-shipping-fast text-danger m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-sm-3 ">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-danger m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="d-flex align-items-center border mb-4" style="padding: 38px;">
                        <h1 class="fa fa-phone-volume text-danger m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
                
            </div>
        </div>
        <!-- Featured End -->


        <!-- Vendor Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel vendor-carousel">
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-1.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-2.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-3.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-4.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-5.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-6.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-7.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-8.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        } else {


            response.sendRedirect("index.jsp");
        }




    %>
</html>