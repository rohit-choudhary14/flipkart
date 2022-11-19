<%-- 
    Document   : ucart
    Created on : 29 Apr, 2022, 11:58:29 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html lang="en">

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


                box-shadow:0px 0px 10px rgba(0,0, 0, 0.4);



            } 
            body {

                font-family: Arial, Helvetica, sans-serif;
            }
            #heart{
                color:white;
            }
            #saveforlater:hover{
                color:#3392F3;
            }
            #remove:hover{
                color:#3392F3;
            }
            #removeforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            a:hover{
                color:blue;
            }
            #cancelforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
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
                $(".remove").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");
                    var product_price = $(this).attr("rel3");
                    var sn = $(this).attr("rel4");
                    $("#removeforcart").attr("rel", product_code);
                    $("#removeforcart").attr("rel1", product_size);
                    $("#removeforcart").attr("rel2", product_img_code);
                    $("#removeforcart").attr("rel3", product_price);
                    $("#removeforcart").attr("rel4", sn);
                    $("#myModal_remove_add_to_cart").modal();
                });
                $("#removeforcart").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");

                    var product_price = $(this).attr("rel3");



                    var price_to_be = $("#show-price").text();


                    var delivery_charges = $("#deliver-charges").text();

                    var discount_price = $("#set-discount-price").text();

                    var price_to_be_show = parseInt(price_to_be) - parseInt(product_price);

                    if (price_to_be_show < 499) {

                        $("#deliver-charges").text("49");
                        delivery_charges = 49;
                    }
                    if (price_to_be_show < 15000) {

                        $("#set-discount-price").text("0");
                        discount_price = 0;
                    }

                    $("#show-price").text(price_to_be_show);
                    //var total_amount_to_be = $("#total_amount_show").text();//19716
                    var total_amount_to_be_show_real = parseInt(price_to_be_show) + parseInt(delivery_charges) - parseInt(discount_price);

                    $("#total_amount_show").text(total_amount_to_be_show_real);

                    //






                    /*
                     
                     //19716-20990
                     
                     if (total_amount_to_be_show < 15000) {
                     
                     $("#set-discount-price").text("0");
                     discount_price = 0;
                     }
                     */
                    var num_item = $("#number-of-items").text();
                    if (parseInt(num_item) == 1) {

                        $("#lastproduct").load("lastproduct.jsp");
                    }
                    $("#number-of-items").text(parseInt(num_item) - 1);
                    $("#num-cart").text(parseInt(num_item) - 1);
                    var sn = $(this).attr("rel4");
                    var count_of_cart = $("#count-of-cart").attr("data-count");
                    $("#count-of-cart").attr("data-count", parseInt(count_of_cart) - 1);

                    $.post(
                            "removefromcart.jsp", {product_code: product_code, product_size: product_size, product_img_code: product_img_code, product_price: product_price}, function(data) {
                        if (data.trim() === "success") {
                            $("#myModal_remove_add_to_cart").modal('hide');
                            $("#fade-" + sn).fadeOut();
                            $("#faderow-" + sn).fadeOut();
                        }
                    }

                    );
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
        <!--Topbar Start -->
        <nav class="navbar sticky-top" style="background-color:#3392F3;">

            <a href="dashboard.jsp"  > <h4 style="color:white;font-family:AR BERKLEY">Flipkart</h4></a>
            <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">

            <div class="col-sm-4" >

                <div class="input-group"  style="background-color:white">
                    <input type="text" id="input" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"  style="color:#3392F3"></i>
                        </span>
                    </div>
                </div>

            </div>
            <%                      String name = " ";
                int addtocart = 0;
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                    Statement st = cn.createStatement();
                    Statement st1 = cn.createStatement();
                    ResultSet rs = st.executeQuery("select *  from user where email='" + email + "' ");
                    if (rs.next()) {


                        name = rs.getString("name");
                        ResultSet rs1 = st1.executeQuery("select count(*) from addtocart where user_email='" + email + "' ");
                        if (rs1.next()) {
                            addtocart = rs1.getInt(1);
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
            <div class="col-sm-2" >
                <a href="seller_register.jsp" style="color:white" >
                    <span style="font-size:20px" > Become a Seller</span> 

                </a>
            </div> 
            <div class="col-sm-1"  >

                <a href="ucart.jsp" style="cursor:pointer" >
                    <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                    <span class="fa-stack fa" data-count="<%=addtocart%>" id="count-of-cart"></span>
                    <!-- <span id="heart" style="font-size:20px">Cart</span>-->
                </a>
            </div>
        </nav>
                    <section>
        <div class="container-fluid">
            <div id="lastproduct">
                <%
                    String pincode = "";
                    int count_of_product = 0;
                    int total_product_price = 0;
                    int discount_price = 0;
                    int delivary_charges = 0;
                    String img_code = "";
                    String product_code = "";
                    String product_title = "";
                    String product_size = "";
                    String product_price = "";
                    int flag = 0;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from addtocart where user_email='" + email + "'");
                        if (rs.next()) {
                            pincode = rs.getString("address");
                            flag = 1;
                        }
                        ResultSet rs1 = st.executeQuery("select count(*) from addtocart where user_email='" + email + "'");
                        if (rs1.next()) {


                            count_of_product = rs1.getInt(1);

                        }
                        if (flag == 1) {

                %>




                <div class="row" style="margin-top:2%">
                    <div class="col-sm-1">

                    </div>
                    <div class="col-sm-6 card" >
                        <div class="row">
                            <div class="col-sm-4"style="padding:10px">
                                <h4>MY CART(<span id="num-cart"><%=count_of_product%></span>)</h4>
                            </div>
                            <div class="col-sm-5" style="padding:12px">
                                <h5>Deliver To:<%=pincode%></h5>  

                            </div>
                            <div class="col-sm-3" style="padding:10px">
                                <button class="btn btn-success">Change</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="background-color:gray;height:1px">

                            </div>
                            <div class="col-sm-12" style="height:20px">

                            </div>
                            <%
                                int sn = 1;
                                ResultSet rs2 = st.executeQuery("select * from addtocart where user_email='" + email + "'");
                                while (rs2.next()) {
                                    flag = 1;
                                    img_code = rs2.getString("photo_code");
                                    product_code = rs2.getString("product_code");
                                    product_size = rs2.getString("product_size");
                                    product_price = rs2.getString("product_price");
                                    String seller_code = "";
                                    String shop_name = "";
                                    total_product_price = total_product_price + Integer.parseInt(product_price);

                                    ResultSet rs3 = st1.executeQuery("select * from product where product_code='" + product_code + "'");
                                    if (rs3.next()) {
                                        product_title = rs3.getString("title");
                                        seller_code = rs3.getString("seller_code");
                                        ResultSet rs4 = st1.executeQuery("select shop_name from shop_details where user_code='" + seller_code + "'");
                                        if (rs4.next()) {
                                            shop_name = rs4.getString("shop_name");
                                        }
                                    }

                            %>
                            <div class="col-sm-2" id="fade-<%=sn%>">
                                <a href="viewproduct.jsp?v=<%=product_code%>"> <img class="img-fluid" src="product_photos/<%=img_code%>.jpg"  height="200px" alt=""/> </a>

                            </div>
                            <div class="col-sm-10" id="faderow-<%=sn%>">
                                <h5><a href="viewproduct.jsp?v=<%=product_code%>" ><%=product_title%></a></h5>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <span>Size:</span> <%=product_size%>
                                    </div>
                                    <div class="col-sm-12" style="height:10px">

                                    </div>
                                    <div class="col-sm-12">
                                        <span>Seller:</span> <%=shop_name%>
                                    </div>
                                    <div class="col-sm-12" style="height:10px">

                                    </div>
                                    <div class="col-sm-12">
                                        <span>Price:</span> <i class="fa fa-rupee" style="color:black" ><%=product_price%></i> 
                                    </div>
                                    <div class="col-sm-12" style="height:10px">

                                    </div>
                                    <div class="col-sm-6">
                                        <a href="#" style="color:black" id="saveforlater">SAVE FOR LATER</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <a  style="color:black;cursor:pointer" class="remove" rel="<%=product_code%>" rel1="<%=product_size%>" rel2="<%=img_code%>"rel3="<%=product_price%>" rel4="<%=sn%>">REMOVE</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12" style="height:20px">

                            </div>
                            <%
                                    sn++;
                                }
                                if (total_product_price > 15000) {
                                    discount_price = 1500;
                                } else {
                                    discount_price = 0;
                                }

                            %>

                        </div>
                        <div class="row" >
                            <div class="col-sm-12" id="card" style="height:90px">
                                <button class="btn btn-warning" style="color:white;float:right;margin-top:2%;background-color: #FF7E00;width:45%;height:70%;" >
                                    <h5 style="color:white" >PLACE ORDER</h5></button>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1">

                    </div>
                    <div class="col-sm-3 card" style="height:300px">
                        <div class="row">
                            <div class="col-sm-12" style="padding:10px">
                                <h5>PRICE DETAILS</h5>
                            </div>
                            <div class="col-sm-12" style="background-color:gray;height:1px">

                            </div>
                            <div class="col-sm-8" style="margin-top:20px">
                                <h6 style="color:black" >Price(<span id="number-of-items"><%=count_of_product%></span> items)</h6>
                            </div>
                            <div class="col-sm-4" style="margin-top:20px;">

                                <h6> &nbsp;&nbsp; &nbsp;<i class="fa fa-rupee" style="color:black;font-size:18px"></i><span style="color:black;font-size:18px" id="show-price"><%=total_product_price%></span></h6>
                            </div>
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="col-sm-8">
                                <h6>Discount</h6>

                            </div>
                            <div class="col-sm-4">

                                <h6 style="color:green">
                                    <i class="fa fa-minus"></i>
                                    <i class="fa fa-rupee" style="font-size:18px"></i>
                                    <span style="font-size:18px" id="set-discount-price"><%=discount_price%></span></h6>
                            </div>
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="col-sm-8">
                                <h6>Coupons for you</h6>
                            </div>
                            <div class="col-sm-4">
                                <h6 style="color:green">
                                    <i class="fa fa-minus"></i>
                                    <i class="fa fa-rupee" style="font-size:18px"></i><span style="font-size:18px">0</span>
                                </h6>
                            </div>

                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="col-sm-8">
                                <h6>Delivery Charges</h6>
                            </div>
                            <%
                                int total_price = 0;
                                if (total_product_price > 499) {
                                    delivary_charges = 0;
                                } else {
                                    delivary_charges = delivary_charges + 49;
                                }
                                total_price = total_product_price - discount_price + delivary_charges;



                            %>
                            <div class="col-sm-4">
                                <h6 style="color:black">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-rupee" style="font-size:18px"></i><span style="font-size:18px" id="deliver-charges"><%=delivary_charges%></span>
                                </h6>
                            </div>
                            <div class="col-sm-12" style="background-color:gray;height:1px">

                            </div>
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="col-sm-8">
                                <h6>Total Amount</h6>
                            </div>

                            <div class="col-sm-4">
                                <h6 style="color:black">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-rupee" style="font-size:18px"></i><span style="font-size:18px" id="total_amount_show"><%=total_price%></span>
                                </h6>
                            </div>

                        </div>

                    </div>
                    <div class="col-sm-1">

                    </div>
                </div>
                <%
                } else {
                %>
                <div class="row"  style="margin-top:2%" >
                    <div class="col-sm-1 ">

                    </div>
                    <div class="col-sm-10 card ">
                        <div class="row" >
                            <div class="col-sm-12" style="height:20px">

                            </div>
                            <div class="col-sm-12">
                                <h4>My Cart</h4>
                            </div>
                            <div class="col-sm-4"></div>

                            <div class="col-sm-4">
                                <img src="offer-icon/empty.webp" style="height:200px;width:250px">
                                <div class="row">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-11">
                                        <h4 style="color:black">Your cart is empty!</h4>
                                    </div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-10">
                                        <span style="color:black">Add items to it now.</span>
                                    </div>

                                    <div class="col-sm-10">
                                        <button class="btn btn-primary btn-block" ><a href="dashboard.jsp"  style='color:white'>Shop now</a></button>
                                    </div>
                                    <div class="col-sm-2">

                                    </div>
                                    <div class="col-sm-12" style="height:20px">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                    </div>
                    <div class="col-sm-1 ">

                    </div>

                </div>





                <%                          }
                    } catch (Exception e) {
                    }

                %>






            </div>
        </div>
        <div class="modal" id="myModal_remove_add_to_cart">
            <div class="modal-dialog" style="margin-top:15%">
                <div class="modal-content">


                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h5>Remove Item</h5>
                                </div>
                                <div class="col-sm-12" style="height:20px">

                                </div>
                                <div class="col-sm-12">
                                    <span>Are you sure you want to remove this item?</span>
                                </div>
                                <div class="col-sm-12" style="height:25px">

                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="button" id="cancelforcart"  data-dismiss="modal" value="CANCEL">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="button" id="removeforcart" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <!-- Topbar End -->
        <!-- Navbar Start -->


        <!-- Navbar End -->



        <!-- Categories Start -->







        <!-- Offer Start -->

        <!-- Offer End -->



        <!-- Products Start -->

        <!-- Products End -->


        <!-- Subscribe Start -->

        <!-- Subscribe End -->


        <!-- Products Start -->

        <!-- Products End -->
        <!-- Featured Start -->



        <!-- Vendor Start -->
        <!---java Script Libraries -->
                    </section>
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
    </html>


<%
} 
            else {

%>
<html lang="en">

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
        
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Customized Bootstrap Stylesheet -->
        <script src="jquery-3.6.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet">

        <style>
            #card{


                box-shadow:0px 0px 10px rgba(0,0, 0, 0.4);



            } 
            body {

                font-family: Arial, Helvetica, sans-serif;
            }
            #heart{
                color:white;
            }
            #saveforlater:hover{
                color:#3392F3;
            }
            #remove:hover{
                color:#3392F3;
            }
            #removeforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            #cancelforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
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
            $(document).ready(function(){
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
        

    <nav class="navbar sticky-top" style="background-color:#3392F3;">
        <a href="index.jsp"><h2 style="color:white;font-family:AR BERKLEY">Flipkart</h2></a>
        <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">



        <div class="col-sm-5" >

            <div class="input-group" style="background-color:white">
                <input type="t
                       ext" class="form-control" id="input" placeholder="Search for products">
                <div class="input-group-append">
                    <span class="input-group-text bg-transparent text-primary">
                        <i class="fa fa-search" style="color:#3392F3" ></i>
                    </span>
                </div>
            </div>

        </div>

        <div class="col-sm-1"  >



        </div>    
        <div class="col-sm-1"  >

        </div>
        <div class="col-sm-1"  >

        </div>

        <div class="col-sm-2" >

            <input type="button" id="login" style="font-size:20px;background-color:white;color:#3392F3;border-color:white;width:100%"  value="Login"data-toggle="modal" data-target="#myModal1" >

        </div>
    </div>
</div>
</nav>
    <section>
<div class="container-fluid">

    <div class="row"  style="margin-top:2%" >
        <div class="col-sm-1 ">

        </div>
        <div class="col-sm-10 card ">
            <div class="row" >
                <div class="col-sm-12" style="height:20px">

                </div>
                <div class="col-sm-12">
                    <h4>My Cart</h4>
                </div>
                <div class="col-sm-4"></div>

                <div class="col-sm-4">
                    <img src="offer-icon/empty.webp" style="height:200px;width:270px">
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <h4 style="color:black">Missing Cart items?
                            </h4>
                        </div>

                        <div class="col-sm-12">
                            <span style="color:black">Login to see the items you added previously</span>
                        </div>

                        <div class="col-sm-10">
                            <button class="btn btn-warning btn-block" style="background-color: #FF7E00;color:white;border-color: #FF7E00"  data-toggle="modal" data-target="#myModal1" >Login</button>
                        </div>
                        <div class="col-sm-2">

                        </div>
                        <div class="col-sm-12" style="height:20px">

                        </div>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
        <div class="col-sm-1 ">

        </div>

    </div>
    <div class="modal" id="myModal1" >
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Sign in</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <div class="login-form">
                        <form action="user_login.jsp"  method="post">
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="email"  name="email"class="form-control"required="required">
                            </div>
                            <div class="form-group">
                                <label>Password:</label>
                                <input type="password" name="password" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block"  style="color:white">Log in</button>
                            </div>
                            <div class="clearfix">
                                <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                                <a href="#" class="float-right" style="color:blue">Forgot Password?</a>
                            </div>        
                        </form>

                    </div>

                </div>



            </div>




        </div>
    </div>
</div>

    </section>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>

<%        // response.sendRedirect("index.jsp");
    }




%>

            

            
            


