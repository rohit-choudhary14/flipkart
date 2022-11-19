<%-- 
    Document   : viewproduct
    Created on : 27 Apr, 2022, 1:15:08 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
 <%
        String email = null;
        String product_code = "";
        Cookie c[] = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("user")) {
                email = c[i].getValue();
            }
        }
         if (request.getParameter("v").length() == 0) {
            } else {
                product_code = request.getParameter("v");
            }

        if (email != null) {

           


    %>
        <style>
            .loader {
                margin: 100px auto;
                font-size: 25px;
                width: 1em;
                height: 1em;
                border-radius: 50%;
                position: relative;
                text-indent: -9999em;
                -webkit-animation: load5 1.1s infinite ease;
                animation: load5 1.1s infinite ease;
                -webkit-transform: translateZ(0);
                -ms-transform: translateZ(0);
                transform: translateZ(0);
            }
            @-webkit-keyframes load5 {
                0%,
                100% {
                box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
            }
            12.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
            }
            25% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            37.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            50% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            62.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            75% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            87.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
            }
            }
            @keyframes load5 {
                0%,
                100% {
                box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
            }
            12.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
            }
            25% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            37.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            50% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            62.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            75% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            87.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
            }
            }
           .fa.fa-heart{
                border:1px solid #F1F2F4;
                border-radius:50%;
                padding:10px;
                
            }
            #pr_1{
                border:3px solid #F1F2F4; 
            }
            #pr_2{
                border:3px solid #F1F2F4; 
            }
            #pr_3{
                border:3px solid #F1F2F4; 
            }
            #pr_4{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-1{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-2{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-3{
                border:3px solid #F1F2F4; 
            }
            .card{
                border:3px solid #F1F2F4;
            }

            #card{


                box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);



            } 

            body {

                font-family: Arial, Helvetica, sans-serif;
            }
            #heart{
                color:white;
            }
            #buynow{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }  
            #removefromcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }  
            #addtocart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            } 
            .carousel-control-prev, .carousel-control-next {
                height: 100px;
                width: 40px;
                background: none;
                margin: auto 0;
                background-color:gray;
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
            #removeforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart2{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart3{
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



            .carousel.slide{
                transform: rotate(90deg);

            }
            #carousel-img{
                transform: rotate(270deg);
            }
            #carousel-row{
                transform: rotate(270deg);
            }
            #removefromcart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


            }
            #removefromcart3{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


            }
            #removefromcart2{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;


            }
            #addtocart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


            }




        </style>
        
       
        <script>
            $(document).ready(function() {
                var x = 1;
                var click_on_size = 0;
                var check_for_pincode = 0;
                var n_for_size;
                /* for same size part start */
                var size_match = [];
                for (var i = 1; i <= 4; i++) {

                    size_match[i] = $(".size-" + i).text(); //size-1;
                    //alert(size_match[i]);
                }

                for (var j = 1; j <= 4; j++) {
                    if (size_match[j] === size_match[j + 1]) {
                        n_for_size = j + 1;
                    }




                }




                /* for same size part end */
                /* var h_for_hide=parseInt(n_for_size);
                 
                 $("#select-"+ h_for_hide).blur();
                 */

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
                $(".card").on("click", function() {
                    var pid = $(this).attr("rel");
                    var size = $(this).text();
                    var sn = $(this).attr("rel1");
                    var price1;
                    $(".size-" + sn).attr("rel1", "1");
                    size = size.trim();
                    var n = sn;
                    $("#select-" + sn).css("border-color", "#3392F3");
                    $("#size_row").html(" ");
                    $.post(
                            "set_price.jsp", {pid: pid, size: size}, function(data) {
                        var price = data.trim();

                        var price1 = (parseInt(price) * 40) / 100;//91.6
                        price1 = parseInt(price1) + parseInt(price);


                        click_on_size = 1;
                        $("#price_change").text(data.trim());
                        $("#offer_change").html("<s>" + price1 + "</s>");
                    }

                    );
                    var rel1 = $("#pr_1").attr("rel1");
                    var rel2 = $("#pr_2").attr("rel1");
                    var rel3 = $("#pr_3").attr("rel1");
                    var rel4 = $("#pr_4").attr("rel1");
                    if (rel1 == 0 && rel2 == 0 && rel3 == 0 && rel4 == 0) {

                        // ("#photo_row").html("<div class='alert alert-danger'>Choose Color</div></div>");
                        //$("#photo_row").css("border-color","red");
                    }
                    else if (rel1 == 1 || rel2 == 1 || rel3 == 1 || rel4 == 1) {
                        if (rel1 == 1) {

                            var photo_code = $("#pr_" + 1).attr("rel");
                        }
                        if (rel2 == 1) {

                            var photo_code = $("#pr_" + 2).attr("rel");
                        }
                        if (rel3 == 1) {

                            var photo_code = $("#pr_" + 3).attr("rel");
                        }
                        if (rel4 == 1) {

                            var photo_code = $("#pr_" + 4).attr("rel");
                        }

                    }

                    $.post(
                            "check_add_cart.jsp", {pid: pid, photo_code: photo_code, size: size}, function(data) {

                        if (data.trim() === "try") {
                            var rel = $("#removefromcart2").attr("rel4");
                            if (rel == 1) {
                                $("#removefromcart2").hide();
                                $("#addtocart1").show();
                            }
                            else {
                                $("#removefromcart3").hide();
                                $("#addtocart").show();
                            }




                        }
                        else if (data.trim() === "success") {

                            var rel = $("#removefromcart2").attr("rel4");
                            if (rel == 1) {
                                $("#removefromcart2").show();
                                /* $("#removeforcart3").attr("rel", pid);
                                 $("#removeforcart3").attr("rel1", size);
                                 $("#removeforcart3").attr("rel2", photo_code);
                                 $("#removeforcart3").attr("rel3", price1);*/
                                $("#addtocart1").hide();
                            }
                            else {
                                $("#removefromcart3").show();
                                /* $("#removeforcart2").attr("rel", pid);
                                 $("#removeforcart2").attr("rel1", size);
                                 $("#removeforcart2").attr("rel2", photo_code);
                                 $("#removeforcart2").attr("rel3", price1);*/
                                $("#addtocart").hide();
                            }



                        }

                    }

                    );

                    $(".header").on("click", function() {
                        $("#select-" + sn).css("border-color", "#F1F2F4");
                        $(".size-" + sn).attr("rel1", "0");
                    });
                });
                $(".navx").on("click", function() {
                    var num = $(this).attr("id");
                    var next = num;
                    $("#pr_" + num).css("border-color", "#3392F3");
                    $("#pr_" + num).attr("rel1", "1");
                    var photo = $("#pr_" + num).attr("rel");
                    $("#9-row-img").attr("src", "product_photos/" + photo + ".jpg");
                    $("#photo_row").html(" ");
                    $(".head").on("click", function() {
                        $("#pr_" + next).css("border-color", "#F1F2F4");
                        $("#pr_" + next).attr("rel1", "0");
                    });
                });
                $("#addtocart").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_price = $("#price_change").text();
                    var pincode = [];
                    pincode = $("#pincode").val();
                    var rel_for_pincode = $("#pincode").attr("rel");
                    if (rel_for_pincode == 1) {
                        check_for_pincode = 1;
                    }
                    var product_sub_category = $(this).attr("rel1");
                    if (product_sub_category !== "Washing Machines" && product_sub_category !== "Laptops") {
                        var rel1 = $("#pr_1").attr("rel1");
                        var rel2 = $("#pr_2").attr("rel1");
                        var rel3 = $("#pr_3").attr("rel1");
                        var rel4 = $("#pr_4").attr("rel1");
                        var size1 = $(".size-" + 1).attr("rel1");
                        var size2 = $(".size-" + 2).attr("rel1");
                        var size3 = $(".size-" + 3).attr("rel1");
                        var size4 = $(".size-" + 4).attr("rel1");
                        for (var i = 0; i < pincode.length; i++) {
                            if (pincode[i] >= "0" && pincode[i] <= "9") {
                                //check_for_pincode=0;
                                // alert(pincode[i]);
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "A" && pincode[pincode.length - 1] <= "Z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "a" && pincode[pincode.length - 1] <= "z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                        }

                        if (pincode.length > 6) {
                            $("#pincode_span").html(" ");
                        }
                        else if (pincode.length === 6) {

                            $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                        }
                        else if (check_for_pincode === 0) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A valid Pincode</span>");
                        }

                        if (click_on_size == 0) {

                            $("#size_row").html("<div class='alert alert-danger'>Choose Size</div></div>");
                        }
                        if (click_on_size == 1) {

                            $("#size_row").html(" ");
                        }


                        if (size1 == 1 || size2 == 1 || size3 == 1 || size4 == 1) {
                            if (size1 == 1) {
                                var rel_size = $(".size-" + 1).text();
                            }
                            if (size2 == 1) {
                                var rel_size = $(".size-" + 2).text();
                            }
                            if (size3 == 1) {
                                var rel_size = $(".size-" + 3).text();
                            }
                            if (size4 == 1) {
                                var rel_size = $(".size-" + 4).text();
                            }

                        }
                        var sub_cat = $("#addtocart").attr("rel1");
                        if (sub_cat.trim() == "Laptops") {
                            if (rel1 == 0) {
                                $("#photo_row").html("<div class='alert alert-danger'>Choose Color</div></div>");
                            }
                            else {
                                $("#photo_row").html(" ");
                            }
                        }
                        if (rel1 == 0 && rel2 == 0 && rel3 == 0 && rel4 == 0) {

                            $("#photo_row").html("<div class='alert alert-danger'>Choose Color</div></div>");
                            //$("#photo_row").css("border-color","red");
                        }
                        else if (rel1 == 1 || rel2 == 1 || rel3 == 1 || rel4 == 1) {
                            if (rel1 == 1) {

                                var photo_code = $("#pr_" + 1).attr("rel");
                            }
                            if (rel2 == 1) {

                                var photo_code = $("#pr_" + 2).attr("rel");
                            }
                            if (rel3 == 1) {

                                var photo_code = $("#pr_" + 3).attr("rel");
                            }
                            if (rel4 == 1) {

                                var photo_code = $("#pr_" + 4).attr("rel");
                            }

                        }


                        if (product_code.length > 0 && photo_code.length > 0 && rel_size.length > 0 && product_price.length > 0 && pincode.length > 6 && check_for_pincode === 1) {



                            // $("#addtocart").text("ADDING TO CART");
                            $.post(
                                    "addtocart.jsp", {product_code: product_code, photo_code: photo_code, rel_size: rel_size, product_price: product_price, pincode: pincode}, function(data) {


                                $("#myModalx").modal();
                                if (data.trim() === "success") {

                                    var data_count = $(".fa-stack.fa").attr("data-count");
                                    var countaddtocart = parseInt(data_count) + 1;
                                    $(".fa-stack.fa").attr("data-count", countaddtocart);
                                    $("#removefromcart3").attr("rel2", photo_code);
                                    $("#removefromcart3").attr("rel3", rel_size);
                                    $("#addtocart").hide();
                                    $("#removefromcart3").show();
                                }







                            }

                            );
                        }


                    }
                    else {

                        var photo_code = $("#vertical-row-1").attr("rel2");
                        var rel_size = $("#get-size-product").text();
                        for (var i = 0; i < pincode.length; i++) {
                            if (pincode[i] >= "0" && pincode[i] <= "9") {
                                //check_for_pincode=0;
                                // alert(pincode[i]);
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "A" && pincode[pincode.length - 1] <= "Z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "a" && pincode[pincode.length - 1] <= "z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                        }

                        if (pincode.length > 6) {
                            $("#pincode_span").html(" ");
                        }
                        else if (pincode.length === 6) {

                            $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                        }
                        else if (check_for_pincode === 0) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A valid Pincode</span>");
                        }

                        if (product_code.length > 0 && photo_code.length > 0 && rel_size.length > 0 && product_price.length > 0 && pincode.length > 6 && check_for_pincode === 1) {



                            // $("#addtocart").text("ADDING TO CART");
                            $.post(
                                    "addtocart.jsp", {product_code: product_code, photo_code: photo_code, rel_size: rel_size, product_price: product_price, pincode: pincode}, function(data) {


                                $("#myModalx").modal();
                                if (data.trim() === "success") {
                                    var data_count = $(".fa-stack.fa").attr("data-count");
                                    var countaddtocart = parseInt(data_count) + 1;
                                    $(".fa-stack.fa").attr("data-count", countaddtocart);
                                    $("#addtocart").hide();
                                    $("#removefromcart1").show();
                                }







                            }

                            );
                        }


                    }

                    // alert(rel1);


                });
                $("#addtocart1").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_price = $("#price_change").text();
                    var pincode = [];
                    pincode = $("#pincode").val();
                    var rel_for_pincode = $("#pincode").attr("rel");
                    if (rel_for_pincode == 1) {
                        check_for_pincode = 1;
                    }
                    var product_sub_category = $(this).attr("rel1");
                    if (product_sub_category !== "Washing Machines" && product_sub_category !== "Laptops") {
                        var rel1 = $("#pr_1").attr("rel1");
                        var rel2 = $("#pr_2").attr("rel1");
                        var rel3 = $("#pr_3").attr("rel1");
                        var rel4 = $("#pr_4").attr("rel1");
                        var size1 = $(".size-" + 1).attr("rel1");
                        var size2 = $(".size-" + 2).attr("rel1");
                        var size3 = $(".size-" + 3).attr("rel1");
                        var size4 = $(".size-" + 4).attr("rel1");
                        for (var i = 0; i < pincode.length; i++) {
                            if (pincode[i] >= "0" && pincode[i] <= "9") {
                                //check_for_pincode=0;
                                // alert(pincode[i]);
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "A" && pincode[pincode.length - 1] <= "Z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "a" && pincode[pincode.length - 1] <= "z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                        }

                        if (pincode.length > 6) {
                            $("#pincode_span").html(" ");
                        }
                        else if (pincode.length === 6) {

                            $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                        }
                        else if (check_for_pincode === 0) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A valid Pincode</span>");
                        }

                        if (click_on_size == '0') {

                            $("#size_row").html("<div class='alert alert-danger'>Choose Size</div></div>");
                        }
                        if (click_on_size == '1') {

                            $("#size_row").html(" ");
                        }


                        if (size1 == 1 || size2 == 1 || size3 == 1 || size4 == 1) {
                            if (size1 == 1) {
                                var rel_size = $(".size-" + 1).text();
                            }
                            if (size2 == 1) {
                                var rel_size = $(".size-" + 2).text();
                            }
                            if (size3 == 1) {
                                var rel_size = $(".size-" + 3).text();
                            }
                            if (size4 == 1) {
                                var rel_size = $(".size-" + 4).text();
                            }

                        }
                        if (rel1 == '0' && rel2 == '0' && rel3 == '0' && rel4 == '0') {

                            $("#photo_row").html("<div class='alert alert-danger'>Choose Color</div></div>");
                            //$("#photo_row").css("border-color","red");
                        }
                        else if (rel1 == '1' || rel2 == '1' || rel3 == '1' || rel4 == '1') {
                            if (rel1 == '1') {

                                var photo_code = $("#pr_" + 1).attr("rel");
                            }
                            if (rel2 == '1') {

                                var photo_code = $("#pr_" + 2).attr("rel");
                            }
                            if (rel3 == '1') {

                                var photo_code = $("#pr_" + 3).attr("rel");
                            }
                            if (rel4 == '1') {

                                var photo_code = $("#pr_" + 4).attr("rel");
                            }

                        }
                        var sub_cat = $("#addtocart1").attr("rel1");
                        if (sub_cat.trim() === "Laptops") {
                            if (rel1 === "0") {
                                $("#photo_row").html("<div class='alert alert-danger'>Choose Color</div></div>");
                            }
                            else {
                                $("#photo_row").html(" ");
                            }
                        }

                        if (product_code.length > 0 && photo_code.length > 0 && rel_size.length > 0 && product_price.length > 0 && pincode.length > 6 && check_for_pincode == '1') {



                            // $("#addtocart").text("ADDING TO CART");
                            $.post(
                                    "addtocart.jsp", {product_code: product_code, photo_code: photo_code, rel_size: rel_size, product_price: product_price, pincode: pincode}, function(data) {


                                $("#myModalx").modal();
                                if (data.trim() === "success") {
                                    var data_count = $(".fa-stack.fa").attr("data-count");
                                    var countaddtocart = parseInt(data_count) + 1;
                                    $(".fa-stack.fa").attr("data-count", countaddtocart);
                                    alert("addtocart1");
                                    $("#removefromcart2").attr("rel2", photo_code);
                                    $("#removefromcart2").attr("rel3", rel_size);
                                    $("#addtocart1").hide();
                                    $("#removefromcart2").show();
                                }







                            }

                            );
                        }
                    }
                    else {

                        var photo_code = $("#vertical-row-1").attr("rel2");
                        var rel_size = $("#get-size-product").text();
                        for (var i = 0; i < pincode.length; i++) {
                            if (pincode[i] >= "0" && pincode[i] <= "9") {
                                //check_for_pincode=0;
                                // alert(pincode[i]);
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "A" && pincode[pincode.length - 1] <= "Z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                            if (pincode[pincode.length - 1] >= "a" && pincode[pincode.length - 1] <= "z") {
                                check_for_pincode = 0;
                                $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                            }
                        }

                        if (pincode.length > 6) {
                            $("#pincode_span").html(" ");
                        }
                        else if (pincode.length === 6) {

                            $("#pincode_span").html("<span style='color:red'>Please click on check button to verify</span>");
                        }
                        else if (check_for_pincode === 0) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A valid Pincode</span>");
                        }

                        if (product_code.length > 0 && photo_code.length > 0 && rel_size.length > 0 && product_price.length > 0 && pincode.length > 6 && check_for_pincode === 1) {



                            // $("#addtocart").text("ADDING TO CART");
                            $.post(
                                    "addtocart.jsp", {product_code: product_code, photo_code: photo_code, rel_size: rel_size, product_price: product_price, pincode: pincode}, function(data) {


                                $("#myModalx").modal();
                                if (data.trim() === "success") {
                                    var data_count = $(".fa-stack.fa").attr("data-count");
                                    var countaddtocart = parseInt(data_count) + 1;
                                    $(".fa-stack.fa").attr("data-count", countaddtocart);
                                    $("#removefromcart").show();
                                    $("#addtocart1").hide();
                                }







                            }

                            );
                        }


                    }

                    // alert(rel1);


                });
                $("#show_plus_icon").on("click", function() {
                    $("#show_product_info").slideDown();
                    $("#show_minus_icon").show();
                    $("#show_plus_icon").hide();
                });
                $("#show_minus_icon").on("click", function() {
                    $("#show_product_info").slideUp();
                    $("#show_plus_icon").show();
                    $("#show_minus_icon").hide();
                });
                $("#pincode").keyup(function() {
                    var pincode_verify = [];
                    pincode_verify = $(this).val();
                    for (var i = 0; i < pincode_verify.length; i++) {

                        if ((pincode_verify[i] >= "a" && pincode_verify[i] <= "z") || (pincode_verify[i] >= "A" && pincode_verify[i] <= "Z")) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                        }

                        if (pincode_verify[i] >= "0" && pincode_verify[i] <= "9") {
                            $("#pincode_span").html(" ");
                        }
                        if (pincode_verify.length > 6) {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                        }
                        if (pincode_verify.length == 6) {
                            $("#pincode_span").html(" ");
                        }

                    }
                });
                $("#check_pincode_verify").on("click", function() {
                    var flag = 0;
                    var pincode = [];
                    pincode = $("#pincode").val();
                    if (pincode.length > 6) {
                        $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                    }
                    if (pincode.length == 0) {

                        $("#pincode_span").html("<span style='color:red'>*This field can't be empty</span>");
                    }
                    if (pincode.length > 0 && pincode.length < 6) {
                        $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                    }
                    else if (pincode.length == 6) {
                        $("#pincode_span").html(" ");
                        for (var i = 0; i < pincode.length; i++) {//jaipu1  1jaipu
                            if (pincode[i] >= 0 && pincode[i] <= 9) {

                                flag = 1;
                            }

                        }
                        if (flag == 1) {
                            $.post(
                                    "pincode_verification.jsp", {pincode: pincode}, function(data) {
                                //alert(data.trim());//RAJASTHAN/BIKANER

                                var identify = 0;
                                var state = data.substring(data.indexOf("/") + 1);
                                //alert(state);
                                var dist = data.substring(0, data.indexOf("/"));
                                //alert(dist);
                                var add = state.trim() + "-" + pincode.trim();
                                if (data.trim() === "try") {
                                    $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                                }

                                else {
                                    check_for_pincode = 1;
                                    $("#pincode").val(add);
                                }
                            }


                            );
                        }
                        else {
                            $("#pincode_span").html("<span style='color:red'>Please Enter A Valid Pincode</span>");
                        }
                    }


                });
                $("#ask_question").on("click", function() {
                    var question = $("#post_your_question").val(); //how can we use this product
                    var product_code = $(this).attr("rel");
                    var verify_for_question = [];
                    verify_for_question = question.split(" "); //h w c 

                    if (verify_for_question[0].toUpperCase() === "how".toUpperCase() || verify_for_question[0].toUpperCase() === "what".toUpperCase() || verify_for_question[0].toUpperCase() === "can".toUpperCase() || verify_for_question[0].toUpperCase() === "which".toUpperCase() || verify_for_question[0].toUpperCase() === "would".toUpperCase() || verify_for_question[0].toUpperCase() === "could".toUpperCase()) {
                        if (question.length > 10) {
                            $("#post_right_question").html(" ");
                            $.post(
                                    "add_question.jsp", {product_code: product_code, question: question}, function(data) {

                                if (data.trim() === "success") {
                                    $("#myModal_post_your_question").modal('hide');
                                    $("#myModal_submit_success").modal();
                                    $("#show_success_question").text("Q:" + question + "?");
                                }
                                else if (data.trim() === "try again") {
                                    $("#post_right_question").html("<span style='color:red'>A similar question has already been asked by another user</span>");
                                }

                            }

                            );
                        }
                        else{
                            $("#post_right_question").html("<span style='color:red'>Please provide more details on your question</span>");
                        }


                    }
                    else {
                        $("#post_right_question").html("<span style='color:red'>Please provide more details on your question</span>");
                    }
                    if (question.length < 10) {
                        $("#post_right_question").html("<span style='color:red'>Please provide more details on your question</span>");
                    }



                });
                $("#vertical-row-1").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-2").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-3").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-1").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                $("#vertical-row-2").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                $("#vertical-row-3").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                $("#removefromcart2").on("click", function() {
                    /*var product_code = $(this).attr("rel");
                     var product_size = $(this).attr("rel3");
                     var product_price = $(this).attr("rel1");
                     var product_img_code = $(this).attr("rel2");
                     var rel=$(this).attr("rel4");
                     alert(rel);
                     
                     $("#removeforcart3").attr("rel", product_code);
                     $("#removeforcart3").attr("rel1", product_size);
                     $("#removeforcart3").attr("rel2", product_img_code);
                     $("#removeforcart3").attr("rel3", product_price);
                     $("#myModal_remove_add_to_cart3").modal(); */
                });
                $("#removefromcart3").on("click", function() {
                    /* var product_code = $(this).attr("rel");
                     var product_size = $(this).attr("rel3");
                     var product_price = $(this).attr("rel1");
                     var product_img_code = $(this).attr("rel2");
                     $("#removeforcart2").attr("rel", product_code);
                     $("#removeforcart2").attr("rel1", product_size);
                     $("#removeforcart2").attr("rel2", product_img_code);
                     $("#removeforcart2").attr("rel3", product_price);
                     alert("removefromcart3");
                     $("#myModal_remove_add_to_cart2").modal();*/
                });
                $("#removefromcart1").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $("#get-size-product").text();
                    var product_price = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");
                    $("#removeforcart").attr("rel", product_code);
                    $("#removeforcart").attr("rel1", product_size);
                    $("#removeforcart").attr("rel2", product_img_code);
                    $("#removeforcart").attr("rel3", product_price);
                    $("#myModal_remove_add_to_cart").modal();
                });
                $("#removefromcart").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $("#get-size-product").text();
                    var product_price = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");
                    $("#removeforcart1").attr("rel", product_code);
                    $("#removeforcart1").attr("rel1", product_size);
                    $("#removeforcart1").attr("rel2", product_img_code);
                    $("#removeforcart1").attr("rel3", product_price);
                    $("#myModal_remove_add_to_cart1").modal();
                });
                $("#removeforcart").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");
                    var product_price = $(this).attr("rel3");
                    $.post(
                            "removefromcart.jsp", {product_code: product_code, product_size: product_size, product_img_code: product_img_code, product_price: product_price}, function(data) {

                        if (data.trim() === "success") {
                            $("#myModal_remove_add_to_cart").modal('hide');
                            var data_count = $(".fa-stack.fa").attr("data-count");
                            var countaddtocart = parseInt(data_count) - 1;
                            $(".fa-stack.fa").attr("data-count", countaddtocart);
                            $("#removefromcart1").hide();
                            $("#addtocart").show();
                        }
                    }

                    );
                });
                $("#removeforcart1").on("click", function() {
                    var product_code = $(this).attr("rel");
                    var product_size = $(this).attr("rel1");
                    var product_img_code = $(this).attr("rel2");
                    var product_price = $(this).attr("rel3");
                    $.post(
                            "removefromcart.jsp", {product_code: product_code, product_size: product_size, product_img_code: product_img_code, product_price: product_price}, function(data) {

                        if (data.trim() === "success") {
                            $("#myModal_remove_add_to_cart1").modal('hide');
                            var data_count = $(".fa-stack.fa").attr("data-count");
                            var countaddtocart = parseInt(data_count) - 1;
                            $(".fa-stack.fa").attr("data-count", countaddtocart);
                            $("#removefromcart").hide();
                            $("#addtocart1").show();
                        }
                    }

                    );
                });
                $("#removeforcart2").on("click", function() {
                    /* var product_code = $(this).attr("rel");
                     var product_size = $(this).attr("rel1");
                     var product_img_code = $(this).attr("rel2");
                     var product_price = $(this).attr("rel3");
                     alert(product_code);
                     alert(product_size);
                     alert(product_img_code);
                     alert(product_price);
                     /* $.post(
                     "removefromcart.jsp", {product_code: product_code, product_size: product_size, product_img_code: product_img_code, product_price: product_price}, function(data) {
                     if (data.trim() === "success") {
                     $("#myModal_remove_add_to_cart2").modal('hide');
                     var data_count = $(".fa-stack.fa").attr("data-count");
                     var countaddtocart = parseInt(data_count) - 1;
                     $(".fa-stack.fa").attr("data-count", countaddtocart);
                     $("#removefromcart3").hide();
                     $("#addtocart").show();
                     }
                     }
                     
                     );*/
                });
                $("#removeforcart3").on("click", function() {
                    /* var product_code = $(this).attr("rel");
                     var product_size = $(this).attr("rel1");
                     var product_img_code = $(this).attr("rel2");
                     var product_price = $(this).attr("rel3");
                     alert(product_code);
                     alert(product_size);
                     alert(product_img_code);
                     alert(product_price);
                     /* $.post(
                     "removefromcart.jsp", {product_code: product_code, product_size: product_size, product_img_code: product_img_code, product_price: product_price}, function(data) {
                     
                     if (data.trim() === "success") {
                     $("#myModal_remove_add_to_cart3").modal('hide');
                     var data_count = $(".fa-stack.fa").attr("data-count");
                     var countaddtocart = parseInt(data_count) - 1;
                     $(".fa-stack.fa").attr("data-count", countaddtocart);
                     $("#removefromcart2").hide();
                     $("#addtocart1").show();
                     }
                     }
                     
                     );*/
                });
                $(".fa.fa-heart").on("click",function(){
                    var product_code=$(this).attr("rel");
                    
                    $.post(
                    "fav_product.jsp",{product_code:product_code},function(data){
                       
                        $(".fa.fa-heart").css("color",data.trim());
                        //alert($(this).attr("color"));
                        
                    });  
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
            });</script>
    </head>

    <body>
        <!-- Topbar Start -->
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
                                <a href="user_profile.jsp?link=home_wishlist" class="dropdown-item">
                                    <i class="fa fa-heart-o" style="color:#3392F3"></i>

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

                <a  href="ucart.jsp"style="cursor:pointer" >
                    <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                    <span class="fa-stack fa" data-count="<%=addtocart%>"></span> 
                </a>
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

                                <a href="viewall.jsp?cid=<%=sub_name%>"class="dropdown-item"><%=sub_name%></a>


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

        <!-- Navbar End -->


        <section>
        <!-- Categories Start -->
        <div class="container-fluid"  >
            <div class="row" style="margin-top:1%" >
                <%                    String product_title = "";

                    String img_code = "";
                    String product_price = "";
                    String seller_code = "";
                    String shop_name = "";
                    String size1 = "";
                    String product_sub_category = "";


                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "'");
                        if (rs.next()) {
                            product_title = rs.getString("title");
                            // product_code = rs.getString("product_code");
                            ResultSet rs2 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                            if (rs2.next()) {
                                seller_code = rs2.getString("seller_code");
                            }
                            ResultSet rs3 = st.executeQuery("select * from shop_details where user_code='" + seller_code + "' ");
                            if (rs3.next()) {
                                shop_name = rs3.getString("shop_name");
                            }
                            ResultSet rs4 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs4.next()) {
                                product_price = rs4.getString("price");

                            }
                            ResultSet rs10 = st.executeQuery("select sub_category from product where status='1' AND product_code='" + product_code + "' ");
                            if (rs10.next()) {
                                product_sub_category = rs10.getString("sub_category");

                            }
                            int offerprice = Integer.parseInt(product_price);

                            offerprice = (Integer.parseInt(product_price) * 40) / 100;
                            offerprice = Integer.parseInt(product_price) + offerprice;



                            img_code = product_code + "_" + 1;
                            if (product_sub_category.equals("Laptops") || product_sub_category.equals("Washing Machines")) {




                %>

                <div class="col-sm-5 " style="margin-top:1%;margin-bottom: 2%;">
                    <div class="row">
                        <div class="col-sm-3" style="height:400px" >
                            <div class="row" >


                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-1" src="product_photos/<%=product_code%>_2.jpg" rel="<%=product_code%>_2"  rel2="<%=product_code%>_1" rel3="<%=product_price%>"style="height:120px;width:150px" rel1="<%=product_code%>"alt=""/> 
                                </div>
                            </div>  
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="row" >
                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-2" src="product_photos/<%=product_code%>_3.jpg" rel="<%=product_code%>_3" style="height:120px;width:150px"rel1="<%=product_code%>"alt=""/> 
                                </div>
                            </div>
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="row">
                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-3" src="product_photos/<%=product_code%>_4.jpg" rel="<%=product_code%>_4"style="height:120px;width:150px" rel1="<%=product_code%>"alt=""/> 
                                </div>

                            </div>

                        </div>
                        <div class="col-sm-9 "style="height:400px" >
                            <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg"  id="9-row-img" alt="Image"/> 

                        </div>
                    </div>


                    <div class="row" style="margin-top:3%;">
                        <%
                            ResultSet rs11 = st2.executeQuery("select * from addtocart where user_email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs11.next()) {
                        %>
                        <div class="col-sm-6" >
                            <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=img_code%>"style="color:white"id="removefromcart"><i class="fa fa-remove">&nbsp;&nbsp;REMOVE FROM CART</i></button>
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart1"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                        </div>

                        <%

                        } else {


                        %>
                        <div class="col-sm-6"  >
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                            <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=img_code%>"style="color:white"id="removefromcart1"><i class="fa fa-remove">&nbsp;&nbsp;REMOVE FROM CART</i></button>


                        </div>

                        <%

                            }
                        %>
                        <div class="col-sm-6">
                            <button class="btn btn-warning" style="background-color: #FF7E00" id="buynow"><i class="fa fa-bolt" style="color:white">&nbsp;&nbsp;BUY NOW</i></button>
                        </div>
                    </div>
                </div> 


                <div class="col-sm-1" style="margin-top:2%" >
                    <%
                            String color_code="gray";
                     ResultSet rs12 = st2.executeQuery("select color_code from fav_product where email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs12.next()) {
                                color_code=rs12.getString("color_code"); 
                            }
                                
                                %>
                            
                    <i class="fa fa-heart" id="color-<%=product_code%>" rel="<%=product_code%>"  style="color:<%=color_code%>"></i> 


                </div> 

                <div class="col-sm-6" style="margin-top:2%">  
                    <div class="row">  
                        <div class="col-sm-12">  
                            <span><%=shop_name%></span>
                        </div>
                        <div class="col-sm-12">
                            <h5 style="color:black"><%=product_title%></h5>  
                        </div>
                        <div class="col-sm-12">
                            <h6 style="color:green">Special price</h6>
                        </div>
                        <div class="col-sm-12">
                            <i class="fa fa-rupee" style="font-size:25px;color:black"></i>
                            <span style="font-size:28px;color:black" id="price_change"><%=product_price%></span>  
                            &nbsp;&nbsp;
                            <i class="fa fa-rupee" style="color:black"> 
                                <span style="color:gray"  id="offer_change"> <s><%=offerprice%></s></span> </i>  
                            <span style="color:green" > 40% off</span> </i>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h6 style="color:black">Available offers</h6>

                                </div>

                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Special PriceGet extra 22% off (price inclusive of discount)</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Partner OfferSign up for E-shop Pay Later and get E-shop Gift Card worth ₹100*</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer10% off on ICICI Bank Credit Cards, up to ₹300. On orders of ₹1750 and above</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer5% Cashback on E-shop Axis Bank Card</span>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12">
                            <img src="offer-icon/download.svg" style="height:25px">
                            <span>Deliver to</span>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-6" >
                            <%
                                String address_from_tabel = "";
                                int address = 0;
                                ResultSet rs8 = st.executeQuery("select * from addtocart where user_email='" + email + "' "); 
                                if (rs8.next()) { 
                                    address = 1;

                                    address_from_tabel = rs8.getString("address"); 

                            %>                               
                            <input class="form-control"  id="pincode" readonly rel="<%=address%>" value="<%=address_from_tabel%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>
                            <%
                            } else { 


                            %>

                            <input class="form-control"  id="pincode"  rel="<%=address%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>    

                            <%
                                }

                            %>
                        </div>
                        <div class="col-sm-6">
                            <%
                                if (address == 0) { 

                            %>
                            <button class="btn btn-success" id="check_pincode_verify">Check</button>
                            <%                                }%>
                        </div>

                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <!--
                        <div class="col-sm-12" >
                            <span>Size</span>
                        </div>
                        <div class="col-sm-12" >
                            <div class="row">
                        <%
                            int sn = 1;
                             ResultSet rs1 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                             while (rs1.next()) {


                                 size1 = rs1.getString("size");
                                 String shouse_color = rs1.getString("color");



                        %>
                        <div class="col-sm-2"  style="border-color:#F1F2F4;cursor:pointer;height:30px;" >
                            <div class="card" id="select-<%=sn%>" rel="<%=product_code%>" rel1="<%=sn%>">
                                <div class="header" > 
                                    <span style="color:black" class="size-<%=sn%>" id="size-<%=product_code%>" rel="<%=product_code%>" rel1="0"><center><%=size1%></center></span> 
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1"  >

                        </div>
                        <%
                                sn++;
                            }
                        %>
                        <div class="col-sm-12" id="size_row"  style="margin-top:1%">


                        </div>
                    </div>
                </div>-->
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-10" >
                            <h5 style="color:black">Product Details</h5>
                            <div class="row" style="display:none" id="show_product_info">
                                <div class="col-sm-4">
                                    Available Color
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%
                                            String show_size = "";
                                            String color = "";
                                            ResultSet rs5 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs5.next()) {


                                                show_size = rs5.getString("size");
                                                color = rs5.getString("color");



                                        %>
                                        <div class="col-sm-4">
                                            <%=color%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Available Size
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%


                                            ResultSet rs6 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            if (rs6.next()) {


                                                show_size = rs6.getString("size");


                                        %>
                                        <div class="col-sm-2" >
                                            <span id="get-size-product"> <%=show_size%> </span>
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Description
                                </div>
                                <div class="col-sm-8">

                                    <%
                                        String des = "";
                                        ResultSet rs7 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                                        if (rs7.next()) {


                                            des = rs7.getString("des");


                                    %>

                                    <%=des%> 

                                    <%

                                        }

                                    %>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <i class="fa fa-plus" style="cursor:pointer" id="show_plus_icon"></i>
                            <i class="fa fa-minus" style="cursor:pointer;display:none" id="show_minus_icon"></i>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h3>Ratings & Reviews</h3>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:2%">
                            <button class="btn btn-primary btn-block border-0 py-2" style="color:white">Rate Product</button>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>




                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h5>Have doubts regarding this product?</h5>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:1%">
                            <input type="button" class="btn btn-primary btn-block border-0 py-2"style="color:white"data-toggle="modal" data-target="#myModal_post_your_question"  value="Post Your Question">
                        </div>
                    </div>

                </div>









                <%
                } else {
                %>
                <div class="col-sm-5 " style="margin-top:1%;margin-bottom: 2%;">
                    <div class="row">
                        <div class="col-sm-3 " ></div>
                        <div class="col-sm-9 " >
                            <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg"style="height:400px"  id="9-row-img" alt="Image"/> 

                        </div>
                    </div>


                    <div class="row" style="margin-top:2%;">
                        <%
                            String photo_code = "";
                            String product_size = "";
                            ResultSet rs11 = st2.executeQuery("select * from addtocart where user_email='" + email + "' AND product_code='" + product_code + "' AND photo_code='" + img_code + "'");
                            if (rs11.next()) {
                                photo_code = rs11.getString("photo_code");
                                product_size = rs11.getString("product_size");
                        %>
                        <div class="col-sm-6" >
                            <a href="ucart.jsp"> <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=photo_code%>"rel3="<%=product_size%>"style="color:white"id="removefromcart2" rel4="1">GO TO CART</button></a>
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart1" rel4="1"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                        </div>

                        <%

                        } else {


                        %>
                        <div class="col-sm-6"  >
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart"rel4="0"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                            <a href="ucart.jsp"><button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="" rel3=""style="color:white"id="removefromcart3" rel4="0">GO TO CART</button></a>


                        </div>
                        <%
                            }
                        %>
                        <div class="col-sm-6">
                            <button class="btn btn-warning" style="background-color: #FF7E00" id="buynow"><i class="fa fa-bolt" style="color:white">&nbsp;&nbsp;BUY NOW</i></button>
                        </div>
                    </div>
                </div> 


                <div class="col-sm-1" style="margin-top:2%" >
                     <%
                            String color_code="gray";
                     ResultSet rs12 = st2.executeQuery("select color_code from fav_product where email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs12.next()) {
                                color_code=rs12.getString("color_code"); 
                            }
                                
                                %>
                     <i class="fa fa-heart" id="color-<%=product_code%>" rel="<%=product_code%>" style="color:<%=color_code%>"></i> 


                </div>
                <!---
                <div class="row">
                    <div class="col-sm-3 "  >
                        <div id="header-carousel" class="carousel slide" data-ride="carousel"data-interval="false" >
                            <div class="carousel-inner">

                                <div class="carousel-item active"  >
                                    <div class="row" id="carousel-row">
                                        <div class="col-sm-12">
                                            <img class="img-fluid"  src="product_photos/<%=product_code%>_1.jpg"  height="100px"id="carousel-img" alt="Image"/> 


                                        </div>
                                           
                                             <div class="col-sm-12">
                                            <img class="img-fluid"  src="product_photos/<%=product_code%>_2.jpg"   height="200px"id="carousel-img" alt="Image"/> 


                                        </div>
                                        
                                        



                                    </div>



                                </div>




                            </div>
                            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel" data-slide="next" >
                                <i class="fa fa-angle-right"  ></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg" style="height:350px"  alt="Image"/> 

                    </div>-->

                <div class="col-sm-6" style="margin-top:2%"> 
                    <div class="row"> 
                        <div class="col-sm-12"> 
                            <span><%=shop_name%></span>
                        </div>
                        <div class="col-sm-12">
                            <h5 style="color:black"><%=product_title%></h5> 
                        </div>
                        <div class="col-sm-12">
                            <h6 style="color:green">Special price</h6>
                        </div>
                        <div class="col-sm-12">
                            <i class="fa fa-rupee" style="font-size:25px;color:black"></i>
                            <span style="font-size:28px;color:black" id="price_change"><%=product_price%></span> 
                            &nbsp;&nbsp;
                            <i class="fa fa-rupee" style="color:black">
                                <span style="color:gray"  id="offer_change"> <s><%=offerprice%></s></span> </i> 
                            <span style="color:green" > 40% off</span> </i>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h6 style="color:black">Available offers</h6>

                                </div>

                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Special PriceGet extra 22% off (price inclusive of discount)</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Partner OfferSign up for E-shop Pay Later and get E-shop Gift Card worth ₹100*</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer10% off on ICICI Bank Credit Cards, up to ₹300. On orders of ₹1750 and above</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer5% Cashback on E-shop Axis Bank Card</span>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12">
                            <img src="offer-icon/download.svg" style="height:25px">
                            <span>Deliver to</span>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-6" >
                            <%
                                String address_from_tabel = "";
                                int address = 0;
                                ResultSet rs8 = st.executeQuery("select * from addtocart where user_email='" + email + "' ");
                                if (rs8.next()) {
                                    address = 1;

                                    address_from_tabel = rs8.getString("address");

                            %>                               
                            <input class="form-control"  id="pincode" readonly rel="<%=address%>" value="<%=address_from_tabel%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>
                            <%
                            } else {


                            %>

                            <input class="form-control"  id="pincode"  rel="<%=address%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>    

                            <%
                                }

                            %>
                        </div>
                        <div class="col-sm-6">
                            <%
                                if (address == 0) {

                            %>
                            <button class="btn btn-success" id="check_pincode_verify">Check</button>
                            <%                                }%>
                        </div>

                        <div class="col-sm-12">



                            <span>Color</span>

                            <div class="row">
                                <div class="col-sm-12"  >

                                    <div class="row" >
                                        <div class="col-sm-2" >
                                            <div class="navx" id="1">
                                                <div class="head">
                                                    <img class="img-fluid"  id="pr_1" src="product_photos/<%=product_code%>_1.jpg"  rel="<%=product_code%>_1"  rel1="0"style="height:100px;"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 ">
                                            <div class="navx"id="2">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_2" src="product_photos/<%=product_code%>_2.jpg" rel="<%=product_code%>_2" rel1="0"style="height:100px"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 "  >
                                            <div class="navx" id="3">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_3" src="product_photos/<%=product_code%>_3.jpg" rel="<%=product_code%>_3" rel1="0" style="height:100px"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2">
                                            <div class="navx" id="4">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_4" src="product_photos/<%=product_code%>_4.jpg" rel="<%=product_code%>_4" rel1="0" style="height:100px"alt=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-12" id="photo_row" style="margin-top:1%" >



                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" >
                            <span>Size</span>
                        </div>
                        <div class="col-sm-12" >
                            <div class="row">
                                <%
                                    int sn = 1;
                                    ResultSet rs1 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                    while (rs1.next()) {


                                        size1 = rs1.getString("size");
                                        String shouse_color = rs1.getString("color");



                                %>
                                <div class="col-sm-2"  style="border-color:#F1F2F4;cursor:pointer;height:30px;" >
                                    <div class="card" id="select-<%=sn%>" rel="<%=product_code%>" rel1="<%=sn%>">
                                        <div class="header" > 
                                            <span style="color:black" class="size-<%=sn%>" id="size-<%=product_code%>" rel="<%=product_code%>" rel1="0"><center><%=size1%></center></span> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1"  >

                                </div>
                                <%
                                        sn++;
                                    }
                                %>
                                <div class="col-sm-12" id="size_row"  style="margin-top:1%">


                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-10" >
                            <h5 style="color:black">Product Details</h5>
                            <div class="row" style="display:none" id="show_product_info">
                                <div class="col-sm-4">
                                    Available Color
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%
                                            String show_size = "";
                                            String color = "";
                                            ResultSet rs5 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs5.next()) {


                                                show_size = rs5.getString("size");
                                                color = rs5.getString("color");



                                        %>
                                        <div class="col-sm-4">
                                            <%=color%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Available Size
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%


                                            ResultSet rs6 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs6.next()) {


                                                show_size = rs6.getString("size");


                                        %>
                                        <div class="col-sm-2">
                                            <%=show_size%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Description
                                </div>
                                <div class="col-sm-8">

                                    <%
                                        String des = "";
                                        ResultSet rs7 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                                        if (rs7.next()) {


                                            des = rs7.getString("des");


                                    %>

                                    <%=des%> 

                                    <%

                                        }

                                    %>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <i class="fa fa-plus" style="cursor:pointer" id="show_plus_icon"></i>
                            <i class="fa fa-minus" style="cursor:pointer;display:none" id="show_minus_icon"></i>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h3>Ratings & Reviews</h3>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:2%">
                            <button class="btn btn-primary btn-block border-0 py-2" style="color:white">Rate Product</button>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>




                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h5>Have doubts regarding this product?</h5>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:1%">
                            <input type="button" class="btn btn-primary btn-block border-0 py-2"style="color:white"data-toggle="modal" data-target="#myModal_post_your_question"  value="Post Your Question">
                        </div>
                    </div>

                </div>





                <%
                            }
                        }




                    } catch (Exception e) {
                    }





                %>
            </div>
        </div>
        <!--- post your question part  modal start-->
        <div class="modal" id="myModal_post_your_question" >
            <button type="button" class="close" data-dismiss="modal" style="margin-top:9%;margin-right:13%;font-size:30px;color:white">&times;</button>

            <div class="modal-dialog">

                <div class="modal-content" style="width:170%;margin-left:-130px;margin-top:25%">



                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-4" style="background-color:#F1F2F4;" >
                                <div class="row" >
                                    
                                    <div class="col-sm-12" style="margin-top:5%">
                                        
                                    
                                <li>Be specific, ask questions only about the product.</li>
                                <li>   Ensure you have gone through the product specifications before posting your question.</li>
                                <li>  Reach out to Flipkart customer care for queries related to offers, orders, delivery etc.</li>
                                </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-sm-12"  style="margin-top:1%">

                                        <h4>Post your question</h4>

                                    </div>

                                    <div class="col-sm-12">

                                        <textarea placeholder="Type Your Quetion Here" id="post_your_question" cols="64" rows="10"style="resize:none"></textarea>

                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-12" id="post_right_question">

                                            </div>
                                        </div>
                                        <button class="btn btn-primary btn-block py-2"  id="ask_question"style="color:white;float:right"rel="<%=product_code%>" >Submit</button>
                                    </div>
                                    <div class="col-sm-12" style="height:10px">
                                    </div>


                                </div>

                            </div>
                        </div>
                    </div>





                </div>




            </div>
        </div>

        <!--- post your question part modal end-->

        <!--- successfully post your question part  modal start-->
        <div class="modal" id="myModal_submit_success" >
            <button type="button" class="close" data-dismiss="modal" style="margin-top:9%;margin-right:18%;font-size:30px;color:white">&times;</button>

            <div class="modal-dialog">

                <div class="modal-content" style="width:150%;margin-left:-100px;margin-top:25%;height:370px">



                    <div class="container-fluid">
                        <div class="row" style="margin-top:5%">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9">

                                <center><img src="offer-icon/msg.svg"></center>




                            </div>
                            <div class="col-sm-12">

                                <h4><center>Question Posted Successfully</center></h4>




                            </div>
                            <div class="col-sm-12">

                                <center> <h4 id="show_success_question"></h4></center>




                            </div>
                            <div class="col-sm-12">
                                <center><h5>Will notify you when someone answers your question.</h5></center>
                            </div>
                            <div class="col-sm-12">
                                <center><button class="btn btn-primary" class="close" data-dismiss="modal"style="color:white">CONTINUE SHOPPING</button></center>
                            </div>

                        </div>
                    </div>
                </div>





            </div>




        </div>


        <!--- successfully post your question part modal end-->


        <!-- Products End -->
        <!-- Featured Start -->

        <!-- Featured End -->


        <!-- Vendor Start -->

        <!-- Vendor End -->
        <div class="modal" id="myModalx">
            <div class="modal-dialog" style="margin-top:15%;height:250px">
                <div class="modal-content">


                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">


                                <div class="col-sm-4"></div>
                                <div class="col-sm-8">
                                    <center><img src="offer-icon/msg.svg" style="height:100px"></center>


                                </div>
                                <div class="col-sm-12" >
                                    <h6><center>Item added to cart please visit cart to view</center></h6>
                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="button"  class="btn btn-danger btn-block py-2" style="color:white"  data-dismiss="modal" value="CONTINUE SHOPPING">
                                        </div>
                                        <div class="col-sm-6">
                                            <a href="ucart.jsp"><button style="color:white" class="btn btn-success btn-block py-2">VIEW CART</button></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <!------- remove from cart modal start-->
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




        <!----remove from cart modal end-->
        <div class="modal" id="myModal_remove_add_to_cart1">
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
                                            <input type="button" id="removeforcart1" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <div class="modal" id="myModal_remove_add_to_cart2">
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
                                            <input type="button" id="removeforcart2" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <div class="modal" id="myModal_remove_add_to_cart3">
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
                                            <input type="button" id="removeforcart3" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
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
             %>
         
<style>
            .loader {
                margin: 100px auto;
                font-size: 25px;
                width: 1em;
                height: 1em;
                border-radius: 50%;
                position: relative;
                text-indent: -9999em;
                -webkit-animation: load5 1.1s infinite ease;
                animation: load5 1.1s infinite ease;
                -webkit-transform: translateZ(0);
                -ms-transform: translateZ(0);
                transform: translateZ(0);
            }
            @-webkit-keyframes load5 {
                0%,
                100% {
                box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
            }
            12.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
            }
            25% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            37.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            50% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            62.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            75% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            87.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
            }
            }
            @keyframes load5 {
                0%,
                100% {
                box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
            }
            12.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
            }
            25% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            37.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            50% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            62.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            75% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
            }
            87.5% {
                box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
            }
            }
           .fa.fa-heart{
                border:1px solid #F1F2F4;
                border-radius:50%;
                padding:10px;
                
            }
            #pr_1{
                border:3px solid #F1F2F4; 
            }
            #pr_2{
                border:3px solid #F1F2F4; 
            }
            #pr_3{
                border:3px solid #F1F2F4; 
            }
            #pr_4{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-1{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-2{
                border:3px solid #F1F2F4; 
            }
            #vertical-row-3{
                border:3px solid #F1F2F4; 
            }
            .card{
                border:3px solid #F1F2F4;
            }

            #card{


                box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);



            } 

            body {

                font-family: Arial, Helvetica, sans-serif;
            }
            #heart{
                color:white;
            }
            #buynow{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }  
            #removefromcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }  
            #addtocart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            } 
            .carousel-control-prev, .carousel-control-next {
                height: 100px;
                width: 40px;
                background: none;
                margin: auto 0;
                background-color:gray;
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
            #removeforcart{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart2{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            #removeforcart3{
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



            .carousel.slide{
                transform: rotate(90deg);

            }
            #carousel-img{
                transform: rotate(270deg);
            }
            #carousel-row{
                transform: rotate(270deg);
            }
            #removefromcart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


            }
            #removefromcart3{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


            }
            #removefromcart2{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;


            }
            #addtocart1{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;

                display:none;


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
               

                    
                $(".navx").on("click", function() {
                    var num = $(this).attr("id");
                    var next = num;
                    $("#pr_" + num).css("border-color", "#3392F3");
                    $("#pr_" + num).attr("rel1", "1");
                    var photo = $("#pr_" + num).attr("rel");
                    $("#9-row-img").attr("src", "product_photos/" + photo + ".jpg");
                    $("#photo_row").html(" ");
                    $(".head").on("click", function() {
                        $("#pr_" + next).css("border-color", "#F1F2F4");
                        $("#pr_" + next).attr("rel1", "0");
                    });
                });
                $("#addtocart").on("click", function() {
                    
                           
                      $("#myModal1").modal();

                        


                });
                
                $("#show_plus_icon").on("click", function() {
                    $("#show_product_info").slideDown();
                    $("#show_minus_icon").show();
                    $("#show_plus_icon").hide();
                });
                $("#show_minus_icon").on("click", function() {
                    $("#show_product_info").slideUp();
                    $("#show_plus_icon").show();
                    $("#show_minus_icon").hide();
                });
                
                $("#check_pincode_verify").on("click", function() {
                    $("#myModal1").modal();
                });
               
                $("#vertical-row-1").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-2").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-3").mouseover(function() {
                    var num = $(this).attr("rel");
                    var next = num;
                    $(this).css("border-color", "#3392F3");
                    $("#9-row-img").attr("src", "product_photos/" + num + ".jpg");
                });
                $("#vertical-row-1").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                $("#vertical-row-2").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                $("#vertical-row-3").mouseout(function() {
                    var num = $(this).attr("rel1");
                    var next = num;
                    $(this).css("border-color", "#F1F2F4");
                    $("#9-row-img").attr("src", "product_photos/" + num + "_1.jpg");
                });
                
                $(".fa.fa-heart").on("click",function(){
                    $("#myModal1").modal();
                    
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

    <body>
        <!-- Topbar Start -->
        <nav class="navbar sticky-top" style="background-color:#3392F3;">
            <a href="index.jsp"><h2 style="color:white;font-family:AR BERKLEY">Flipkart</h2></a>
    <img src="offer-icon/flipkart-logo-3F33927DAA-seeklogo.com.png" style="width:30px;">
        
                      
                
                <div class="col-sm-5" >

                    <div class="input-group"  style="background-color:white">
                        <input type="text" id="input"class="form-control" placeholder="Search for products">
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
                                    <a href="ucart.jsp" class="dropdown-item" >
                                        <i class="fa fa-shopping-cart" style="color:#3392F3"></i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Orders</span></a>
                                    <!--<s>hi</s>--->
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="" class="dropdown-item" data-toggle="modal" data-target="#myModal1">
                                        <i class="fa fa-heart-o" style="color:#3392F3"></i>
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

                    <a  href="ucart.jsp" >
                        
                         <i class="fa fa-shopping-cart" id="heart" style="font-size:20px" ></i>
                        
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

                                <a href="viewall.jsp?cid=<%=sub_name%>"class="dropdown-item"><%=sub_name%></a>


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

        <!-- Navbar End -->


        <section>
        <!-- Categories Start -->
        <div class="container-fluid"  >
            <div class="row" style="margin-top:1%" >
                <%                    String product_title = "";

                    String img_code = "";
                    String product_price = "";
                    String seller_code = "";
                    String shop_name = "";
                    String size1 = "";
                    String product_sub_category = "";


                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                        Statement st = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "'");
                        if (rs.next()) {
                            product_title = rs.getString("title");
                            // product_code = rs.getString("product_code");
                            ResultSet rs2 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                            if (rs2.next()) {
                                seller_code = rs2.getString("seller_code");
                            }
                            ResultSet rs3 = st.executeQuery("select * from shop_details where user_code='" + seller_code + "' ");
                            if (rs3.next()) {
                                shop_name = rs3.getString("shop_name");
                            }
                            ResultSet rs4 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs4.next()) {
                                product_price = rs4.getString("price");

                            }
                            ResultSet rs10 = st.executeQuery("select sub_category from product where status='1' AND product_code='" + product_code + "' ");
                            if (rs10.next()) {
                                product_sub_category = rs10.getString("sub_category");

                            }
                            int offerprice = Integer.parseInt(product_price);

                            offerprice = (Integer.parseInt(product_price) * 40) / 100;
                            offerprice = Integer.parseInt(product_price) + offerprice;



                            img_code = product_code + "_" + 1;
                            if (product_sub_category.equals("Laptops") || product_sub_category.equals("Washing Machines")) {




                %>

                <div class="col-sm-5 " style="margin-top:1%;margin-bottom: 2%;">
                    <div class="row">
                        <div class="col-sm-3" style="height:400px" >
                            <div class="row" >


                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-1" src="product_photos/<%=product_code%>_2.jpg" rel="<%=product_code%>_2"  rel2="<%=product_code%>_1" rel3="<%=product_price%>"style="height:120px;width:150px" rel1="<%=product_code%>"alt=""/> 
                                </div>
                            </div>  
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="row" >
                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-2" src="product_photos/<%=product_code%>_3.jpg" rel="<%=product_code%>_3" style="height:120px;width:150px"rel1="<%=product_code%>"alt=""/> 
                                </div>
                            </div>
                            <div class="col-sm-12" style="height:10px">

                            </div>
                            <div class="row">
                                <div class="col-sm-12" >
                                    <img class="img-fluid" id="vertical-row-3" src="product_photos/<%=product_code%>_4.jpg" rel="<%=product_code%>_4"style="height:120px;width:150px" rel1="<%=product_code%>"alt=""/> 
                                </div>

                            </div>

                        </div>
                        <div class="col-sm-9 "style="height:400px" >
                            <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg"  id="9-row-img" alt="Image"/> 

                        </div>
                    </div>


                    <div class="row" style="margin-top:3%;">
                        <%
                            ResultSet rs11 = st2.executeQuery("select * from addtocart where user_email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs11.next()) {
                        %>
                        <div class="col-sm-6" >
                            <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=img_code%>"style="color:white"id="removefromcart"><i class="fa fa-remove">&nbsp;&nbsp;REMOVE FROM CART</i></button>
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart1"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                        </div>

                        <%

                        } else {


                        %>
                        <div class="col-sm-6"  >
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                            <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=img_code%>"style="color:white"id="removefromcart1"><i class="fa fa-remove">&nbsp;&nbsp;REMOVE FROM CART</i></button>


                        </div>

                        <%

                            }
                        %>
                        <div class="col-sm-6">
                            <button class="btn btn-warning" style="background-color: #FF7E00" id="buynow"><i class="fa fa-bolt" style="color:white">&nbsp;&nbsp;BUY NOW</i></button>
                        </div>
                    </div>
                </div> 


                <div class="col-sm-1" style="margin-top:2%" >
                    <%
                            String color_code="gray";
                     ResultSet rs12 = st2.executeQuery("select color_code from fav_product where email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs12.next()) {
                                color_code=rs12.getString("color_code"); 
                            }
                                
                                %>
                            
                    <i class="fa fa-heart" id="color-<%=product_code%>" rel="<%=product_code%>"  style="color:<%=color_code%>"></i> 


                </div> 

                <div class="col-sm-6" style="margin-top:2%">  
                    <div class="row">  
                        <div class="col-sm-12">  
                            <span><%=shop_name%></span>
                        </div>
                        <div class="col-sm-12">
                            <h5 style="color:black"><%=product_title%></h5>  
                        </div>
                        <div class="col-sm-12">
                            <h6 style="color:green">Special price</h6>
                        </div>
                        <div class="col-sm-12">
                            <i class="fa fa-rupee" style="font-size:25px;color:black"></i>
                            <span style="font-size:28px;color:black" id="price_change"><%=product_price%></span>  
                            &nbsp;&nbsp;
                            <i class="fa fa-rupee" style="color:black"> 
                                <span style="color:gray"  id="offer_change"> <s><%=offerprice%></s></span> </i>  
                            <span style="color:green" > 40% off</span> </i>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h6 style="color:black">Available offers</h6>

                                </div>

                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Special PriceGet extra 22% off (price inclusive of discount)</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Partner OfferSign up for E-shop Pay Later and get E-shop Gift Card worth ₹100*</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer10% off on ICICI Bank Credit Cards, up to ₹300. On orders of ₹1750 and above</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer5% Cashback on E-shop Axis Bank Card</span>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12">
                            <img src="offer-icon/download.svg" style="height:25px">
                            <span>Deliver to</span>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-6" >
                            <%
                                String address_from_tabel = "";
                                int address = 0;
                                ResultSet rs8 = st.executeQuery("select * from addtocart where user_email='" + email + "' "); 
                                if (rs8.next()) { 
                                    address = 1;

                                    address_from_tabel = rs8.getString("address"); 

                            %>                               
                            <input class="form-control"  id="pincode" readonly rel="<%=address%>" value="<%=address_from_tabel%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>
                            <%
                            } else { 


                            %>

                            <input class="form-control"  id="pincode"  rel="<%=address%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>    

                            <%
                                }

                            %>
                        </div>
                        <div class="col-sm-6">
                            <%
                                if (address == 0) { 

                            %>
                            <button class="btn btn-success" id="check_pincode_verify">Check</button>
                            <%                                }%>
                        </div>

                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <!--
                        <div class="col-sm-12" >
                            <span>Size</span>
                        </div>
                        <div class="col-sm-12" >
                            <div class="row">
                        <%
                            int sn = 1;
                             ResultSet rs1 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                             while (rs1.next()) {


                                 size1 = rs1.getString("size");
                                 String shouse_color = rs1.getString("color");



                        %>
                        <div class="col-sm-2"  style="border-color:#F1F2F4;cursor:pointer;height:30px;" >
                            <div class="card" id="select-<%=sn%>" rel="<%=product_code%>" rel1="<%=sn%>">
                                <div class="header" > 
                                    <span style="color:black" class="size-<%=sn%>" id="size-<%=product_code%>" rel="<%=product_code%>" rel1="0"><center><%=size1%></center></span> 
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1"  >

                        </div>
                        <%
                                sn++;
                            }
                        %>
                        <div class="col-sm-12" id="size_row"  style="margin-top:1%">


                        </div>
                    </div>
                </div>-->
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-10" >
                            <h5 style="color:black">Product Details</h5>
                            <div class="row" style="display:none" id="show_product_info">
                                <div class="col-sm-4">
                                    Available Color
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%
                                            String show_size = "";
                                            String color = "";
                                            ResultSet rs5 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs5.next()) {


                                                show_size = rs5.getString("size");
                                                color = rs5.getString("color");



                                        %>
                                        <div class="col-sm-4">
                                            <%=color%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Available Size
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%


                                            ResultSet rs6 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            if (rs6.next()) {


                                                show_size = rs6.getString("size");


                                        %>
                                        <div class="col-sm-2" >
                                            <span id="get-size-product"> <%=show_size%> </span>
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Description
                                </div>
                                <div class="col-sm-8">

                                    <%
                                        String des = "";
                                        ResultSet rs7 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                                        if (rs7.next()) {


                                            des = rs7.getString("des");


                                    %>

                                    <%=des%> 

                                    <%

                                        }

                                    %>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <i class="fa fa-plus" style="cursor:pointer" id="show_plus_icon"></i>
                            <i class="fa fa-minus" style="cursor:pointer;display:none" id="show_minus_icon"></i>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h3>Ratings & Reviews</h3>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:2%">
                            <button class="btn btn-primary btn-block border-0 py-2" style="color:white">Rate Product</button>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>




                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h5>Have doubts regarding this product?</h5>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:1%">
                            <input type="button" class="btn btn-primary btn-block border-0 py-2"style="color:white"data-toggle="modal" data-target="#myModal1"  value="Post Your Question">
                        </div>
                    </div>

                </div>









                <%
                } else {
                %>
                <div class="col-sm-5 " style="margin-top:1%;margin-bottom: 2%;">
                    <div class="row">
                        <div class="col-sm-3 " ></div>
                        <div class="col-sm-9 " >
                            <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg"style="height:400px"  id="9-row-img" alt="Image"/> 

                        </div>
                    </div>


                    <div class="row" style="margin-top:2%;">
                        <%
                            String photo_code = "";
                            String product_size = "";
                            ResultSet rs11 = st2.executeQuery("select * from addtocart where user_email='" + email + "' AND product_code='" + product_code + "' AND photo_code='" + img_code + "'");
                            if (rs11.next()) {
                                photo_code = rs11.getString("photo_code");
                                product_size = rs11.getString("product_size");
                        %>
                        <div class="col-sm-6" >
                            <a href="ucart.jsp"> <button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="<%=photo_code%>"rel3="<%=product_size%>"style="color:white"id="removefromcart2" rel4="1">GO TO CART</button></a>
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart1" rel4="1"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                        </div>

                        <%

                        } else {


                        %>
                        <div class="col-sm-6"  >
                            <button class="btn btn-warning" rel="<%=product_code%>"  rel1="<%=product_sub_category%>" style="background-color: #FFB200"id="addtocart"rel4="0"><i class="fa fa-shopping-cart" style="color:white">&nbsp;&nbsp;ADD TO CART</i></button>

                            <a href="ucart.jsp"><button class="btn btn-danger" rel="<%=product_code%>"  rel1="<%=product_price%>"  rel2="" rel3=""style="color:white"id="removefromcart3" rel4="0">GO TO CART</button></a>


                        </div>
                        <%
                            }
                        %>
                        <div class="col-sm-6">
                            <button class="btn btn-warning" style="background-color: #FF7E00" id="buynow"><i class="fa fa-bolt" style="color:white">&nbsp;&nbsp;BUY NOW</i></button>
                        </div>
                    </div>
                </div> 


                <div class="col-sm-1" style="margin-top:2%" >
                     <%
                            String color_code="gray";
                     ResultSet rs12 = st2.executeQuery("select color_code from fav_product where email='" + email + "' AND product_code='" + product_code + "' ");
                            if (rs12.next()) {
                                color_code=rs12.getString("color_code"); 
                            }
                                
                                %>
                     <i class="fa fa-heart" id="color-<%=product_code%>" rel="<%=product_code%>" style="color:<%=color_code%>"></i> 


                </div>
                <!---
                <div class="row">
                    <div class="col-sm-3 "  >
                        <div id="header-carousel" class="carousel slide" data-ride="carousel"data-interval="false" >
                            <div class="carousel-inner">

                                <div class="carousel-item active"  >
                                    <div class="row" id="carousel-row">
                                        <div class="col-sm-12">
                                            <img class="img-fluid"  src="product_photos/<%=product_code%>_1.jpg"  height="100px"id="carousel-img" alt="Image"/> 


                                        </div>
                                           
                                             <div class="col-sm-12">
                                            <img class="img-fluid"  src="product_photos/<%=product_code%>_2.jpg"   height="200px"id="carousel-img" alt="Image"/> 


                                        </div>
                                        
                                        



                                    </div>



                                </div>




                            </div>
                            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel" data-slide="next" >
                                <i class="fa fa-angle-right"  ></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <img class="img-fluid" src="product_photos/<%=product_code%>_1.jpg" style="height:350px"  alt="Image"/> 

                    </div>-->

                <div class="col-sm-6" style="margin-top:2%"> 
                    <div class="row"> 
                        <div class="col-sm-12"> 
                            <span><%=shop_name%></span>
                        </div>
                        <div class="col-sm-12">
                            <h5 style="color:black"><%=product_title%></h5> 
                        </div>
                        <div class="col-sm-12">
                            <h6 style="color:green">Special price</h6>
                        </div>
                        <div class="col-sm-12">
                            <i class="fa fa-rupee" style="font-size:25px;color:black"></i>
                            <span style="font-size:28px;color:black" id="price_change"><%=product_price%></span> 
                            &nbsp;&nbsp;
                            <i class="fa fa-rupee" style="color:black">
                                <span style="color:gray"  id="offer_change"> <s><%=offerprice%></s></span> </i> 
                            <span style="color:green" > 40% off</span> </i>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h6 style="color:black">Available offers</h6>

                                </div>

                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Special PriceGet extra 22% off (price inclusive of discount)</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Partner OfferSign up for E-shop Pay Later and get E-shop Gift Card worth ₹100*</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer10% off on ICICI Bank Credit Cards, up to ₹300. On orders of ₹1750 and above</span>
                                </div>
                                <div class="col-sm-12">
                                    <img src="offer-icon/c22c9fc4-0555-4460-8401-bf5c28d7ba29 (1).webp" style="height:25px">
                                    <span style="color:black">Bank Offer5% Cashback on E-shop Axis Bank Card</span>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12">
                            <img src="offer-icon/download.svg" style="height:25px">
                            <span>Deliver to</span>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-6" >
                            <%
                                String address_from_tabel = "";
                                int address = 0;
                                ResultSet rs8 = st.executeQuery("select * from addtocart where user_email='" + email + "' ");
                                if (rs8.next()) {
                                    address = 1;

                                    address_from_tabel = rs8.getString("address");

                            %>                               
                            <input class="form-control"  id="pincode" readonly rel="<%=address%>" value="<%=address_from_tabel%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>
                            <%
                            } else {


                            %>

                            <input class="form-control"  id="pincode"  rel="<%=address%>" placeholder="Enter delivery pincode">
                            <span id="pincode_span"></span>    

                            <%
                                }

                            %>
                        </div>
                        <div class="col-sm-6">
                            <%
                                if (address == 0) {

                            %>
                            <button class="btn btn-success" id="check_pincode_verify">Check</button>
                            <%                                }%>
                        </div>

                        <div class="col-sm-12">



                            <span>Color</span>

                            <div class="row">
                                <div class="col-sm-12"  >

                                    <div class="row" >
                                        <div class="col-sm-2" >
                                            <div class="navx" id="1">
                                                <div class="head">
                                                    <img class="img-fluid"  id="pr_1" src="product_photos/<%=product_code%>_1.jpg"  rel="<%=product_code%>_1"  rel1="0"style="height:100px;"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 ">
                                            <div class="navx"id="2">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_2" src="product_photos/<%=product_code%>_2.jpg" rel="<%=product_code%>_2" rel1="0"style="height:100px"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 "  >
                                            <div class="navx" id="3">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_3" src="product_photos/<%=product_code%>_3.jpg" rel="<%=product_code%>_3" rel1="0" style="height:100px"alt=""/> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2">
                                            <div class="navx" id="4">
                                                <div class="head">
                                                    <img class="img-fluid" id="pr_4" src="product_photos/<%=product_code%>_4.jpg" rel="<%=product_code%>_4" rel1="0" style="height:100px"alt=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-12" id="photo_row" style="margin-top:1%" >



                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" >
                            <span>Size</span>
                        </div>
                        <div class="col-sm-12" >
                            <div class="row">
                                <%
                                    int sn = 1;
                                    ResultSet rs1 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                    while (rs1.next()) {


                                        size1 = rs1.getString("size");
                                        String shouse_color = rs1.getString("color");



                                %>
                                <div class="col-sm-2"  style="border-color:#F1F2F4;cursor:pointer;height:30px;" >
                                    <div class="card" id="select-<%=sn%>" rel="<%=product_code%>" rel1="<%=sn%>">
                                        <div class="header" > 
                                            <span style="color:black" class="size-<%=sn%>" id="size-<%=product_code%>" rel="<%=product_code%>" rel1="0"><center><%=size1%></center></span> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1"  >

                                </div>
                                <%
                                        sn++;
                                    }
                                %>
                                <div class="col-sm-12" id="size_row"  style="margin-top:1%">


                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:10px">

                        </div>
                        <div class="col-sm-10" >
                            <h5 style="color:black">Product Details</h5>
                            <div class="row" style="display:none" id="show_product_info">
                                <div class="col-sm-4">
                                    Available Color
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%
                                            String show_size = "";
                                            String color = "";
                                            ResultSet rs5 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs5.next()) {


                                                show_size = rs5.getString("size");
                                                color = rs5.getString("color");



                                        %>
                                        <div class="col-sm-4">
                                            <%=color%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Available Size
                                </div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <%


                                            ResultSet rs6 = st.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                                            while (rs6.next()) {


                                                show_size = rs6.getString("size");


                                        %>
                                        <div class="col-sm-2">
                                            <%=show_size%> 
                                        </div>
                                        <%

                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="height:100px"></div>
                                <div class="col-sm-4">
                                    Description
                                </div>
                                <div class="col-sm-8">

                                    <%
                                        String des = "";
                                        ResultSet rs7 = st.executeQuery("select * from product where status='1' AND product_code='" + product_code + "' ");
                                        if (rs7.next()) {


                                            des = rs7.getString("des");


                                    %>

                                    <%=des%> 

                                    <%

                                        }

                                    %>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <i class="fa fa-plus" style="cursor:pointer" id="show_plus_icon"></i>
                            <i class="fa fa-minus" style="cursor:pointer;display:none" id="show_minus_icon"></i>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>
                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h3>Ratings & Reviews</h3>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:2%">
                            <button class="btn btn-primary btn-block border-0 py-2" style="color:white">Rate Product</button>
                        </div>
                        <div class="col-sm-12" style="background-color:#F1F2F4;height:2px">

                        </div>




                        <div class="col-sm-12" style="height:20px">

                        </div>
                        <div class="col-sm-8">
                            <h5>Have doubts regarding this product?</h5>
                        </div>
                        <div class="col-sm-4" style="margin-bottom:1%">
                            <input type="button" class="btn btn-primary btn-block border-0 py-2"style="color:white"data-toggle="modal" data-target="#myModal1"  value="Post Your Question">
                        </div>
                    </div>

                </div>





                <%
                            }
                        }




                    } catch (Exception e) {
                    }





                %>
            </div>
        </div>
        <!--- post your question part  modal start-->
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

        <!--- post your question part modal end-->

        <!--- successfully post your question part  modal start-->
        <div class="modal" id="myModal_submit_success" >
            <button type="button" class="close" data-dismiss="modal" style="margin-top:9%;margin-right:18%;font-size:30px;color:white">&times;</button>

            <div class="modal-dialog">

                <div class="modal-content" style="width:150%;margin-left:-100px;margin-top:25%;height:370px">



                    <div class="container-fluid">
                        <div class="row" style="margin-top:5%">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9">

                                <center><img src="offer-icon/msg.svg"></center>




                            </div>
                            <div class="col-sm-12">

                                <h4><center>Question Posted Successfully</center></h4>




                            </div>
                            <div class="col-sm-12">

                                <center> <h4 id="show_success_question"></h4></center>




                            </div>
                            <div class="col-sm-12">
                                <center><h5>Will notify you when someone answers your question.</h5></center>
                            </div>
                            <div class="col-sm-12">
                                <center><button class="btn btn-primary" class="close" data-dismiss="modal"style="color:white">CONTINUE SHOPPING</button></center>
                            </div>

                        </div>
                    </div>
                </div>





            </div>




        </div>


        <!--- successfully post your question part modal end-->


        <!-- Products End -->
        <!-- Featured Start -->

        <!-- Featured End -->


        <!-- Vendor Start -->

        <!-- Vendor End -->
        <div class="modal" id="myModalx">
            <div class="modal-dialog" style="margin-top:15%;height:250px">
                <div class="modal-content">


                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">


                                <div class="col-sm-4"></div>
                                <div class="col-sm-8">
                                    <center><img src="offer-icon/msg.svg" style="height:100px"></center>


                                </div>
                                <div class="col-sm-12" >
                                    <h6><center>Item added to cart please visit cart to view</center></h6>
                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="button"  class="btn btn-danger btn-block py-2" style="color:white"  data-dismiss="modal" value="CONTINUE SHOPPING">
                                        </div>
                                        <div class="col-sm-6">
                                            <a href="ucart.jsp"><button style="color:white" class="btn btn-success btn-block py-2">VIEW CART</button></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <!------- remove from cart modal start-->
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




        <!----remove from cart modal end-->
        <div class="modal" id="myModal_remove_add_to_cart1">
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
                                            <input type="button" id="removeforcart1" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <div class="modal" id="myModal_remove_add_to_cart2">
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
                                            <input type="button" id="removeforcart2" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>
        <div class="modal" id="myModal_remove_add_to_cart3">
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
                                            <input type="button" id="removeforcart3" rel=""  rel2=""rel1=""style="background-color:#3392F3;color:white" value="REMOVE">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </div>
        </div>

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
    
</html>
             
             
             
             
             <%

            //response.sendRedirect("index.jsp");
        }




    %>
</html>