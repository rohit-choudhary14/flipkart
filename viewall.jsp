<%-- 
    Document   : viewall
    Created on : 6 May, 2022, 5:26:12 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        String email = null;
        String sub_cat_for_search = "";
        Cookie c[] = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("user")) {
                email = c[i].getValue();
            }
        }
        int flag = 0;
        if (request.getParameter("cid").length() == 0) {
            } else {
                sub_cat_for_search = request.getParameter("cid");
            }
        


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
            #card1{


                box-shadow:5px 10px 30px rgba(0,0, 0, 0.1);



            }
           
            #cardforfillter{


                box-shadow:1px 2px 1px rgba(0,0, 0, 0.4);



            }
            #cardforshowproduct{


                box-shadow:1px 1px 1px rgba(0,0, 0, 0.4);



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
            .col-sm-12.hide{
                display:none;
            }
            #product_show{
                display:none;
            }
             a:hover{
                color:blue;
            }



        </style>
        <%
        if (email != null) {
            

        
        
        
        %>
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

                $(".col-sm-12.lg").mouseover(function() {
                    $(this).addClass("card");
                    $(this).attr("id", "card1");
                    $(this).css("height", "400px");
                    var product_code = $(this).attr("rel");

                    $("#hide-" + product_code).show();
                    $(".col-sm-3.show-" + product_code).show();


                });
                $(".col-sm-12.lg").mouseout(function() {
                    $(this).removeClass("card");
                    $(this).attr("id", "");
                    $(this).css("height", "300px");
                    var product_code = $(this).attr("rel");
                    $("#hide-" + product_code).hide();
                    $(".col-sm-3.show-" + product_code).hide();



                });
                /* var min_price = $("#min_price").val();
                 var max_price = $("#max_price").val();*/
                $("select").on("click", function() {
                    var price = $("#min_price").val();
                    var price1 = $("#max_price").val();
                    var sub_category = '<%=sub_cat_for_search%>' ;  
                    
                    if (price > 0 && price1 > 0) {

                        $.post(
                                "filter_result.jsp", {price1: price1, price: price, sub_category: sub_category}, function(data) {
                                           $("#filter_result_show").html(data.trim());
                                          
                            $("#show_filter_result").html("<div class='alert alert-dark alert-dismissible'><a  style='cursor:pointer' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" + price + "-" + price1 + "</div>");
                            $(".close").on("click", function() {

                                $('#min_price').val('MIN');
                                

                            });
                        });









                    }

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

    <body  >
        <!-- Topbar Start -->
         <nav class="navbar sticky-top" style="background-color:#3392F3;">
       
               <a href="dashboard.jsp"  > <h4 style="color:white;font-family:AR BERKLEY">Flipkart</h4></a>
                  <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
           
                <div class="col-sm-4" >

                    <div class="input-group" style="background-color:white">
                        <input type="text" id="input" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"  style="color:#3392F3"></i>
                            </span>
                        </div>
                    </div>

                </div>
                <%
                    int addtocart = 0;
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
                                    <a href="user_profile.jsp?link=home_wishlist"class="dropdown-item">
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

                <div class="col-sm-1"  id="more" >
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
                <div class="col-sm-1" >

                    <a href="ucart.jsp" style="cursor:pointer" >
                        <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                        <span class="fa-stack fa" data-count="<%=addtocart%>"></span>
                        <!-- <span id="heart" style="font-size:20px">Cart</span>-->
                    </a>
                </div>
         </nav>
        <!-- Topbar End -->
        <!-- Navbar Start -->
        <div class="container-fluid">
            <div class="row" id="card">



                <%
                    String category_code_for_filter = "";
                    String category_name_for_filter = "";
                    String sub_name_for_filter = "";
                    try {
                        int status = 1;
                        int sr = 1;
                        String album_code = " ";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select *  from category where status=" + status + " limit 0,6 ");
                        while (rs.next()) {


                            String cat_name = rs.getString("cat_name");
                            String cat_code = rs.getString("cat_code");



                %>

                <div class="col-sm-2"     > 

                   <!--- <img src="category_photos/<%=sr%>.webp" style="height:50px;" class="img-responsive"> --->
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

 

        <!-- Navbar End -->
        <section>
        <div class="container-fluid">

            <div class="row" style="margin-top:2%;">
                
                <div class="col-sm-3 card" >
                     
                    <div class="row">
                        <div class="col-sm-8"  >

                            <h6 style="color:black;margin-top:2%">FILTER</h6>

                            <div class="row">
                                <div class="col-sm-12" id="show_filter_result">

                                </div>


                            </div>
                        </div>
                        <div class="col-sm-4" id="clear_all_filter" >

                        </div>

                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12"  style="height:20px;"></div>
                        <div class="col-sm-12" style="margin-top:5%">

                            <h6 style="color:black">CATEGORIES</h6>


                        </div>
                        <div class="col-sm-12">
                            <%

                                ResultSet rs3 = st2.executeQuery("select *  from sub_category where sub_name='" + sub_cat_for_search + "'  ");
                                if (rs3.next()) {

                                    category_code_for_filter = rs3.getString("cat_code");

                                }
                                ResultSet rs4 = st2.executeQuery("select *  from category where cat_code='" + category_code_for_filter + "' ");
                                if (rs4.next()) {

                                    category_name_for_filter = rs4.getString("cat_name");

                                }





                            %>

                            <a href="#" class="nav-link" data-toggle="dropdown" style="color:black"   ><span id=""><%=category_name_for_filter%></span>
                                <i class="fa fa-angle-right" ></i></a> 
                            <div class="dropdown-menu"  style="background-color:white">
                                <%
                                    ResultSet rs5 = st2.executeQuery("select *  from sub_category where cat_code='" + category_code_for_filter + "' ");
                                    while (rs5.next()) {

                                        sub_name_for_filter = rs5.getString("sub_name");



                                %>
                                <div class="col-sm-12">
                                    <a href="viewall.jsp?cid=<%=sub_name_for_filter%>"style="color:black" ><%=sub_name_for_filter%></a>
                                </div>



                                <%
                                    }
                                %>

                            </div>

                        </div>   

                        <%
                            } catch (Exception e) {
                            }



                        %>

                        <div class="col-sm-12" style="margin-top:8%">
                            <h6 style="cursor:pointer;color:black"><%=sub_cat_for_search%></h6>
                        </div>
                            <%
           if(sub_cat_for_search.equals("Laptops")){
            
            
            %>
                        <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">20000</i></option>
                                <option><i class="fa fa-rupee">25000</i></option>
                                <option><i class="fa fa-rupee">30000</i></option>
                                <option><i class="fa fa-rupee">35000</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">75000</i></option>
                                <option><i class="fa fa-rupee">60000</i></option>
                                <option><i class="fa fa-rupee">50000</i></option>
                                <option><i class="fa fa-rupee">40000</i></option>

                            </select>

                        </div>
                                       <%
           }
          else if(sub_cat_for_search.equals("Washing Machines")){
            
            
            %>
                        <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">10000</i></option>
                                <option><i class="fa fa-rupee">15000</i></option>
                                <option><i class="fa fa-rupee">20000</i></option>
                                <option><i class="fa fa-rupee">25000</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">55000</i></option>
                                <option><i class="fa fa-rupee">50000</i></option>
                                <option><i class="fa fa-rupee">40000</i></option>
                                <option><i class="fa fa-rupee">35000</i></option>

                            </select>

                        </div>
                        
                        <%
           
           }
           else{
               
               
               
               
               
               %>
               
               
                <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">200</i></option>
                                <option><i class="fa fa-rupee">300</i></option>
                                <option><i class="fa fa-rupee">400</i></option>
                                <option><i class="fa fa-rupee">500</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">2000</i></option>
                                <option><i class="fa fa-rupee">1500</i></option>
                                <option><i class="fa fa-rupee">1200</i></option>
                                <option><i class="fa fa-rupee">1000</i></option>

                            </select>

                        </div>
               
               
               
               
               
               
               <%
               
               
               
           }
               
               
               
               %>
                        <div  class="col-sm-12" style="margin-top:5%">
                            <h6>CUSTOMER RATING</h6>
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="4">&nbsp;4&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="3">&nbsp;3&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="2">&nbsp;2&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="1">&nbsp;1&nbsp;<i class="fa fa-star"></i>&nbsp;&above

                        </div>
                    </div>


                </div>
                 
                <div  class="col-sm-9 card" style="margin-left:-10px;">
                    <div id="filter_result_show">
                    <div class="row">
                        <%

                            String product_code = "";
                            String title = "";
                            String product_price = "";
                            String description = "";
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                                Statement st = cn.createStatement();
                                Statement st1 = cn.createStatement();
                                Statement st2 = cn.createStatement();
                                if (sub_cat_for_search.equals("Laptops")||sub_cat_for_search.equals("Washing Machines")) {
                                    ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_cat_for_search + "' AND status='1'ORDER BY RAND()");
                                    while (rs.next()) {
                                        flag = 1;
                                        product_code = rs.getString("product_code");
                                        title = rs.getString("title");
                                        description = rs.getString("des");
                                        String des[] = description.split(",");
                                        ResultSet rs1 = st1.executeQuery("select  price from product_list where product_code='" + product_code + "' AND status='1'");
                                        if (rs1.next()) {
                                            product_price = rs1.getString("price");
                                        }
                        %>

                        <div class="col-sm-3"  style="margin-top:1%">

                            <div class="row">

                                <div class="col-sm-12"   >
                                    <%
                                         if (sub_cat_for_search.equals("Washing Machines")) {
                                        
                                        %>

                                    <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="margin-top:3%;height:150px" class="img-fluid">
                                    <%
                                         }  
                                         else{
                                             %>
                                             
                                             <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="margin-top:3%;" class="img-fluid">
                                             
                                             <%
                                             
                                         }
                                             
                                             %>
                                    <div class="row">


                                        <div class="col-sm-12 hide" id="hide-<%=product_code%>">
                                            <span>Size</span>
                                        </div>   
                                        <%
                                            String product_size = "";

                                            ResultSet rs2 = st2.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1'");
                                            while (rs2.next()) {
                                                product_size = rs2.getString("size");




                                        %>

                                        <div class="col-sm-3 show-<%=product_code%>"  id="product_show"  >

                                            <h6 class="size"> <%=product_size%></h6>

                                        </div>
                                        <%

                                            }



                                        %>



                                    </div>

                                </div>

                            </div>
                            <div  class="col-sm-12" style="height:40px">

                            </div>



                        </div>
                        <div class="col-sm-7" style="margin-top:1%">
                            <div class="col-sm-12" >
                                <h6> <a href="viewproduct.jsp?v=<%=product_code%>" > <%=title%></a></h6>
                            </div>
                            <div class="col-sm-12" >
                                <%
                                    for (int i = 0; i < des.length; i++) {

                                %>
                                <li style="font-size:14px;color:black"> <%=des[i]%></li>  
                                    <%

                                        }

                                    %>
                            </div>

                            <!--<div class="col-sm-12" >
                                <h6> <i class="fa fa-rupee"></i><%=product_price%></h6>
                            </div>  --->       
                        </div>
                        <div class="col-sm-2"  style="margin-top:1%">
                            <div class="col-sm-12" >
                                <h6 style="font-size:20px"> <i class="fa fa-rupee"></i><%=product_price%></h6>
                            </div>
                        </div>
                        <div  class="col-sm-12" style="height:1px;background-color:#F1F2F4">

                        </div>




                        <%


                            }
                        } else {
                                    
                            ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_cat_for_search + "' AND status='1'ORDER BY RAND()");
                            while (rs.next()) {
                                flag = 1;
                                product_code = rs.getString("product_code");
                                title = rs.getString("title");
                                ResultSet rs1 = st1.executeQuery("select  price from product_list where product_code='" + product_code + "' AND status='1'");
                                if (rs1.next()) {
                                    product_price = rs1.getString("price");
                                }


                        %>


                        <div class="col-sm-4">

                            <div class="row" style="margin-left:10px;margin-right:10px">

                                <div class="col-sm-12 lg" id="" rel="<%=product_code%>" style="height:300px;" >


                                    <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="display:inline-block;height:250px;margin-top:3%"  class="img-fluid">

                                    <div class="row">

                                        <div class="col-sm-12" >
                                            <h6> <a href="viewproduct.jsp?v=<%=product_code%>" > <%=title%></a></h6>
                                        </div>

                                        <div class="col-sm-12" >
                                            <h6> <i class="fa fa-rupee"></i><%=product_price%></h6>
                                        </div>
                                        <div class="col-sm-12 hide" id="hide-<%=product_code%>">
                                            <span>Size</span>
                                        </div>   
                                        <%
                                            String product_size = "";

                                            ResultSet rs2 = st2.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1'");
                                            while (rs2.next()) {
                                                product_size = rs2.getString("size");




                                        %>

                                        <div class="col-sm-3 show-<%=product_code%>"  id="product_show"  >

                                            <h6 class="size"> <%=product_size%></h6>

                                        </div>
                                        <%

                                            }



                                        %>



                                    </div>

                                </div>

                            </div>
                            
                       <div  class="col-sm-12" style="height:70px">

                            </div>


                        </div>







                        <%
                                }
                            if(flag==0){
                            %>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9">
                                <img src="offer-icon/03494b209a1511a61868ced337b97931.webp">
                            </div>
                            
                            <%
                            }
                                }
                        %>
                    </div>

                    <%
                        } catch (Exception e) {
                        }





                    %>
</div>
                </div>

            </div>
        </div>
        <%
            if (flag == 0) {
        %>


        <%                                }



        %>












        </section>



        <!--laptop part end--->


        <!-- Offer Start -->

        <!-- Offer End -->



        <!-- Products Start -->


        <!-- Subscribe Start -->

        <!-- Subscribe End -->


        <!-- Products Start -->

        <!-- Featured Start -->
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
        }
        else {
            %>
            <style>
                
                 a:hover{
                color:blue;
            }
            </style>
            <script>
            $(document).ready(function() {
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
                 $(".col-sm-12.lg").mouseover(function() {
                    $(this).addClass("card");
                    $(this).attr("id", "card1");
                    $(this).css("height", "400px");
                    var product_code = $(this).attr("rel");

                    $("#hide-" + product_code).show();
                    $(".col-sm-3.show-" + product_code).show();


                });
                $(".col-sm-12.lg").mouseout(function() {
                    $(this).removeClass("card");
                    $(this).attr("id", "");
                    $(this).css("height", "300px");
                    var product_code = $(this).attr("rel");
                    $("#hide-" + product_code).hide();
                    $(".col-sm-3.show-" + product_code).hide();



                });
                /* var min_price = $("#min_price").val();
                 var max_price = $("#max_price").val();*/
                $("select").on("click", function() {
                    var price = $("#min_price").val();
                    var price1 = $("#max_price").val();
                    var sub_category = '<%=sub_cat_for_search%>' ;  
                    
                    if (price > 0 && price1 > 0) {

                        $.post(
                                "filter_result.jsp", {price1: price1, price: price, sub_category: sub_category}, function(data) {
                                           $("#filter_result_show").html(data.trim());
                                          
                            $("#show_filter_result").html("<div class='alert alert-dark alert-dismissible'><a  style='cursor:pointer' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" + price + "-" + price1 + "</div>");
                            $(".close").on("click", function() {

                                $('#min_price').val('MIN');
                                

                            });
                        });









                    }

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
                <body>
<nav class="navbar sticky-top" style="background-color:#3392F3;">
    <a href="index.jsp"> <h2 style="color:white;font-family:AR BERKLEY">Flipkart</h2></a>
    <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
        
                      
                
                <div class="col-sm-5" >

                    <div class="input-group" style="background-color:white">
                        <input type="text" id="input" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search" style="color:#3392F3" ></i>
                            </span>
                        </div>
                    </div>

                </div>

                <div class="col-sm-1"  id="login">
                    <div class="nav-item dropdown" style="color:white;cursor:pointer;width:auto">

                        <input type="button" id="login" style="font-size:20px;background-color:white;color:#3392F3;border-color:white;width:100%"  value="Login"data-toggle="modal" data-target="#myModal1" >


                        <div class="dropdown-menu position-absolute"  style="margin-left:-70px" id="show_login">

                            <div class="row" >
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item"  data-toggle="modal" data-target="#myModal">
                                        <span>New Customer ?</span> 
                                       
                                        <span style="color:#3392F3">Sign Up</span>
                                    </a>
                                </div>

                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1" >
                                        <i class="fa fa-user-circle-o" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<span>My profile</span>
                                    </a>

                                </div> 



                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1">
                                        <i class="fa fa-shopping-cart" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Orders</span></a>
                                    <!--<s>hi</s>--->
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1">
                                        <i class="fa fa-heart" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp
                                        <span>Wishlist</span>
                                    </a>
                                </div>
                                 <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1">
                                        <i class="fa fa-gift" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp
                                        <span>Gift Cards</span>
                                    </a>
                                </div>
                                 <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1">
                                        <i class="fa fa-trophy" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp
                                        <span>Rewards</span>
                                    </a>
                                </div>
                            </div>


                        </div>



                    </div>



                </div>    
            <div class="col-sm-1" id="more" >
                    <div class="nav-item dropdown" style="color:white;">
                        <a style="cursor:pointer;font-size:20px"data-toggle="dropdown" >More 
                            <i class="fa fa-angle-down" ></i></a>
                        <div class="dropdown-menu position-absolute"  id="show_more">
                           
                             
                                    <a href="" class="dropdown-item"><i class="fa fa-phone" style="font-size:25px;color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp; <span>24*7 Customer Care</span></a>
                                
                        </div>
                    </div>

                </div>
                <div class="col-sm-2" >
                    <a href="#" style="color:white" >
                        <span style="font-size:20px" data-toggle="modal" data-target="#myModal1"> Become a Seller</span> 

                    </a>
                </div>    

                <div class="col-sm-1" >

                    <a  href="ucart.jsp"style="cursor:pointer" >
                        
                         <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                        
                    </a>
                </div>
            </div>
        </div>
</nav>
                    <div class="container-fluid">
            <div class="row" id="card">



                <%
                    String category_code_for_filter = "";
                    String category_name_for_filter = "";
                    String sub_name_for_filter = "";
                    try {
                        int status = 1;
                        int sr = 1;
                        String album_code = " ";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select *  from category where status=" + status + " limit 0,6 ");
                        while (rs.next()) {


                            String cat_name = rs.getString("cat_name");
                            String cat_code = rs.getString("cat_code");



                %>

                <div class="col-sm-2"     > 

                   <!--- <img src="category_photos/<%=sr%>.webp" style="height:50px;" class="img-responsive"> --->
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
             <section> 
              <div class="container-fluid">

            <div class="row" style="margin-top:2%;">
                
                <div class="col-sm-3 card" >
                     
                    <div class="row">
                        <div class="col-sm-8"  >

                            <h6 style="color:black;margin-top:2%">FILTER</h6>

                            <div class="row">
                                <div class="col-sm-12" id="show_filter_result">

                                </div>


                            </div>
                        </div>
                        <div class="col-sm-4" id="clear_all_filter" >

                        </div>

                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4"></div>
                        <div class="col-sm-12"  style="height:20px;"></div>
                        <div class="col-sm-12" style="margin-top:5%">

                            <h6 style="color:black">CATEGORIES</h6>


                        </div>
                        <div class="col-sm-12">
                            <%

                                ResultSet rs3 = st2.executeQuery("select *  from sub_category where sub_name='" + sub_cat_for_search + "'  ");
                                if (rs3.next()) {

                                    category_code_for_filter = rs3.getString("cat_code");

                                }
                                ResultSet rs4 = st2.executeQuery("select *  from category where cat_code='" + category_code_for_filter + "' ");
                                if (rs4.next()) {

                                    category_name_for_filter = rs4.getString("cat_name");

                                }





                            %>

                            <a href="#" class="nav-link" data-toggle="dropdown" style="color:black"   ><span id=""><%=category_name_for_filter%></span>
                                <i class="fa fa-angle-right" ></i></a> 
                            <div class="dropdown-menu"  style="background-color:white">
                                <%
                                    ResultSet rs5 = st2.executeQuery("select *  from sub_category where cat_code='" + category_code_for_filter + "' ");
                                    while (rs5.next()) {

                                        sub_name_for_filter = rs5.getString("sub_name");



                                %>
                                <div class="col-sm-12">
                                    <a href="viewall.jsp?cid=<%=sub_name_for_filter%>"style="color:black" ><%=sub_name_for_filter%></a>
                                </div>



                                <%
                                    }
                                %>

                            </div>

                        </div>   

                        <%
                            } catch (Exception e) {
                            }



                        %>

                        <div class="col-sm-12" style="margin-top:8%">
                            <h6 style="cursor:pointer;color:black"><%=sub_cat_for_search%></h6>
                        </div>
                            <%
           if(sub_cat_for_search.equals("Laptops")){
            
            
            %>
                        <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">20000</i></option>
                                <option><i class="fa fa-rupee">25000</i></option>
                                <option><i class="fa fa-rupee">30000</i></option>
                                <option><i class="fa fa-rupee">35000</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">75000</i></option>
                                <option><i class="fa fa-rupee">60000</i></option>
                                <option><i class="fa fa-rupee">50000</i></option>
                                <option><i class="fa fa-rupee">40000</i></option>

                            </select>

                        </div>
                                       <%
           }
          else if(sub_cat_for_search.equals("Washing Machines")){
            
            
            %>
                        <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">10000</i></option>
                                <option><i class="fa fa-rupee">15000</i></option>
                                <option><i class="fa fa-rupee">20000</i></option>
                                <option><i class="fa fa-rupee">25000</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">55000</i></option>
                                <option><i class="fa fa-rupee">50000</i></option>
                                <option><i class="fa fa-rupee">40000</i></option>
                                <option><i class="fa fa-rupee">35000</i></option>

                            </select>

                        </div>
                        
                        <%
           
           }
           else{
               
               
               
               
               
               %>
             
                <div class="col-sm-12" style="margin-top:5%">

                            <select id="min_price" >
                                <option><i class="fa fa-rupee">MIN</i></option>
                                <option><i class="fa fa-rupee">200</i></option>
                                <option><i class="fa fa-rupee">300</i></option>
                                <option><i class="fa fa-rupee">400</i></option>
                                <option><i class="fa fa-rupee">500</i></option>
                            </select>


                            <label>
                                to
                            </label>


                            <select id="max_price">
                                <option><i class="fa fa-rupee">2000</i></option>
                                <option><i class="fa fa-rupee">1500</i></option>
                                <option><i class="fa fa-rupee">1200</i></option>
                                <option><i class="fa fa-rupee">1000</i></option>

                            </select>

                        </div>
               
               
               
               
               
               
               <%
               
               
               
           }
               
               
               
               %>
                        <div  class="col-sm-12" style="margin-top:5%">
                            <h6>CUSTOMER RATING</h6>
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="4">&nbsp;4&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="3">&nbsp;3&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="2">&nbsp;2&nbsp;<i class="fa fa-star"></i>&nbsp;&above
                        </div>
                        <div  class="col-sm-12">
                            <input type="checkbox" name="1">&nbsp;1&nbsp;<i class="fa fa-star"></i>&nbsp;&above

                        </div>
                    </div>


                </div>
                 
                <div  class="col-sm-9 card" style="margin-left:-10px;">
                    <div id="filter_result_show">
                    <div class="row">
                        <%

                            String product_code = "";
                            String title = "";
                            String product_price = "";
                            String description = "";
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                                Statement st = cn.createStatement();
                                Statement st1 = cn.createStatement();
                                Statement st2 = cn.createStatement();
                                if (sub_cat_for_search.equals("Laptops")||sub_cat_for_search.equals("Washing Machines")) {
                                    ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_cat_for_search + "' AND status='1'ORDER BY RAND()");
                                    while (rs.next()) {
                                        flag = 1;
                                        product_code = rs.getString("product_code");
                                        title = rs.getString("title");
                                        description = rs.getString("des");
                                        String des[] = description.split(",");
                                        ResultSet rs1 = st1.executeQuery("select  price from product_list where product_code='" + product_code + "' AND status='1'");
                                        if (rs1.next()) {
                                            product_price = rs1.getString("price");
                                        }
                        %>

                        <div class="col-sm-3"  style="margin-top:1%">

                            <div class="row">

                                <div class="col-sm-12"   >
                                    <%
                                         if (sub_cat_for_search.equals("Washing Machines")) {
                                        
                                        %>

                                    <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="margin-top:3%;height:150px" class="img-fluid">
                                    <%
                                         }  
                                         else{
                                             %>
                                             
                                             <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="margin-top:3%;" class="img-fluid">
                                             
                                             <%
                                             
                                         }
                                             
                                             %>
                                    <div class="row">


                                        <div class="col-sm-12 hide" id="hide-<%=product_code%>">
                                            <span>Size</span>
                                        </div>   
                                        <%
                                            String product_size = "";

                                            ResultSet rs2 = st2.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1'");
                                            while (rs2.next()) {
                                                product_size = rs2.getString("size");




                                        %>

                                        <div class="col-sm-3 show-<%=product_code%>"  id="product_show"  >

                                            <h6 class="size"> <%=product_size%></h6>

                                        </div>
                                        <%

                                            }



                                        %>



                                    </div>

                                </div>

                            </div>
                            <div  class="col-sm-12" style="height:40px">

                            </div>



                        </div>
                        <div class="col-sm-7" style="margin-top:1%">
                            <div class="col-sm-12" >
                                <h6> <a href="viewproduct.jsp?v=<%=product_code%>" > <%=title%></a></h6>
                            </div>
                            <div class="col-sm-12" >
                                <%
                                    for (int i = 0; i < des.length; i++) {

                                %>
                                <li style="font-size:14px;color:black"> <%=des[i]%></li>  
                                    <%

                                        }

                                    %>
                            </div>

                            <!--<div class="col-sm-12" >
                                <h6> <i class="fa fa-rupee"></i><%=product_price%></h6>
                            </div>  --->       
                        </div>
                        <div class="col-sm-2"  style="margin-top:1%">
                            <div class="col-sm-12" >
                                <h6 style="font-size:20px"> <i class="fa fa-rupee"></i><%=product_price%></h6>
                            </div>
                        </div>
                        <div  class="col-sm-12" style="height:1px;background-color:#F1F2F4">

                        </div>




                        <%


                            }
                        } else {
                                    
                            ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_cat_for_search + "' AND status='1'ORDER BY RAND()");
                            while (rs.next()) {
                                flag = 1;
                                product_code = rs.getString("product_code");
                                title = rs.getString("title");
                                ResultSet rs1 = st1.executeQuery("select  price from product_list where product_code='" + product_code + "' AND status='1'");
                                if (rs1.next()) {
                                    product_price = rs1.getString("price");
                                }


                        %>


                        <div class="col-sm-4">

                            <div class="row" style="margin-left:10px;margin-right:10px">

                                <div class="col-sm-12 lg" id="" rel="<%=product_code%>" style="height:300px;" >


                                    <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="display:inline-block;height:250px;margin-top:3%"  class="img-fluid">

                                    <div class="row">

                                        <div class="col-sm-12" >
                                            <h6> <a href="viewproduct.jsp?v=<%=product_code%>" > <%=title%></a></h6>
                                        </div>

                                        <div class="col-sm-12" >
                                            <h6> <i class="fa fa-rupee"></i><%=product_price%></h6>
                                        </div>
                                        <div class="col-sm-12 hide" id="hide-<%=product_code%>">
                                            <span>Size</span>
                                        </div>   
                                        <%
                                            String product_size = "";

                                            ResultSet rs2 = st2.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1'");
                                            while (rs2.next()) {
                                                product_size = rs2.getString("size");




                                        %>

                                        <div class="col-sm-3 show-<%=product_code%>"  id="product_show"  >

                                            <h6 class="size"> <%=product_size%></h6>

                                        </div>
                                        <%

                                            }



                                        %>



                                    </div>

                                </div>

                            </div>
                            
                       <div  class="col-sm-12" style="height:70px">

                            </div>


                        </div>







                        <%
                                }
                            if(flag==0){
                            %>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9">
                                <img src="offer-icon/03494b209a1511a61868ced337b97931.webp">
                            </div>
                            
                            <%
                            }
                                }
                        %>
                    </div>

                    <%
                        } catch (Exception e) {
                        }





                    %>
</div>
                </div>

            </div>
        </div>
        <%
            if (flag == 0) {
        %>


        <%                                }



        %>


             </section>
        





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
          
            <%


            //response.sendRedirect("index.jsp");
        }




    %>
</html>