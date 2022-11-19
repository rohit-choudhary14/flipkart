<%--  
    Document   : filter_result
    Created on : 9 May, 2022, 3:25:07 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<style>
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
<script>
    $(document).ready(function(){
        
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
    });
    
    
    
    
    </script>
<%
    String price = "";
    String price1 = "";
    String email = "";
    String sub_category = "";
    String product_code = "";
    String new_product_code = "";
    String description = "";
    String mrp = "";

    String title = "";
    
        if (request.getParameter("sub_category").length() == 0 || request.getParameter("price").length() == 0 || request.getParameter("price1").length() == 0) {
        } else {

            price = request.getParameter("price");
            price1 = request.getParameter("price1");
            sub_category = request.getParameter("sub_category");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
                Statement st = cn.createStatement();
                Statement st1 = cn.createStatement();
                Statement st2 = cn.createStatement();
                Statement st3 = cn.createStatement();
                if (sub_category.equals("Laptops")||sub_category.equals("Washing Machines")) {
                    ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_category + "' AND status='1'");
                    while (rs.next()) {
                        product_code = rs.getString("product_code");
                        ResultSet rs1 = st1.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1' AND price>'" + price + "' && price<'" + price1 + "'");
                        while (rs1.next()) {
                            //out.println(rs1.getString("product_code"));
                            new_product_code = rs1.getString("product_code");
                            mrp = rs1.getString("price");
                            ResultSet rs2 = st2.executeQuery("select * from product where product_code='" + new_product_code + "' AND status='1'");
                            if (rs2.next()) {
                                title = rs2.getString("title");
                                description = rs2.getString("des");

                            }

%>
<div  class="col-sm-12 " style="margin-left:-10px;">
    <div class="row">
        <div class="col-sm-3"  style="margin-top:1%">

            <div class="row">

                <div class="col-sm-12"   >
<%
                            
                            if (sub_category.equals("Washing Machines")){
                               
                            %>          

                    <img src="product_photos/<%=new_product_code%>_1.jpg" alt="img" style="margin-top:3%;height:150px"  class="img-fluid">

<%
                            }
                            else{
                                %>
                                
                                <img src="product_photos/<%=new_product_code%>_1.jpg" alt="img" style="margin-top:3%;"  class="img-fluid">

                                
                                <%
                                
                                
                                
                            }
                                
                                
                                
                                %>

                </div>

            </div>
            <div  class="col-sm-12" style="height:40px">

            </div>



        </div>
        <div class="col-sm-7" style="margin-top:1%">
            <div class="row">
                <div class="col-sm-12" >
                    <h6> <a href="viewproduct.jsp?v=<%=new_product_code%>"> <%=title%></a></h6>
                </div>
                <div class="col-sm-12" >
                    <%
                        String des[] = description.split(",");

                        for (int i = 0; i < des.length; i++) {

                    %>
                    <li style="font-size:14px;color:black"> <%=des[i]%></li>    
                        <%

                            }

                        %>
                </div>
            </div>

        </div>
        <div class="col-sm-2"  style="margin-top:1%">
            <div class="col-sm-12" >
                <h6 style="font-size:20px"> <i class="fa fa-rupee"></i><%=mrp%></h6>
            </div>
        </div>
        <div  class="col-sm-12" style="height:1px;background-color:#F1F2F4">

        </div>



    </div>
</div>






<%
        }
    }
} else {
%>

<div class="row">
<%
        int flag=0;            
    ResultSet rs = st.executeQuery("select * from product where sub_category='" + sub_category + "' AND status='1'");
    while (rs.next()) {
        flag=1;
        product_code = rs.getString("product_code");
        ResultSet rs1 = st1.executeQuery("select * from product_list where product_code='" + product_code + "' AND status='1' AND price>'" + price + "' && price<'" + price1 + "'");
        if (rs1.next()) {
            
            //out.println(rs1.getString("product_code"));
            new_product_code = rs1.getString("product_code");
            mrp = rs1.getString("price");
            ResultSet rs2 = st2.executeQuery("select * from product where product_code='" + new_product_code + "' AND status='1'");
            if (rs2.next()) {
                title = rs2.getString("title");
                description = rs2.getString("des");

            }

%>
 
<div class="col-sm-4">

    <div class="row" style="margin-left:10px;margin-right:10px">

        <div class="col-sm-12 lg" id="" rel="<%=new_product_code%>" style="height:300px;" >


            <img src="product_photos/<%=new_product_code%>_1.jpg" alt="img" style="display:inline-block;height:250px;margin-top:3%"  class="img-fluid">

            <div class="row">

                <div class="col-sm-12" >
                    <h6> <a href="viewproduct.jsp?v=<%=new_product_code%>" > <%=title%></a></h6> 
                </div>

                <div class="col-sm-12" >
                    <h6> <i class="fa fa-rupee"></i><%=mrp%></h6>
                </div>
                <div class="col-sm-12 hide" id="hide-<%=new_product_code%>">
                    <span>Size</span>
                </div> 
                <%
                    String product_size = "";

                    ResultSet rs3 = st3.executeQuery("select * from product_list where product_code='" + new_product_code + "' AND status='1'");
                    while (rs3.next()) {
                        product_size = rs3.getString("size");




                %>

                <div class="col-sm-3 show-<%=new_product_code%>" id="product_show"   >

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
                    }
    %>
    
    </div>
    
    <%

                if(flag==0){
                            %>
                            
                            <div class="col-sm-12">
                                <img src="offer-icon/03494b209a1511a61868ced337b97931.webp" style="margin-left:230px">
                            </div>
                            
                            <%
                            }

                }
            } catch (Exception e) {
            }

        }

   
%>