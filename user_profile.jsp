<%-- 
    Document   : user_profile
    Created on : 3 Apr, 2022, 1:10:46 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        String email = null;
        String link = "";
        int rd = 0;
        int flag=0;
        Cookie c[] = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("user")) {
                email = c[i].getValue();
            }
        }

        if (email != null) {
            if (request.getParameter("link").length() == 0) {
            } else {

                link = request.getParameter("link");
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
        <link href="css/style.css" rel="stylesheet">
        <script src="jquery-3.6.0.min.js"></script>
        <style>
            #card{


                box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);



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
            body{

                font-family: Arial, Helvetica, sans-serif; 
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
                $("#name_edit").on("click", function() {
                    var text = $("#name").text();
                    $("#name_set").html("<input type='text' class='form-control' id='set_name'>");
                    $("#set_name").val(text);
                    $("#name_edit").html("<button class='btn btn-success' id='success'>Save</button>");

                    $("#success").on("click", function() {
                        var name = $("#set_name").val();
                        $.post(
                                "update_name.jsp", {name: name}, function(data) {
                            $("#name_set").html("<b> <span id='name'></span></b>");
                            $("#name").text(name);
                            $("#name_edit").html("<i class='fa fa-edit'>Edit</i>");
                            $("#profile").text(name);
                            $("#Upper_profile").html("<div class='nav-item dropdown' style='color:white'><a  style='cursor:pointer' data-toggle='dropdown' id='drop_profile' >" + name + "<i class='fa fa-angle-down'style='padding:10px'></i></a><div class='dropdown-menu position-absolute'><a href='user_profile.jsp' class='dropdown-item'><i class='fa fa-user'>My Profile</i></a><a href='' class='dropdown-item'><i class='fa fa-heart'>Wish-List</i></a><a href='' class='dropdown-item'><i class='fa fa-sign-out'>Logout</i></a></div> </div>");








                        }
                        );
                    });

                });
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
                $(".fa.fa-trash").on("click",function(){
                    
                   var product_code=$(this).attr("id");
                   var sn=$(this).attr("rel");
                   $.post(
                       "fav_product.jsp",{product_code:product_code},function(data){
                           $("#"+sn).fadeOut();
                          var count= $("#wishlist-count").text();
                          $("#wishlist-count").text(parseInt(count)-1);
                          if(parseInt(count)-1==0){
                              $("#empty-wishlist").load("emptywishlist.jsp");
                              
                          }
                           
                    
                       }
            
            
                   );
                    
                });

            });





        </script>
    </head>

    <body style="background-color:#F5F5F5">
        <!-- Topbar Start -->
        <nav class="navbar sticky-top" style="background-color:#3392F3;">

          
           
                   <a href="dashboard.jsp"  > <h4 style="color:white;font-family:AR BERKLEY">Flipkart</h4></a>
                  <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
           
            <div class="col-sm-4" >

                <div class="input-group" style="background-color:white">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"  style="color:#3392F3"></i>
                        </span>
                    </div>
                </div>

            </div>
            <%
                int addtocart = 0;
                String name = " ";
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
                <div class="nav-item dropdown" style="color:white">
                    <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown" id="profile"><%=name%>
                        <i class="fa fa-angle-down" style="padding:10px"></i></a>
                    <div class="dropdown-menu position-absolute"  id="show_login">
                        <div class="row">
                            <div class="col-sm-12">
                                <a href="user_profile.jsp?link=home_account" class="dropdown-item"><i class="fa fa-user-circle-o" style="color:#3392F3">&nbsp;&nbsp;&nbsp;&nbsp;</i>My Profile</a>
                            </div>
                            <div class="col-sm-12">
                                <a href="user_profile.jsp?link=home_wishlist" class="dropdown-item"><i class="fa fa-heart" style="color:#3392F3">&nbsp;&nbsp;&nbsp;&nbsp;</i>Wish-List</a>
                            </div>
                            <div class="col-sm-12">
                                <a href="logout.jsp" class="dropdown-item"><i class="fa fa-sign-out" style="color:#3392F3">&nbsp;&nbsp;&nbsp;&nbsp;</i>Logout</a>
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
                            <div class="col-sm-12"><a href="seller_register.jsp" class="dropdown-item"><i class="fas fa-store fa-lg" style="color:#3392F3"></i>
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

                <a  href="ucart.jsp" >
                    <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                    <span class="fa-stack fa" data-count="<%=addtocart%>"></span>
                </a>
            </div>
        </div>
    </div>
</nav>
<!-- Topbar End -->
<!-- Navbar Start -->
<div class="container-fluid" >
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

        <div class="col-sm-2" style="background-color:white"    > 

                   <!-- <img src="category_photos/<%=sr%>.webp" style="height:50px;" class="img-responsive">--> 
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

<div class="container-fluid" style="background-color:#F5F5F5;" >

    <div class="row"  >                                  

        <div class="col-sm-3 card" style="padding:20px;margin-top:2%;margin-left:4%;height:860px">
            <div class="row">
                <div class="col-sm-12 card" style="height:80px;width:50px">
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="category_photos/profile-pic-male_4811a1.svg" style="height:70px;margin:5px">
                        </div>
                        <div class="col-sm-9" style="margin-top:10%"><span style="color:black;"> Hello,</span>
                            <span style="color:black;" id="profile"><%=name%></span>
                        </div>


                    </div>
                </div>
            </div>
            <div class="row" style="margin-top:3%">
                <div class="col-sm-12 card" style="height:200px">

                    <div class="row">
                        <!-----Acount Setting Part start--->
                        <div class="col-sm-2" style="margin-top:9%">
                            <i class="fa fa-user" style="font-size:30px;color:blue"></i>
                        </div>
                        <div class="col-sm-8" style="margin-top:10%" id="account">
                            <span style="color:black;">ACCOUNT SETTINGS</span>
                        </div>
                        <div class="col-sm-2" style="margin-top:10%">
                            <i class="fa fa-angle-right" style="font-size:20px;cursor:pointer"  id="account"></i>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F5F5F5"></div>
                        <div class="col-sm-12" style="height:10px;"></div>
                        <!-----Acount Setting Part End--->
                        <div class="col-sm-2">1.</div>
                        <div class="col-sm-10">
                            <h6 id="pan" style="cursor:pointer">Profile Information</h6> 


                        </div>
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Manage Address Part start--->
                        <div class="col-sm-2">2.</div>
                        <div class="col-sm-10" >
                            <h6 id="address" style="cursor:pointer">Manage Addresses</h6> 


                        </div>
                        <!-----Manage Address Part End--->  
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Pan Card Part start--->

                        <div class="col-sm-2">3.</div>
                        <div class="col-sm-10">
                            <h6 id="pan" style="cursor:pointer">PAN Card Information</h6> 


                        </div>
                        <!-----Pan Card Part end--->   
                        <div class="col-sm-12" style="height:10px;"></div>


                    </div>


                </div>
            </div>
            <!-----Payment Setting Part start--->
            <div class="row" style="margin-top:3%">
                <div class="col-sm-12 card" style="height:200px">

                    <div class="row">

                        <div class="col-sm-2" style="margin-top:9%">
                            <i class="fa fa-google-wallet" style="font-size:30px;color:blue"></i>
                        </div>
                        <div class="col-sm-8" style="margin-top:10%" id="account">
                            <span style="color:black;">Payments</span>
                        </div>
                        <div class="col-sm-2" style="margin-top:10%">
                            <i class="fa fa-angle-right" style="font-size:20px;cursor:pointer"  id="account"></i>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F5F5F5"></div>
                        <div class="col-sm-12" style="height:10px;"></div>
                        <!-----Acount Setting Part End--->
                        <div class="col-sm-2">1.</div>
                        <div class="col-sm-10">
                            <h6 id="pan" style="cursor:pointer">Gift Card</h6> 


                        </div>
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Manage Address Part start--->
                        <div class="col-sm-2">2.</div>
                        <div class="col-sm-10" >
                            <h6 id="address" style="cursor:pointer">Saved UPI</h6> 


                        </div>
                        <!-----Manage Address Part End--->  
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Pan Card Part start--->

                        <div class="col-sm-2">3.</div>
                        <div class="col-sm-10">
                            <h6 id="pan" style="cursor:pointer">Saved Cards</h6> 


                        </div>
                        <!-----Pan Card Part end--->   
                        <div class="col-sm-12" style="height:10px;"></div>


                    </div>


                </div>
            </div>
            <!--- Stuff Part start-->
            <div class="row" style="margin-top:3%">
                <div class="col-sm-12 card" style="height:200px">

                    <div class="row">

                        <div class="col-sm-2" style="margin-top:9%">
                            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="19" viewBox="0 0 23 19"><g fill="none" fill-rule="evenodd"><path fill="#2874F0" fill-rule="nonzero" d="M20.5 2.75h-9L9.25.5H2.5A2.247 2.247 0 0 0 .26 2.75l-.01 13.5A2.257 2.257 0 0 0 2.5 18.5h18a2.257 2.257 0 0 0 2.25-2.25V5a2.257 2.257 0 0 0-2.25-2.25zm-5.625 3.375a2.257 2.257 0 0 1 2.25 2.25 2.257 2.257 0 0 1-2.25 2.25 2.257 2.257 0 0 1-2.25-2.25 2.257 2.257 0 0 1 2.25-2.25zm4.5 9h-9V14c0-1.496 3.004-2.25 4.5-2.25s4.5.754 4.5 2.25v1.125z"/><path d="M-2-4h27v27H-2z"/></g></svg>
                        </div>
                        <div class="col-sm-8" style="margin-top:10%" id="account">
                            <span style="color:black;">STUFF</span>
                        </div>
                        <div class="col-sm-2" style="margin-top:10%">
                            <i class="fa fa-angle-right" style="font-size:20px;cursor:pointer"  id="account"></i>
                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:#F5F5F5"></div>
                        <div class="col-sm-12" style="height:10px;"></div>
                        <!-----Acount Setting Part End--->
                        <div class="col-sm-2">1.</div>
                        <div class="col-sm-10">
                            <h6 id="pan" style="cursor:pointer">My Coupons</h6> 


                        </div>
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Manage Address Part start--->
                        <div class="col-sm-2">2.</div>
                        <div class="col-sm-10" >
                            <h6 id="address" style="cursor:pointer">My Reviews & Ratings</h6> 


                        </div>
                        <!-----Manage Address Part End--->  
                        <div class="col-sm-12" style="height:10px;"></div>

                        <!-----Pan Card Part start--->

                        <div class="col-sm-2">3.</div>
                        <div class="col-sm-10">
                            <%
                            if (link.equals("home_wishlist")) {
                            
                            %>
                            <div class="row">
                                <div class="col-sm-12" >
                                    
                               
                            <h6 id="pan" style="cursor:pointer;"><a href="user_profile.jsp?link=home_wishlist">My Wishlist</a></h6> 
                            </div>
                            </div>
                            
                            <%
                            }
                            else{
                             %>

                              <h6 id="pan" style="cursor:pointer"><a href="user_profile.jsp?link=home_wishlist">My Wishlist</a></h6> 
                             
                             <%
                                
                                
                            } 
                                
                                %>
                        </div>
                        <!-----Pan Card Part end--->   
                        <div class="col-sm-12" style="height:10px;"></div>


                    </div>


                </div>
            </div>
            <!--- Stuff Part End-->
            <div class="row" style="margin-top:3%">
                <div class="col-sm-12 card" style="height:80px;width:50px">
                    <div class="row">
                        <div class="col-sm-3" style="margin-top:10%">
                            <i class="fa fa-sign-out" style="color:blue;font-size:20px"></i>
                        </div>
                        <div class="col-sm-9" style="margin-top:10%">
                            <a href="logout.jsp"><span style="color:black;">Logout</span></a>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        
        <!--- Personal info Start--->
        <%
            if (link.equals("home_account")) {


        %>
        <div class="col-sm-8 card" style="color:black;margin-top:2%;overflow:scroll;margin-left:1%">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-6" style="margin-top:4%"><h6>Personal Information</h6></div>
                <div class="col-sm-5">

                </div>
            </div>
            <div class="row" style="margin-top:3%">
                <div class="col-sm-1"></div>
                <div class="col-sm-4" style="height:30px;color:black" id="name_set">
                    <b> <span id="name"><%=name%></span></b>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4" >
                    <h6><a  style="color:blue;cursor:pointer" ><span  id="name_edit"><i class="fa fa-edit">Edit</i></span></a></h6>
                </div>
                <div class="col-sm-1">

                </div>
            </div>
            <!---Email Part start--->
            <div class="row" style="margin-top:4%">
                <div class="col-sm-1"></div>
                <div class="col-sm-6"><h6>Email Address</h6></div>
                <div class="col-sm-5">

                </div>
                <div class="col-sm-1">

                </div>
            </div> 
            <div class="row" style="margin-top:3%">
                <div class="col-sm-1"></div>
                <div class="col-sm-4" style="height:40px;color:black" id="email_set">
                    <b> <span id="email" ><%=email%></span></b>
                </div>
                <div class="col-sm-1"></div>
                <!-- password change  modal start!--->                                              
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Change Password</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="login-form">
                                    <form action="password_change.jsp"  method="post">
                                        <div class="form-group">
                                            <label>Current Password:</label>
                                            <input type="password"  name="password"class="form-control"required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>New password:</label>
                                            <input type="password"  name="npass"class="form-control"required="required">
                                        </div>

                                        <div class="form-group">
                                            <label>Retype Password:</label>
                                            <input type="password" name="rpass" class="form-control"  required="required">
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-danger btn-block">Save</button>
                                        </div>

                                    </form>

                                </div>

                            </div>



                        </div>




                    </div>
                </div>
                <!---password change modal end-->
                <div class="col-sm-4">
                    <h6><a  style="color:blue;cursor:pointer" data-toggle="modal" data-target="#myModal"><span><i class="fa fa-key">Change password</i></span></a></h6>

                </div>
                <div class="col-sm-1"></div>
            </div><!----- Email Part End--->
            <!---
            Faq Question Start--->
            <div class="row" style="margin-top:3%">
                <div class="col-sm-1"></div>
                <div class="col-sm-11">
                    <h6>FAQs</h6></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-11">
                    <p><h6>What happens when I update my email address (or mobile number)?</h6></p>
                    <p>  Your login email id (or mobile number) changes, likewise. You'll receive all your account related communication on your updated email address (or mobile number).
                    </p>
                    <p> <h6>  When will my E-Shop account be updated with the new email address (or mobile number)?</h6></p>
                    <p>It happens as soon as you confirm the verification code sent to your email (or mobile) and save the changes.</p>

                    <p> <h6> What happens to my existing E-Shop account when I update my email address (or mobile number)?</h6></p>
                    <p> Updating your email address (or mobile number) doesn't invalidate your account. Your account remains fully functional. You'll continue seeing your Order history, saved information and personal details.
                    </p>

                    <p> <h6> Does my Seller account get affected when I update my email address?</h6></p>
                    <p>  E-Shop has a 'single sign-on' policy. Any changes will reflect in your Seller account also.</p>
                </div>

            </div>
            <!---- Faq Question End
               ----->
        </div>
        <%
        } else if (link.equals("home_wishlist")) {



        %>
        
        <div class="col-sm-8 card" style="color:black;margin-top:2%;margin-left:1%;height:auto">
          <div id="empty-wishlist">  

            <%
                int count = 0;
                String product_code = "";
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                    Statement st = cn.createStatement();
                    Statement st1 = cn.createStatement();
                    Statement st2 = cn.createStatement();
                    ResultSet rs = st.executeQuery("select count(*) from fav_product where email='" + email + "'");
                    if (rs.next()) {
                        count = rs.getInt(1);
                        flag=1;
                    }
                    if(count!=0){
            %>

            <div class="row" style="margin-top:3%">
                <div class="col-sm-12">
                    <h4>My Wishlist(<span id="wishlist-count"><%=count%></span>)</h4>
                </div>
                <div class="col-sm-12" style="height:1px;background-color:#F1F2F4">

                </div>
            </div>


            <%
                String title = "";
                String price = "";
                int offer_price=0;
                int sn=0;
                ResultSet rs1 = st.executeQuery("select * from fav_product where email='" + email + "'");
                while (rs1.next()) {
                    product_code = rs1.getString("product_code");
                    ResultSet rs2 = st1.executeQuery("select * from product where product_code='" + product_code + "' AND status='1'");
                    if (rs2.next()) {
                        title = rs2.getString("title");

                    }
                    ResultSet rs3 = st2.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1'");
                    if (rs3.next()) {
                        price = rs3.getString("price");

                    }
                     offer_price=Integer.parseInt(price)*40/100;
                     offer_price=offer_price+Integer.parseInt(price);
            %>
            <div class="row" style="margin-top:3%;"id="<%=sn%>" >
                
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2" >
                            <img src="product_photos/<%=product_code%>_1.jpg" class="img-fluid"  alt="img"/>
                        </div>
                        <div class="col-sm-10">

                            
                            <div class="row" >
                                
                                <div class="col-sm-10">
                                  <a href="viewproduct.jsp?v=<%=product_code%>">  <span><%=title%></span></a>
                                </div>
                                <div class="col-sm-2">
                                    <i class="fa fa-trash" id="<%=product_code%>" rel="<%=sn%>"></i>
                                </div>
                              <div class="col-sm-12">
                                  <span><i class="fa fa-rupee" style="font-size:20px"><%=price%></i>&nbsp;&nbsp;<i class="fa fa-rupee" style="color:gray"><s ><%=offer_price%></s></i></span>
                                </div> 
                                 <div class="col-sm-12">
                                     <div class="row">
                                         <div class="col-sm-1 card"style="background-color:green;margin-left:2%">
                                             <span style="color:white;font-size:10px">4 <i class="fa fa-star" ></i></span>
                                         </div>
                                         
                                         <div class="col-sm-10">
                                             
                                         </div>
                                     </div>
                                 </div> 

                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-sm-12" style="height:20px">

                </div>
                 <div class="col-sm-12" style="height:1px;background-color:#F1F2F4">

                </div>
                <div class="col-sm-12" style="height:20px">

                </div>
                                
            
            </div>





            <%
                 
                sn++;
                }


                }
                    else{
                        %>
                        
                        
                       
        <div class="row">
        <div class="col-sm-4">
            
        </div>
        <div class="col-sm-8">
                <img src="offer-icon/empty.webp" style="height:200px;width:250px;margin-top:15%">
                <div class="row">
                    <div class="col-sm-6">
                         <center><h3>Empty Wishlist</h3></center>
                    </div>
                    <div class="col-sm-6">
                        
                    </div>
                </div>
                       
                <div class="row">
                    <div class="col-sm-6">
                          <center><h6>You have no items in your wishlist. Start adding!</h6></center>
                   
                    </div>
                    <div class="col-sm-6">
                        
                    </div>
                </div>
                  
                       
        </div>
    </div>
           
                        
                        
                        
                        <%
                        
                        
                        
                        
                        
                        
                }
                }
                catch (Exception e) {
                }

       




            %> 






        </div>
        </div>
            <%
        }
                
                
                
                %>


       
                      
                    
               
      
       
        <!---- Personal info End--->
        
        <div class="col-sm-1">

        </div>
        <div class="col-sm-12" style="height:50px;background-color:#F5F5F5"></div>
    </div>



</div>




<!-- Subscribe Start -->

<!-- Subscribe End -->




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
    } else {


        response.sendRedirect("index.jsp");
    }




%>
</html>