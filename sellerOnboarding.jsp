<%-- 
    Document   : sellerOnboarding
    Created on : 8 Apr, 2022, 10:46:39 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        String email = null;
        String user_code = "";
        Cookie c[] = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("seller")) {
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
            #gst{

                width:80%;
                display: inline-block; 
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #first{
                display:none;
            }
            #first1{
                display:none;
            }






        </style>
        <script>

            $(document).ready(function() {
                $(".hide").hide();
                $(".fa.fa-minus-square").hide();
                $("#col_listing").mouseover(function() {
                    $("#listing").show();


                });
                $("#col_listing").mouseout(function() {
                    $("#listing").hide();


                });
                $("#col_inventroy").mouseover(function() {
                    $("#inventroy").show();

                });
                $("#col_inventroy").mouseout(function() {
                    $("#inventroy").hide();

                });
                $("#col_order").mouseover(function() {
                    $("#order").show();

                });
                $("#col_order").mouseout(function() {
                    $("#order").hide();

                });
                $("#col_payment").mouseover(function() {
                    $("#payment").show();

                });
                $("#col_payment").mouseout(function() {
                    $("#payment").hide();

                });
                $("#col_growth").mouseover(function() {
                    $("#growth").show();

                });
                $("#col_growth").mouseout(function() {
                    $("#growth").hide();

                });
                $("#shop_save").on("click", function() {
                    var shop_name = $("#shop_name").val();
                    var shop_des = $("#shop_des").val();
                    var seller_code = $(this).attr("rel");

                    $.post(
                            "add_shop_details.jsp", {shop_name: shop_name, shop_des: shop_des, seller_code: seller_code}, function(data) {

                        $("#shop_name").val(shop_name);
                        $("#shop_name").css("background-color", "#F1F2F4");
                        $("#shop_des").val(shop_des);
                        $("#shop_save").hide();
                        if (data.trim() === "inserted") {
                            $("#edit_icon").html("<i class='fa fa-edit' style='color:blue;cursor:pointer'>Edit</i>");
                            $("#show").html("<div class='alert alert-info alert-dismissible'><a  style='cursor:pointer'class='close' data-dismiss='alert' aria-label='close'>&times;</a>Data Saved</div>");

                        }

                        $(".fa.fa-edit").on("click", function() {
                            $("#shop_save").show();
                            $("#shop_save").css("background-color", "#CB4154");
                            $("#shop_save").val("Save Changes");

                        });
                        if (data.trim() === "updated") {
                            $("#show").html("<div class='alert alert-success alert-dismissible'><a  style='cursor:pointer'class='close' data-dismiss='alert' aria-label='close'>&times;</a>Data Updated</div>");

                        }
                    });

                });
                $(".fa.fa-edit").on("click", function() {
                    var rel = $(this).attr("rel");
                    $("#save_changes").html("<input type='button' style='background-color:#CB4154'  rel='' id='shop_save' value='Save Changes'>");
                    $("#shop_save").attr("rel", rel);
                    $("#shop_save").on("click", function() {
                        var shop_name = $("#shop_name").val();
                        var shop_des = $("#shop_des").val();
                        var seller_code = $("#shop_save").attr("rel");

                        $.post(
                                "add_shop_details.jsp", {shop_name: shop_name, shop_des: shop_des, seller_code: seller_code}, function(data) {

                            $("#show").html("<div class='alert alert-success alert-dismissible'><a  style='cursor:pointer'class='close' data-dismiss='alert' aria-label='close'>&times;</a>Data Updated</div>");

                            $("#shop_name").val(shop_name);
                            $("#shop_name").css("background-color", "#F1F2F4");
                            $("#shop_des").val(shop_des);
                            $("#shop_save").hide();
                            $("#check_info_name").html(" ");
                            $("#check_info_des").html(" ");





                        });

                    });



                });
                $("#list").on("click", function() {
                    var shop_name = $("#shop_name").val();
                    var shop_des = $("#shop_des").val();
                    if (shop_name.length > 0 && shop_des.length > 0) {
                        $("#add_listing").load("new_listing.jsp");
                        $("#check_info_name").html("");
                        $("#check_info_des").html("");
                    }
                    else if (shop_name.length <= 0 || shop_des.length <= 0) {
                        $("#check_info_name").html("<span style='color:red'>This field can't be empty</span>");
                        $("#check_info_des").html("<span style='color:red'>This field can't be empty</span>");

                    }
                });
                $("#approval_request").on("click", function() {
                    $("#myModal").modal();

                });
                $(".fa.fa-plus-square").on("click", function() {

                    var code = $(this).attr("id");
                    
                    $("#list_"+code).fadeIn(1000);
                    //$(this).removeClass("fa fa-plus-square");
                     //alert($("#"+code).attr("class"));
                    // $(this).attr("class", "fa fa-minus-square"); 
                    // $(this).attr("class", "y");

                   // alert($("#" + code).attr("class"));
                   $(this).hide();
                   $("#minus-"+code).show();
                   

                });
                 $(".fa.fa-minus-square").on("click", function() {
                     
                       var code = $(this).attr("rel");
                          
                        $("#list_"+code).hide();
                        //$(this).removeClass("fa fa-minus-square");
                        //$("#"+code).attr("class", "fa fa-plus-square");
                        //alert($("#" + code).attr("class"));
                        $(this).hide();
                        $("#"+code).show();

                 });
                /**/
            });



        </script>


    </head>

    <body >
        <!-- Topbar Start -->
        <nav class="navbar sticky-top" style="background-color:#3392F3;">
        

                <%            String user_email = "";
                    String user_name = "";
                    String seller_code = "";
                    String account_number = "";
                    String account_holder_name = "";
                    String ifsc = "";

                    String bank_name = "";
                    String city = "";
                    String state = "";
                    String branch = "";


                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from dealer where seller_email='" + email + "'");
                        if (rs.next()) {


                            user_email = rs.getString("seller_email");
                            user_name = rs.getString("user_name");
                            seller_code = rs.getString("user_code");
                            ResultSet rs1 = st1.executeQuery("select * from bank where seller_code='" + seller_code + "'");
                            if (rs1.next()) {
                                ifsc = rs1.getString("ifsc");
                                account_number = rs1.getString("account_number");
                                account_holder_name = rs1.getString("account_holder");
                            }
                            ResultSet rs2 = st2.executeQuery("select * from ifsc where ifsc='" + ifsc + "'");
                            if (rs2.next()) {
                                bank_name = rs2.getString("bank_name");
                                state = rs2.getString("state");
                                city = rs2.getString("city");
                                branch = rs2.getString("branch_name");
                            }





                %>
                 
                <div class="col-sm-1"  >
                    <a href="#" style="color:white">Welcome</a>
                </div> 
                <div class="col-sm-1"  id="col_listing" >
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">
                        <a href="#" data-toggle="dropdown" style="color:white">Listing<i class="fa fa-angle-down" >         
                            </i> </a>

                        <div class="dropdown-menu position-absolute" style="background-color:white" id="listing">

                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">My Listing</a>
                                </div>

                                <div class="col-sm-12">
                                    <a style="cursor:pointer" class="dropdown-item" id="list"> Add new Listing</a>
                                </div>
                                <div class="col-sm-12">
                                    <a style="cursor:pointer"  id="approval_request" class="dropdown-item">Track approval request</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">My audits</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-sm-1"  id="col_inventroy">
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">
                        <a href="#" data-toggle="dropdown" style="color:white">Inventroy<i class="fa fa-angle-down" >         
                            </i> </a>

                        <div class="dropdown-menu position-absolute" id="inventroy">

                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Inventroy health</a>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-sm-1"   id="col_order">
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">
                        <a href="#" data-toggle="dropdown" style="color:white">Orders<i class="fa fa-angle-down" >         
                            </i> </a>

                        <div class="dropdown-menu position-absolute"  style="background-color:white"id="order">

                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Active orders</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Return orders</a>
                                </div>

                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Cancellation</a>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
               
                <div class="col-sm-1"   id="col_growth">
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">
                        <a href="#" data-toggle="dropdown" style="color:white">Growth<i class="fa fa-angle-down" >         
                            </i> </a>

                        <div class="dropdown-menu position-absolute" style="background-color:white" id="growth">

                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Growth Central</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Perfromance Overview</a>
                                </div>

                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Earn More</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Returns</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Cancellations</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">My Freebies</a>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
                 <div class="col-sm-2"  id="col_payment">
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">
                        <a href="#" data-toggle="dropdown" style="color:white">Payments<i class="fa fa-angle-down" >         
                            </i> </a>

                        <div class="dropdown-menu position-absolute" style="background-color:white" id="payment">

                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Payment Overview</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Pervious payment</a>
                                </div>

                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Transaction</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Invoice</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Statements</a>
                                </div>
                                <div class="col-sm-12">
                                    <a href="" class="dropdown-item">Seller Protection Fund(SPF)</a>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
              


                <div class="col-sm-2" >
                    <div class="nav-item dropdown" style="color:white;cursor:pointer">

                        <i class="fa fa-user-circle-o" style="font-size:25px;padding:5px"></i>


                        <span data-toggle="dropdown" style="font-size:15px"><%=user_email%></span>

                        <div class="dropdown-menu position-absolute" style="background-color:white">

                            <a href="seller_logout.jsp" class="dropdown-item"><i class="fa fa-sign-out">Logout</i></a>
                        </div>



                    </div>
                </div>

        </nav>
                <%
                        }
                    } catch (Exception e) {
                    }




                %>  
            </div>
        </div>
        <div id="add_listing">
            <div id="approval_request_update">
                <div class="container-fluid" style="background-color:#F1F2F4">
                    <div class="row" >
                        <div class="col-sm-12" style="margin-top:2%">
                            <h4>You are almost ready to start selling!</h4><br>
                            <h6>Please complete all the steps below</h6>
                        </div>

                        <div class="col-sm-1"></div>
                        <div class="col-sm-3 card">
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4" >
                                    <img src="brand_photos/img_law-document.svg" style="height:40px" >
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span>GST</span>
                                        </div>

                                    </div>

                                </div>

                                <div class="col-sm-4"></div>

                            </div>
                            <div class="row">
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-10">
                                    <h6 style="background-color:yellowgreen;color:white;font-size:15px;" id="gst"><center>VERIFIED</center></h6>
                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-10">
                                    <center><a href=""  style="color:#3392F3"><i class="fas fa-check-circle" style="color:green"></i></a></center>
                                </div>
                                <div class="col-sm-1">

                                </div>
                            </div>

                        </div>

                        <div class="col-sm-3 card" >
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4" >
                                    <img src="brand_photos/cheque.svg" style="height:40px">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span>BANK</span>
                                        </div>

                                    </div>

                                </div>

                                <div class="col-sm-4"></div>

                            </div>
                            <div class="row">
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-10">
                                    <h6 style="background-color:yellowgreen;color:white;font-size:15px;" id="gst"><center>VERIFIED</center></h6>
                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-11">
                                    <center><a href=""  style="color:#3392F3"><i class="fas fa-check-circle" style="color:green"></i></a></center>
                                </div>

                            </div>

                        </div>

                        <div class="col-sm-3 card">
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4" >
                                    <img src="brand_photos/img_mail.svg" style="height:32px">
                                    <div class="row">
                                        <div class="col-sm-12">

                                            <span style="font-size:14px">EMAIL</span>
                                        </div>

                                    </div>

                                </div>

                                <div class="col-sm-4"></div>

                            </div>
                            <div class="row">
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-10">
                                    <h6 style="background-color:yellowgreen;color:white;font-size:15px;" id="gst"><center>VERIFIED</center></h6>
                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-11">
                                    <center><a href=""  style="color:#3392F3"><i class="fas fa-check-circle" style="color:green"></i></a></center>
                                </div>

                            </div>

                        </div>
                        <div class="col-sm-3"></div>



                    </div>
                    <div class="row" style="background-color:#F1F2F4;margin-top:2%;">
                        <div class="col-sm-12"  >
                            <div class="row">
                                <div class="col-sm-1" id="store">
                                    <i class='fas fa-store-alt' style='font-size:48px;color:#3392F3;margin-top:24%;'></i>
                                </div>
                                <div class="col-sm-9 card" >
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5> Store Details</h5>

                                        </div>
                                        <div class="col-sm-12">
                                            <h6>Your store details will be displayed to the buyers when they browse your products:</h6>
                                        </div>
                                        <%
                                            String shop_name = "";
                                            String des = "";
                                            String gst_number = "";

                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                                                Statement st = cn.createStatement();
                                                Statement st1 = cn.createStatement();
                                                ResultSet rs1 = st1.executeQuery("select * from gst where seller_code='" + seller_code + "'");
                                                if (rs1.next()) {
                                                    gst_number = rs1.getString("gst_number");
                                                }
                                                ResultSet rs = st.executeQuery("select * from shop_details where user_code='" + seller_code + "'");
                                                if (rs.next()) {
                                                    shop_name = rs.getString("shop_name");
                                                    des = rs.getString("shop_des");

                                        %>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  id="shop_name"value="<%=shop_name%>"style="background-color:#F1F2F4" >
                                        </div>
                                        <div class="col-sm-6" id="edit_icon">
                                            <i class="fa fa-edit" style="color:blue;cursor:pointer" rel="<%=seller_code%>">Edit</i>
                                        </div>
                                        <div class="col-sm-6">
                                            <textarea cols="55" rows="5"   id="shop_des"style="resize:none" style="background-color:#F1F2F4" > <%=des%></textarea>
                                        </div>
                                        <div class="col-sm-6">

                                        </div>
                                        <div class="col-sm-12" id="show"></div>
                                        <div class="col-sm-3" id="save_changes" >

 <!--<input type="button" style="background-color:#CB4154"  rel="<%=seller_code%>"id="shop_save" value="Save Changes">
                                            -->

                                        </div>
                                        <div class="col-sm-9"></div>




                                        <%
                                        } else {




                                        %>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  id="shop_name" placeholder="Enter Your Display Name">
                                            <span id="check_info_name"></span>
                                        </div>
                                        <div class="col-sm-6" id="edit_icon">

                                        </div>
                                        <div class="col-sm-6">
                                            <textarea cols="55" rows="5" id="shop_des" placeholder="Enter Your Store Description" style="resize:none"></textarea>
                                            <span id="check_info_des"></span>
                                        </div>
                                        <div class="col-sm-6"></div>
                                        <div class="col-sm-12" id="show"></div>
                                        <div class="col-sm-3" >
                                            <input type="button" style="background-color:#3392F3"  rel="<%=seller_code%>"id="shop_save" value="Save">
                                        </div>
                                        <div class="col-sm-9"></div>

                                        <%
                                                }
                                            } catch (Exception e) {
                                            }




                                        %>

                                    </div>

                                </div>
                                <div class="col-sm-2"></div>
                            </div> 
                        </div>
                        <div class="col-sm-12"  style="height:50px" > </div>
                        <div class="col-sm-12"  > 
                            <div class="row">
                                <div class="col-sm-1" id="store">
                                    <img src="brand_photos/img_law-document.svg" style='height:48px;color:#3392F3;margin-top:24%;' >
                                </div>
                                <div class="col-sm-9 card">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Business Details</h5>

                                        </div>
                                        <div class="col-sm-12">

                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  value="<%=gst_number%>" style="background-color:#F1F2F4" readonly>

                                        </div>
                                        <div class="col-sm-6">
                                            <h5>Need to update your business details?</h5>
                                            <p>Your business details displayed here are fetched from your GST.
                                                If you think something is wrong, please visit government portal and update the details.</p>
                                            <h5>Where will this information be used?</h5>
                                            <p>Your GST and signature will be used to issue invoices to the buyer.,</p>
                                        </div>
                                        <div class="col-sm-6">

                                        </div>
                                        <div class="col-sm-6"></div>
                                        <div class="col-sm-3">

                                        </div>
                                        <div class="col-sm-9"></div>
                                    </div>

                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                        <div class="col-sm-12"  style="height:50px" > </div>
                        <div class="col-sm-12"  > 
                            <div class="row">
                                <div class="col-sm-1" id="store">
                                    <img src="brand_photos/cheque.svg" style='height:48px;color:#3392F3;margin-top:24%;' >
                                </div>
                                <div class="col-sm-9 card">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Bank Details</h5>

                                        </div>

                                        <div class="col-sm-12">
                                            <h6>This is where we will make your payments :</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  value="<%=account_holder_name%>" style="background-color:#F1F2F4">
                                            <input type="text" class="form-control"  value="<%=account_number%>" style="background-color:#F1F2F4">
                                            <input type="text" class="form-control"  value="<%=ifsc%>" style="background-color:#F1F2F4">

                                        </div>
                                        <div class="col-sm-6">
                                            <h5>Don't have a bank account in the name of your business?</h5>
                                            <p>We can only transfer payments to accounts which are in the registered business name. Please open a new bank account with any bank in your registered business name.</p>

                                        </div>
                                        <div class="col-sm-6">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <span>Account Holder Name</span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span><%=account_holder_name%></span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span>Bank Name</span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span><%=bank_name%></span> 
                                                </div>
                                                <div class="col-sm-6">
                                                    <span>Branch </span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span><%=branch%></span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span>City</span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span><%=city%></span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span>State</span>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span><%=state%></span>
                                                </div>
                                            </div>



                                        </div>
                                        <div class="col-sm-6">
                                            <h5>Don't have a verification document?</h5>
                                            <p>You can get a cheque book, or the statement of your account from your bank. If neither of these are available,
                                                you can also ask the bank to issue a letter with your account number, IFSC code and name mentioned on it.</p>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="button" style="background-color:#3392F3" value="Save">
                                        </div>
                                        <div class="col-sm-9"></div>
                                    </div>

                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                        <div class="col-sm-12"  style="height:50px" > </div>
                        <div class="col-sm-12"  > 
                            <div class="row">
                                <div class="col-sm-1" id="store">
                                    <img src="brand_photos/img_law-document.svg" style='height:48px;color:#3392F3;margin-top:24%;' >
                                </div>
                                <div class="col-sm-9 card">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>List Your Products</h5>

                                        </div>
                                        <div class="col-sm-12">

                                        </div>
                                        <div class="col-sm-6">
                                            List a new product that you would like to sell:
                                        </div>
                                        <div class="col-sm-6">

                                        </div>
                                        <div class="col-sm-6">

                                        </div>
                                        <div class="col-sm-6"></div>
                                        <div class="col-sm-6">
                                            <input type="button" style="background-color:#3392F3" value="LIST YOUR OWN PRODUCTS" >
                                            <p>If you are unable to list your products, please complete all the other steps, a E-shop agent will get in touch with you to help with listing your products</p>
                                        </div>
                                        <div class="col-sm-6"></div>
                                    </div>

                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                        <div class="col-sm-12"  style="height:50px" > </div>
                    </div>




                </div>
            </div>
        </div>

    <center>  <div class="modal" id="myModal"  >
            <div class="modal-dialog">
                <div class="modal-content"  style="width:200%;margin-left:-250px">

                    <!-- Modal Header -->
                    <div class="modal-header" style="background-color:#3392F3;">
                        <h4 class="modal-title" style="color:white">Product List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body " style="overflow:scroll;height:600px">

                        <div class="container-fluid">

                            <div class="row" >

                                <div class="col-sm-4">
                                    <h5><b>Product Name</b></h5>
                                </div>
                                <div class="col-sm-4">
                                    <h5><b>Category</b></h5>
                                </div>
                                <div class="col-4">
                                    <h5><b>Sub Category</b></h5>
                                </div>




                                <%
                                        int flag=0;
                                    try {
                                        String pr_title = "";
                                        String pro_size = "";
                                        String pro_clr = "";
                                        String pro_price = "";
                                        int sn=1;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                                        Statement st = cn.createStatement();
                                        Statement st1 = cn.createStatement();
                                        ResultSet rs = st.executeQuery("select * from product where seller_code='" + seller_code + "' AND status='0'");
                                        while (rs.next()) {
                                            flag=1;
                                            String product_code_seller = rs.getString("product_code");
                                            pr_title = rs.getString("title");
                                            String pro_category = rs.getString("category");
                                            String pro_sub_category = rs.getString("sub_category");
                                %>

                                <div class="col-sm-12"   >
                                    <div class="row">
                                         <div class="col-sm-1">
                                            <span><%=sn%></span> 
                                        </div>
                                        <div class="col-sm-3">
                                            <span><%=pr_title%></span>
                                        </div>
                                        <div class="col-sm-4">
                                            <span><%=pro_category%></span>
                                        </div>
                                        <div class="col-sm-3" >
                                            <span style="display:inline-block"><%=pro_sub_category%></span>


                                        </div>
                                        <div class="col-sm-1" style="cursor:pointer" >



                                            
                                            <i class="fa fa-plus-square"  style="cursor:pointer;font-size:25px"  id="<%=product_code_seller%>">
                                            </i>
                                            <i class="fa fa-minus-square"  style="cursor:pointer;font-size:25px"  rel="<%=product_code_seller%>"id="minus-<%=product_code_seller%>">
                                            </i>
                                           

                                        </div>

                                    </div>
                                </div>

                                <div class="col-sm-12"    >
                                    <div class="hide"  id="list_<%=product_code_seller%>">
                                        <div class="row"  >
                                            <div class="col-sm-12" style="height:10px">

                                            </div>
                                            <div class="col-sm-1" >
                                                
                                            </div>
                                            <div class="col-sm-3" >
                                                <span><b>Size</b></span>
                                            </div>
                                            <div class="col-sm-4">
                                                <span><b>Color</b></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <span><b>Price</b></span>
                                            </div>
                                            <div class="col-sm-1">
                                                <span><b>Status</b></span>
                                            </div>
                                        </div>




                                        <%
                                            ResultSet rs1 = st1.executeQuery("select * from product_list where product_code='" + product_code_seller + "' AND status='0'");
                                            while (rs1.next()) {
                                                pro_size = rs1.getString("size");
                                                pro_clr = rs1.getString("color");
                                                pro_price = rs1.getString("price");
                                        %>

                                        <div class="row" style="background-color:#F1F2F4">
                                             <div class="col-sm-1">
                                                
                                            </div>
                                            <div class="col-sm-3">
                                                <span><%=pro_size%></span> 
                                            </div>
                                            <div class="col-sm-4">
                                                <span><%=pro_clr%></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <span><%=pro_price%></span>
                                            </div>
                                            <div class="col-sm-1">
                                                <span style="color:green">Pending</span>
                                            </div>
                                            <div class="col-sm-12" style="height:10px">

                                            </div>
                                        </div>










                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <%


                                       sn++;
                                        }
                                        if(flag==0){
                                        %>
                                        <div class="col-sm-12">
                                            <center>List Is Empty</center>
                                        </div>
                                        
                                        <%
                                        }
                                    } catch (Exception e) {
                                    }




                                %>

                            </div>
                        </div>

                    </div>



                </div>




            </div>
        </div>  </center>            







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

    } else {


        response.sendRedirect("seller_register.jsp");
    }




%>
</html>
