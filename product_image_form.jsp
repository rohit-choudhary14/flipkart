<%--  
        Document   : product_image_form
        Created on : 16 Apr, 2022, 4:51:47 AM
        Author     : rohit
--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/css/dropify.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    #save{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #preview{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #save1{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #preview1{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #save2{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #preview2{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #save3{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
    #preview3{
        width: 100%;
        padding: 12px 20px;

        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    } 
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
            <form method="post"  enctype="multipart/form-data" id="frm">

                <input type="file" id="file" name="file" class="dropify_"  data-default-file=""  rel="" required>
                <span id="info1"></span>

        </div>
        <div class="col-sm-3" style="margin-top:2%">   
            <button   type="button" id="save"  class="btn btn-primary btn-block" style="background-color:#3392F3;border-color:#3392F3"onclick="addphoto()">Save</button>

        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="preview" data-toggle="modal" data-target="#myModal1"  class="btn btn-primary"  style="background-color:#3392F3;border-color:#3392F3" >Preview</button>

        </div>
        </form>

        <div class="col-sm-6">
            <form method="post"  enctype="multipart/form-data" id="frm1">

                <input type="file" id="file1" name="file" class="dropify_"  data-default-file=""  rel="" required >
                <span id="info2"></span>

        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="save1"  class="btn btn-primary btn-block"  style="background-color:#3392F3;border-color:#3392F3" onclick="addphoto1()">Save</button>

        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="preview1" data-toggle="modal" data-target="#myModal2"  class="btn btn-primary"  style="background-color:#3392F3;border-color:#3392F3" >Preview</button>

        </div>
        </form>

        <div class="col-sm-6">
            <form method="post"  enctype="multipart/form-data" id="frm2">

                <input type="file" id="file2" name="file" class="dropify_"  data-default-file=""  rel="" required>
                <span id="info3"></span>
        </div>
        <div class="col-sm-3"  style="margin-top:2%">
            <button   type="button" id="save2"  class="btn btn-primary btn-block"style="background-color:#3392F3;border-color:#3392F3" onclick="addphoto2()">Save</button>

        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="preview2" data-toggle="modal" data-target="#myModal3"  class="btn btn-primary"  style="background-color:#3392F3;border-color:#3392F3" >Preview</button>

        </div>
        </form>

        <div class="col-sm-6">
            <form method="post"  enctype="multipart/form-data" id="frm3">

                <input type="file" id="file3" name="file" class="dropify_"  data-default-file=""  rel="" required>
                <span id="info4"></span>
        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="save3"  class="btn btn-primary btn-block" style="background-color:#3392F3;border-color:#3392F3" onclick="addphoto3()">Save</button>

        </div>
        <div class="col-sm-3" style="margin-top:2%">
            <button   type="button" id="preview3" data-toggle="modal" data-target="#myModal4"  class="btn btn-primary"  style="background-color:#3392F3;border-color:#3392F3" >Preview</button>

        </div>
        </form>
        <div class="col-sm-12" >
            <a class="btn btn-danger btn-block" id="ADMIN" href="sellerOnboarding.jsp">SEND TO AD</a>
        </div>
    </div>
</div>
<script src="jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js"></script>
<script>
                var dvE = $('#file').dropify({
                });
                dvE = dvE.data('dropify')
                function addphoto()
                {


                    var pr = $("#code").attr("rel");
                    var form = $('#frm')[0];
                    var formdata = [];
                    var sn = 1;
                    var name = $('#file').attr("rel");
                    var bypassdata = $('#file').val();
                    formdata = new FormData(form);

                    if (bypassdata.length > 0) {
                        $("#info1").html(" ");

                        $.ajax({
                            type: 'post',
                            url: "product_image_upload_Process.jsp?pc=" + name + "&sn=" + sn + "",
                            data: formdata,
                            contentType: false,
                            cache: false,
                            processData: false,
                            success: function(data) {

                                $("#save").text("Saved");
                                $("#preview").show();
                                $("#preview_image_1").attr("src", "product_photos/" + name + "_1.jpg");
                            },
                            error: function(data) {
                                alert(data);
                                //alert("fail");
                            }

                        });
                    }
                    else {
                        $("#info1").html("<span style='color:red'>Please Choose A File</span>");
                    }
                }

</script>
<!------ First photo script end-->
<script>
    var dvE = $('#file1').dropify({
    });
    dvE = dvE.data('dropify')
    function addphoto1()
    {


        //var pr = $("#code").attr("rel");
        var form = $('#frm1')[0];
        var formdata = [];
        var sn = 2;
        var name = $('#file1').attr("rel");
        var bypassdata = $('#file1').val();
        formdata = new FormData(form);
        if (bypassdata.length > 0) {
            $("#info2").html(" ");
            $.ajax({
                type: 'post',
                url: "product_image_upload_Process.jsp?pc=" + name + "&sn=" + sn + "",
                data: formdata,
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {

                    $("#save1").text("Saved");
                    $("#preview1").show();
                    // $("#preview_image_1").html("<img src='product_photos/"+name+"_2.jpg'>");
                    $("#preview_image_2").attr("src", "product_photos/" + name + "_2.jpg");



                },
                error: function(data) {
                    alert(data);
                    //alert("fail");
                }

            });
        }
        else {
            $("#info2").html("<span style='color:red'>Please Choose A File</span>");
        }
    }

</script>
<!-- second photo script end-->
<script>
    var dvE = $('#file2').dropify({
    });
    dvE = dvE.data('dropify')
    function addphoto2()
    {


        //var pr = $("#code").attr("rel");
        var form = $('#frm2')[0];
        var formdata = [];
        var sn = 3;
        var name = $('#file2').attr("rel");
        var bypassdata = $("#file2").val();
        formdata = new FormData(form);
        if (bypassdata.length > 0) {
            $("#info3").html(" ");
            $.ajax({
                type: 'post',
                url: "product_image_upload_Process.jsp?pc=" + name + "&sn=" + sn + "",
                data: formdata,
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {

                    $("#save2").text("Saved");
                    $("#preview2").show();
                    $("#preview_image_3").attr("src", "product_photos/" + name + "_3.jpg");



                },
                error: function(data) {
                    alert(data);
                    //alert("fail");
                }

            });
        }
        else {
            $("#info3").html("<span style='color:red'>Please Choose A File</span>");
        }
    }

</script>
<!-- third photo script end-->
<script>
    var dvE = $('#file3').dropify({
    });
    dvE = dvE.data('dropify')
    function addphoto3()
    {


        //var pr = $("#code").attr("rel");
        var form = $('#frm3')[0];
        var formdata = [];
        var sn = 4;
        var name = $('#file3').attr("rel");
        var bypassdata = $("#file3").val();
        formdata = new FormData(form);
        if (bypassdata.length > 0) {
            $("#info4").html(" ");
            $.ajax({
                type: 'post',
                url: "product_image_upload_Process.jsp?pc=" + name + "&sn=" + sn + "",
                data: formdata,
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {

                    $("#save3").text("Saved");

                    $("#preview3").show();
                    $("#preview_image_4").attr("src", "product_photos/" + name + "_4.jpg");
                    $("#ADMIN").show();


                },
                error: function(data) {
                    alert(data);
                    //alert("fail");
                }

            });
        }
        else {
            $("#info4").html("<span style='color:red'>Please Choose A File</span>");
        }
    }

</script>
<!-- forth photo script end-->
<script>
    $(document).ready(function() {

        var pr = $("#code").attr("rel");
        $("#file").attr("rel", pr);
        $("#file1").attr("rel", pr);
        $("#file2").attr("rel", pr);
        $("#file3").attr("rel", pr);
        $("#preview").hide();
        $("#preview1").hide();
        $("#preview2").hide();
        $("#preview3").hide();
        $("#ADMIN").hide();

    });
</script>
<div class="modal" id="myModal1" >
    <div class="modal-dialog">
        <div class="modal-content" style="width:200%;margin-left:-220px">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" style="overflow: scroll">

                <div class="container-fluid">

                    <div class="row">

                        <div class="col-sm-12"style="width:200%" >
                            <img src="" alt="img" id="preview_image_1">
                        </div>
                    </div>

                </div>
            </div>



        </div>




    </div>
</div>
<div class="modal" id="myModal2" >
    <div class="modal-dialog">
        <div class="modal-content" style="width:200%;margin-left:-220px">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" style="overflow: scroll">

                <div class="container-fluid">

                    <div class="row">

                        <div class="col-sm-12"style="width:200%" >
                            <img src="" alt="img" id="preview_image_2">
                        </div>
                    </div>

                </div>
            </div>



        </div>




    </div>
</div>
<div class="modal" id="myModal3" >
    <div class="modal-dialog">
        <div class="modal-content" style="width:200%;margin-left:-220px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>


            <!-- Modal body -->
            <div class="modal-body" style="overflow: scroll">

                <div class="container-fluid">

                    <div class="row">

                        <div class="col-sm-12"style="width:200%" >
                            <img src="" alt="img" id="preview_image_3">
                        </div>
                    </div>

                </div>
            </div>



        </div>




    </div>
</div>
<div class="modal" id="myModal4" >
    <div class="modal-dialog">
        <div class="modal-content" style="width:200%;margin-left:-220px">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="overflow: scroll">

                <div class="container-fluid">

                    <div class="row">

                        <div class="col-sm-12"style="width:200%" >
                            <img src="" alt="img" id="preview_image_4">
                        </div>
                    </div>

                </div>
            </div>



        </div>




    </div>
</div>