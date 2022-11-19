<%-- 
    Document   : product_info_form_1
    Created on : 16 Apr, 2022, 12:05:41 AM
    Author     : rohit
--%>

<script>

    $(document).ready(function() {
        var flag = 1;

        $("#show_size").on("click", function() {

            $("#size").show();
            $("#show_size").attr("class", "fa fa-minus");
            $(".fa.fa-minus").on("click", function() {
                $("#size").hide();
                $("#show_size").attr("class", "fa fa-plus");
            });
        });
        $("#submit_image_form").on("click", function() {
            var id = $(this).attr("rel"); //a
            var product_sizex = $("#product_size-" + id).val();
            var product_colorx = $("#product_color-" + id).val();
            var product_pricex = $("#product_price-" + id).val();
            var product_code = $("#code").attr("rel");
            var product_currency = $("select").val();
            

            if (product_sizex.length > 0 && product_colorx.length > 0 && product_pricex.length > 0) {

                $.post(
                        "product_size_info.jsp", {product_currency: product_currency, product_code: product_code, product_size: product_sizex, product_color: product_colorx, product_price: product_pricex}, function(data) {
                    
                    if (data.trim() === "success") {
                        $("#next_form2").load("product_image_form.jsp");
                    }
                });
            }
            else if (product_sizex.length <= 0 || product_colorx.length <= 0 || product_pricex.length <= 0) {

                $("#load-" + id).html("<span style='color:red'>Please fill the above  mentioned fileds</span>");
            }

        });
        $(".fa.fa-plus").on("click", function() {
            var id = $(this).attr("id"); //a
            var num = [];

            var product_sizex = $("#product_size-" + id).val();
            var product_colorx = $("#product_color-" + id).val();
            var product_pricex = $("#product_price-" + id).val();
            var product_code = $("#code").attr("rel");
            var product_currency = $("#select-" + id).val();

            if (flag<=3 && product_sizex.length > 0 && product_colorx.length > 0 && product_pricex.length > 0) {



                $.post(
                        "product_size_info.jsp", {product_currency: product_currency, product_code: product_code, product_size: product_sizex, product_color: product_colorx, product_price: product_pricex}, function(data) {
                   
                    if (data.trim() === "success") {
                        flag++;

                       
                    }


                });
                $("#load-" + id).html("");
                if (id === "a") {

                    $("#load-" + id).html("<div class='container-fluid'><div class='row'><div class='row'><div class='col-sm-3'><input type='text' id='product_size-b' class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' id='product_color-b'class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' class='form-control'id='product_price-b' style='width:100%'></div><div class='col-sm-2' style='margin-top:1%'><select class='form-control'id='select-b' style='width:120%'><option id='product_currency-b'>INR</option><option id='product_currency-b'>USD</option></select></div><div class='col-sm-1' style='margin-top:2%'></div></div></div></div>");
                    $(this).attr("id", "b");
                    num = $(this).attr("id");


                }
                else if (id === "b") {

                    $("#load-" + id).html("<div class='container-fluid'><div class='row'><div class='row'><div class='col-sm-3'><input type='text' id='product_size-c' class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' id='product_color-c' class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' class='form-control'id='product_price-c' style='width:100%'></div><div class='col-sm-2' style='margin-top:1%'><select class='form-control' id='select-c'style='width:120%'><option id='product_currency-c'>INR</option><option id='product_currency-c'>USD</option></select></div><div class='col-sm-1' style='margin-top:2%'> </div></div></div></div>");
                    $(this).attr("id", "c");
                    num = $(this).attr("id");
                }
                else if (id === "c") {

                    $("#load-" + id).html("<div class='container-fluid'><div class='row'><div class='row'><div class='col-sm-3'><input type='text'  id='product_size-d'class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' id='product_color-d' class='form-control'style='width:120%'></div><div class='col-sm-3'><input type='text' class='form-control'id='product_price-d' style='width:100%'></div><div class='col-sm-2' style='margin-top:1%'><select class='form-control'id='select-d' style='width:120%'><option id='product_currency-d'>INR</option><option id='product_currency-d'>USD</option></select></div><div class='col-sm-1' style='margin-top:2%'></div></div></div></div>");
                    $(this).attr("id", "d");
                    num = $(this).attr("id");
                }






            }

            else if (product_sizex.length <= 0 && product_colorx.length <= 0 && product_pricex.length <= 0) {

                $("#load-" + id).html("<span style='color:red'>Please fill the above  mentioned fileds</span>");
            }
            $("#new_submit").html("<button class='btn btn-primary'id='submit_again'style='background-color:#3392F3;border-color:#3392F3'>Save</button>");
            $("#submit_again").on("click", function() {
                for (var i = 0; i < num.length; i++) {
                   
                    var product_size = $("#product_size-" + num[i]).val();
                    var product_color = $("#product_color-" + num[i]).val();
                    var product_price = $("#product_price-" + num[i]).val();
                    var product_codex = $("#code").attr("rel");
                    var product_currencyx = $("#select-" + num[i]).val();

                    if (product_size.length <= 0 || product_color.length <= 0 || product_price.length <= 0) {

                        $("#load-" + num[i]).html("<span style='color:red'>Please fill the above  mentioned fileds</span>");
                    }
                    if (product_size.length > 0 && product_color.length > 0 && product_price.length > 0) {



                        $.post(
                                "product_size_info.jsp", {product_currency: product_currencyx, product_code: product_codex, product_size: product_size, product_color: product_color, product_price: product_price}, function(data) {
                                 
                                 $("#next_form2").load("product_image_form.jsp");
                                


                        });
                    }

                }

            });

           if(flag==3){
           
           $("#more_fields").html("");
           }
        });
    });
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header" id="next_form2">
    <div class="login-form" style="overflow:scroll;"  >


        <div class="form-group">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <span style="color:red">*All Field Are Mandatory To Fill</span>
                    </div>




                    <!--product row start-->
                    <div class="col-sm-12">

                        <div class="row">
                            <div class="col-sm-3">
                                <label>Size</label>
                            </div>
                            <div class="col-sm-3">
                                <label>Color</label>
                            </div>
                            <div class="col-sm-3">
                                <label>Price</label>
                            </div>
                            <div class="col-sm-3">

                            </div>

                            <div class="col-sm-3">

                                <input type="text"  id="product_size-a"class="form-control"  style="width:120%">

                            </div>

                            <div class="col-sm-3" >
                                <input type="text" id="product_color-a" class="form-control"  style="width:120%">


                            </div>
                            <div class="col-sm-3">

                                <input type="text" id="product_price-a" class="form-control" style="width:100%">

                            </div>
                            <div class="col-sm-2" style="margin-top:1%">
                                <select class="form-control" id="select-a" style="width:120%">
                                    <option>INR</option>
                                    <option>USD</option>
                                </select>

                            </div>
                            <div class="col-sm-1" style="margin-top:2%" id="more_fields">
                                <i class="fa fa-plus" id="a" style="font-size:20px;cursor:pointer"></i>
                            </div>
                            <div class="col-sm-12" id="message_box">

                            </div>


                        </div>

                    </div>

                    <!--product row end-->


                </div>
            </div>

            <div class="col-sm-12" id="load-a">

            </div>
            <div class="col-sm-12" id="load-b">

            </div>
            <div class="col-sm-12" id="load-c">

            </div>
            <div class="col-sm-12" id="load-d">

            </div>


        </div>




        <div class="form-group">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-sm-12" id="new_submit">


                        <button class="btn btn-primary"  id="submit_image_form" rel="a"   style="background-color:#3392F3;border-color:#3392F3">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix">

        </div>        


    </div>
</div>