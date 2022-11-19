<%--  
    Document   : searchproduct
    Created on : 18 May, 2022, 11:56:52 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%> 
<%
    String keyword = "";
    String product_code = "";
    String product_title = "";
    int product_price=0;
    int flag=0;
    if (request.getParameter("search_keyword").length() == 0) {
    } else {

        keyword = request.getParameter("search_keyword");
        %>
        <script>
            
            
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
        </script>
        
        <style>
             .col-sm-12.hide{
                display:none;
            }
            #product_show{
                display:none;
            }
            #cardresult{


                box-shadow:1px 1px 10px rgba(0,0, 0, 0.2);



            }
            a:hover{
                color:blue;
            }
            
            
            </style>
        <div class="container-fluid" >
    <div class="row" id="cardresult" style="margin-top:1%;">
        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4">
           
        </div>
        <div class="col-sm-12" style="margin-top:2%;margin-bottom:2%">
            <h3>Showing result for "<%=keyword%>"</h3> 
        </div>
         <div class="col-sm-12" style="height:1px;background-color:#F1F2F4">
           
        </div>


        <%
        try {


            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
            Statement st = cn.createStatement();
            Statement st1 = cn.createStatement();
             Statement st2 = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from product where title like'%"+keyword+"%' OR sub_category  like'%"+keyword+"%' ORDER BY RAND() ");

            while (rs.next()) {
                product_code = rs.getString("product_code");
                product_title = rs.getString("title");
                flag=1;
                ResultSet rs1 = st1.executeQuery("select * from product_list where product_code='" + product_code + "'  AND status='1'");
                if(rs1.next()) {
                    product_price=Integer.parseInt(rs1.getString("price")); 
                    int offer_price=(product_price*40)/100;
                    offer_price=offer_price+product_price;
        %>
        
        <div class="col-sm-3" style="height:auto">

                            <div class="row" style="margin-left:10px;margin-right:10px">

                                <div class="col-sm-12" id="" rel="<%=product_code%>" style="height:300px;" >


                                    <center> <img src="product_photos/<%=product_code%>_1.jpg" alt="img" style="display:inline-block;height:150px;margin-top:3%"  class="img-fluid">
                                     </center>
                                    <div class="row">

                                        <div class="col-sm-12"  >
                                            <center> <a href="viewproduct.jsp?v=<%=product_code%>" ><b> <%=product_title%></b></a>
                                        </center>
                                        </div>

                                        <div class="col-sm-12" >
                                            <center> <h6> <i class="fa fa-rupee"></i><%=product_price%>&nbsp;
                                          <s> <i class="fa fa-rupee"></i><%=offer_price%></s>
                                          &nbsp;<span style="color:green">40% off</span></h6></center>
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

            <div  class="col-sm-12" style="height:10px">

            </div>


        </div>




        <%

                }
                
                

            }
            if(flag==0){
                
            
            
        %>
<div class="col-sm-4"></div>
                            <div class="col-sm-8">
                                <img src="offer-icon/03494b209a1511a61868ced337b97931.webp">
                            </div>
    </div>
</div>
        

<%
            }
        } catch (Exception e) {
        }
    }



%>