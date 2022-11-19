package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>E-Shopp</title>\n");
      out.write("        <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("        <meta content=\"Free HTML Templates\" name=\"keywords\">\n");
      out.write("        <meta content=\"Free HTML Templates\" name=\"description\">\n");
      out.write("\n");
      out.write("        <!-- Favicon -->\n");
      out.write("        <link href=\"img/favicon.ico\" rel=\"icon\">\n");
      out.write("\n");
      out.write("        <!-- Google Web Fonts -->\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap\" rel=\"stylesheet\"> \n");
      out.write("\n");
      out.write("        <!-- Font Awesome -->\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\" integrity=\"sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn\" crossorigin=\"anonymous\">\n");
      out.write("        <!-- Libraries Stylesheet -->\n");
      out.write("        <link href=\"lib/owlcarousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <!-- Customized Bootstrap Stylesheet -->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"jquery-3.6.0.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            #card{\n");
      out.write("\n");
      out.write("\n");
      out.write("                box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            } \n");
      out.write("            body {\n");
      out.write("\n");
      out.write("                font-family: Arial, Helvetica, sans-serif;\n");
      out.write("            }\n");
      out.write("            #heart{\n");
      out.write("                color:white;\n");
      out.write("            }\n");
      out.write("            #login{\n");
      out.write("                width:70%;\n");
      out.write("                padding: 1px 10px;\n");
      out.write("\n");
      out.write("                display: inline-block;\n");
      out.write("\n");
      out.write("\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            } \n");
      out.write("            .fa-stack[data-count]:after{\n");
      out.write("  position:absolute;\n");
      out.write("  right:15px;\n");
      out.write("  top:1px;\n");
      out.write("  content: attr(data-count); \n");
      out.write("  font-size:65%;\n");
      out.write("  padding:.6em;\n");
      out.write("  border-radius:999px;\n");
      out.write("  line-height:.75em;\n");
      out.write("  color: white;\n");
      out.write("  background:rgba(255,0,0,.85);\n");
      out.write("  text-align:center;\n");
      out.write("  min-width:2em;\n");
      out.write("  font-weight:bold;\n");
      out.write("}\n");
      out.write("         .carousel-control-prev, .carousel-control-next {\n");
      out.write("                height: 100px;\n");
      out.write("                width: 40px;\n");
      out.write("                background: none;\n");
      out.write("                margin: auto 0;\n");
      out.write("                background: rgba(0,0,0,0.2);\n");
      out.write("            }\n");
      out.write("            .carousel-control-prev i, .carousel-control-next i {\n");
      out.write("                font-size: 30px;\n");
      out.write("                position: absolute;\n");
      out.write("                top: 50%;\n");
      out.write("                display: inline-block;\n");
      out.write("                margin: -16px 0 0 0;\n");
      out.write("                z-index: 5;\n");
      out.write("                left: 0;\n");
      out.write("                right: 0;\n");
      out.write("                color: rgba(0, 0, 0, 0.8);\n");
      out.write("                text-shadow: none;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("          \n");
      out.write("#cardforoffer{\n");
      out.write("\n");
      out.write("\n");
      out.write("                box-shadow:1px 1px 1px rgba(0,0, 0, 0.2);\n");
      out.write("                background-color:#483D8B;\n");
      out.write("                border-radius:15px ;\n");
      out.write("                color:white;\n");
      out.write("                margin-top:1%;\n");
      out.write("                margin-bottom:1%;\n");
      out.write("                margin-left:4%;\n");
      out.write("               \n");
      out.write("               \n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            #cardforviewall{\n");
      out.write("                box-shadow:1px 1px 1px rgba(0,0, 0, 0.2);\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            #card_for_product_div{\n");
      out.write("                box-shadow:5px 5px 12px rgba(0,0, 0, 0.2);\n");
      out.write("                margin-right:3px;\n");
      out.write("                margin-left:3px;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("                $(\"#login\").mouseover(function() {\n");
      out.write("\n");
      out.write("                    $(\"#show_login\").show();\n");
      out.write("\n");
      out.write("                });\n");
      out.write("                $(\"#login\").mouseout(function() {\n");
      out.write("                    $(\"#show_login\").hide();\n");
      out.write("\n");
      out.write("                });\n");
      out.write("                $(\".nav\").mouseover(function() {\n");
      out.write("                    var rel = $(this).attr(\"rel\");\n");
      out.write("\n");
      out.write("                    $(\"#navlink-\" + rel).css(\"color\", \"#3392F3\");\n");
      out.write("                    $(\"#down-\" + rel).attr(\"class\", \"fa fa-angle-up\");\n");
      out.write("                    $(\"#subcat-\" + rel).show();\n");
      out.write("\n");
      out.write("                });\n");
      out.write("                $(\".nav\").mouseout(function() {\n");
      out.write("                    var rel = $(this).attr(\"rel\");\n");
      out.write("\n");
      out.write("                    $(\"#navlink-\" + rel).css(\"color\", \"black\");\n");
      out.write("                    $(\"#down-\" + rel).attr(\"class\", \"fa fa-angle-down\");\n");
      out.write("                    $(\"#subcat-\" + rel).hide();\n");
      out.write("\n");
      out.write("                });\n");
      out.write("\n");
      out.write("\n");
      out.write("            });\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("<nav class=\"navbar sticky-top\" style=\"background-color:#3392F3;\">\n");
      out.write("    <h2 style=\"color:white\">E-Shop</h2>\n");
      out.write("        \n");
      out.write("                      \n");
      out.write("                \n");
      out.write("                <div class=\"col-sm-5\" >\n");
      out.write("\n");
      out.write("                    <div class=\"input-group\" style=\"background-color:white\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Search for products\">\n");
      out.write("                        <div class=\"input-group-append\">\n");
      out.write("                            <span class=\"input-group-text bg-transparent text-primary\">\n");
      out.write("                                <i class=\"fa fa-search\" style=\"color:#3392F3\" ></i>\n");
      out.write("                            </span>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-2\"  id=\"login\">\n");
      out.write("                    <div class=\"nav-item dropdown\" style=\"color:white;cursor:pointer;width:auto\">\n");
      out.write("\n");
      out.write("                        <input type=\"button\" id=\"login\" style=\"font-size:20px;background-color:white;color:#3392F3;border-color:white;width:100%\"  value=\"Login\"data-toggle=\"modal\" data-target=\"#myModal1\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"dropdown-menu position-absolute\"   id=\"show_login\">\n");
      out.write("\n");
      out.write("                            <div class=\"row\" >\n");
      out.write("                                <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\"  data-toggle=\"modal\" data-target=\"#myModal\">\n");
      out.write("                                        <span>New Customer ?</span> \n");
      out.write("                                       \n");
      out.write("                                        <span style=\"color:#3392F3\">Sign Up</span>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#myModal1\" >\n");
      out.write("                                        <i class=\"fa fa-user-circle-o\" style=\"color:#3392F3\"></i>\n");
      out.write("                                        &nbsp;&nbsp;&nbsp;&nbsp;<span>My profile</span>\n");
      out.write("                                    </a>\n");
      out.write("\n");
      out.write("                                </div> \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#myModal1\">\n");
      out.write("                                        <i class=\"fa fa-shopping-cart\" style=\"color:#3392F3\"></i>\n");
      out.write("                                        &nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                                        <span>Orders</span></a>\n");
      out.write("                                    <!--<s>hi</s>--->\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#myModal1\">\n");
      out.write("                                        <i class=\"fa fa-heart\" style=\"color:#3392F3\"></i>\n");
      out.write("                                        &nbsp;&nbsp;&nbsp;&nbsp\n");
      out.write("                                        <span>Wishlist</span>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                                 <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#myModal1\">\n");
      out.write("                                        <i class=\"fa fa-gift\" style=\"color:#3392F3\"></i>\n");
      out.write("                                        &nbsp;&nbsp;&nbsp;&nbsp\n");
      out.write("                                        <span>Gift Cards</span>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                                 <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                                    <a href=\"\" class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#myModal1\">\n");
      out.write("                                        <i class=\"fa fa-trophy\" style=\"color:#3392F3\"></i>\n");
      out.write("                                        &nbsp;&nbsp;&nbsp;&nbsp\n");
      out.write("                                        <span>Rewards</span>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>    \n");
      out.write("                <div class=\"col-sm-2\" >\n");
      out.write("                    <a href=\"#\" style=\"color:white\" >\n");
      out.write("                        <span style=\"font-size:20px\" data-toggle=\"modal\" data-target=\"#myModal1\"> Become a Seller</span> \n");
      out.write("\n");
      out.write("                    </a>\n");
      out.write("                </div>    \n");
      out.write("\n");
      out.write("                <div class=\"col-sm-1\" >\n");
      out.write("\n");
      out.write("                    <a  style=\"cursor:pointer\" >\n");
      out.write("                        \n");
      out.write("                         <i class=\"fa fa-shopping-cart\" id=\"heart\"data-toggle=\"modal\" data-target=\"#myModal1\" style=\"font-size:20px\" ></i>\n");
      out.write("                        \n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("</nav>\n");
      out.write("        <!-- Topbar End -->\n");
      out.write("        <!-- Navbar Start -->\n");
      out.write("        <div class=\"container-fluid\" >\n");
      out.write("            <div class=\"row\" id=\"card\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                ");

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



                
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-2\">\n");
      out.write("\n");
      out.write("                    <img src=\"category_photos/");
      out.print(sr);
      out.write(".webp\" style=\"height:50px;\" class=\"img-responsive\"> \n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"nav\" rel=\"");
      out.print(cat_code);
      out.write("\">\n");
      out.write("                            <a href=\"#\" class=\"nav-link\" data-toggle=\"dropdown\" style=\"color:black\"  id=\"navlink-");
      out.print(cat_code);
      out.write("\" ><span id=\"nav-");
      out.print(cat_code);
      out.write('"');
      out.write('>');
      out.print(cat_name);
      out.write("</span>\n");
      out.write("                                <i class=\"fa fa-angle-down\" id=\"down-");
      out.print(cat_code);
      out.write("\"></i></a> \n");
      out.write("                            <div class=\"dropdown-menu position-absolute  rounded-0 w-100 m-0\" id=\"subcat-");
      out.print(cat_code);
      out.write("\" style=\"background-color:white\">\n");
      out.write("                                ");

                                    ResultSet rs1 = st1.executeQuery("select *  from sub_category where cat_code='" + cat_code + "' ");
                                    while (rs1.next()) {


                                        String sub_name = rs1.getString("sub_name");



                                
      out.write("\n");
      out.write("\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\">");
      out.print(sub_name);
      out.write("</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                ");

                        sr++;
                    }
                
      out.write("\n");
      out.write("            </div>                \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            } catch (Exception e) {
            }



        
      out.write("\n");
      out.write("        <div class=\"container-fluid\" style=\"margin-top:5px;\" id=\"main\">\n");
      out.write("\n");
      out.write("            <div class=\"row\" >\n");
      out.write("                <div class=\"col-lg-12\" style=\"margin-top:1%;margin-bottom:1%\" >\n");
      out.write("\n");
      out.write("                    <div id=\"header-carousel\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("                        <div class=\"carousel-inner\">\n");
      out.write("\n");
      out.write("                            <div class=\"carousel-item active\" >\n");
      out.write("\n");
      out.write("                                <img class=\"img-fluid\" src=\"brand_photos/aede91990f2a1f7f.webp\" alt=\"Image\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"carousel-item\" >\n");
      out.write("                                <img class=\"img-fluid\" src=\"category_photos/f178ebd4a29bba0b.webp\" alt=\"Image\">\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <a class=\"carousel-control-prev\" href=\"#header-carousel\" data-slide=\"prev\">\n");
      out.write("                            <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                        </a>\n");
      out.write("                        <a class=\"carousel-control-next\" href=\"#header-carousel\" data-slide=\"next\">\n");
      out.write("                            <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container-fluid\"    >\n");
      out.write("            <div class=\"row\"   >\n");
      out.write("                 <div class=\"col-sm-12\" >\n");
      out.write("                  \n");
      out.write("                            <div class=\"row\" id=\"card_for_product_div\" >\n");
      out.write("                        <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                            <h5 style=\"float:left\">Men Footwear</h5>\n");
      out.write("                            <input type=\"button\" value=\"VIEW ALL\" class=\"btn btn-primary\" id=\"cardforviewall\" style=\"float:right;background-color:#3392F3;color:white;border-color:#3392F3;margin-bottom:1%\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-12\" style=\"height:1px;background-color:#F1F2F4\"></div>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            \n");
      out.write("                                     \n");
      out.write("                            <div id=\"header-carousel1\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">\n");
      out.write("                                <div class=\"carousel-inner\">\n");
      out.write("                                 <div class=\"carousel-item active\" >\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                     \n");
      out.write("\n");
      out.write("                ");
        
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
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            
      out.write("\n");
      out.write("                          \n");
      out.write("                                    \n");
      out.write("                                           \n");
      out.write("                                           \n");
      out.write("                                        <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                           \n");
      out.write("                                            \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                    <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code);
      out.write(".jpg\" style=\"height:150px\" alt=\"\"/> \n");
      out.write("                                                </a>\n");
      out.write("\n");
      out.write("                                                <h6 >");
      out.print(product_title);
      out.write("</h6> \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("    ");

                        }
                            
      out.write("\n");
      out.write("                          </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                      \n");
      out.write("                            <div class=\"carousel-item\" >\n");
      out.write("                           <div class=\"row\">\n");
      out.write("                              \n");
      out.write("                            ");

                           
                           
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
                
      out.write("\n");
      out.write("               \n");
      out.write("                                 \n");
      out.write("\n");
      out.write("                                 \n");
      out.write("                                       \n");
      out.write("                                                 <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                           \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code_for_new);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                    <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code_for_new);
      out.write(".jpg\" style=\"height:150px\" alt=\"\"/> \n");
      out.write("                                                </a>\n");
      out.write("\n");
      out.write("                                                <h6 >");
      out.print(product_title_for_new);
      out.write("</h6> \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price_for_new);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                            \n");
      out.write("                                        </div>\n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                ");

                        }
                            
      out.write("\n");
      out.write("                             </div>\n");
      out.write("                                              </div>\n");
      out.write(" \n");
      out.write("                               \n");
      out.write("                            ");

                        }
                        



                     catch (Exception e) {
                    }



                
      out.write("\n");
      out.write("        \n");
      out.write("                                 \n");
      out.write(" </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <a class=\"carousel-control-prev\" href=\"#header-carousel1\" data-slide=\"prev\">\n");
      out.write("                                <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                            </a>\n");
      out.write("                            <a class=\"carousel-control-next\" href=\"#header-carousel1\" data-slide=\"next\">\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                             \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                       </div>   \n");
      out.write("                              \n");
      out.write("                \n");
      out.write("                               \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("         <!---- MEN T-shirt part-->\n");
      out.write("             <div class=\"container-fluid\"    >\n");
      out.write("            <div class=\"row\"   style=\"margin-top:1%\" >\n");
      out.write("                 <div class=\"col-sm-12\" >\n");
      out.write("                  \n");
      out.write("                            <div class=\"row\" id=\"card_for_product_div\" >\n");
      out.write("                        <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                            <h5 style=\"float:left\">Men T-Shirt</h5>\n");
      out.write("                            <input type=\"button\" value=\"VIEW ALL\" class=\"btn btn-primary\" id=\"cardforviewall\" style=\"float:right;background-color:#3392F3;color:white;border-color:#3392F3;margin-bottom:1%\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-12\" style=\"height:1px;background-color:#F1F2F4\"></div>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            \n");
      out.write("                                     \n");
      out.write("                            <div id=\"header-carousel2\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">\n");
      out.write("                                <div class=\"carousel-inner\">\n");
      out.write("                                 <div class=\"carousel-item active\" >\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                     \n");
      out.write("\n");
      out.write("                ");
        
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
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            
      out.write("\n");
      out.write("                          \n");
      out.write("                                    \n");
      out.write("                                           \n");
      out.write("                                           \n");
      out.write("                                        <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                           \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                     <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code);
      out.write(".jpg\" style=\"height:150px\" alt=\"\"/>\n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                    <h6>");
      out.print(product_title);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                     \n");
      out.write("                                                   \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("    ");

                        }
                            
      out.write("\n");
      out.write("                          </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                      \n");
      out.write("                            <div class=\"carousel-item\" >\n");
      out.write("                           <div class=\"row\">\n");
      out.write("                              \n");
      out.write("                            ");

                           
                           
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
                
      out.write("\n");
      out.write("               \n");
      out.write("                                 \n");
      out.write("\n");
      out.write("                                 \n");
      out.write("                                       \n");
      out.write("                                                 <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                                 \n");
      out.write("                                                    \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code_for_new);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                    <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code_for_new);
      out.write(".jpg\"  style=\"height:150px\" alt=\"\"/> \n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                     <h6 >");
      out.print(product_title_for_new);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price_for_new);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                ");

                        }
                            
      out.write("\n");
      out.write("                             </div>\n");
      out.write("                                              </div>\n");
      out.write(" \n");
      out.write("                               \n");
      out.write("                            ");

                        }
                        



                     catch (Exception e) {
                    }



                
      out.write("\n");
      out.write("        \n");
      out.write("                                 \n");
      out.write(" </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <a class=\"carousel-control-prev\" href=\"#header-carousel2\" data-slide=\"prev\">\n");
      out.write("                                <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                            </a>\n");
      out.write("                            <a class=\"carousel-control-next\" href=\"#header-carousel2\" data-slide=\"next\">\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                             \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                       </div>   \n");
      out.write("                              \n");
      out.write("                \n");
      out.write("                               \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("                \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           <!----Men t-shirt part end-->\n");
      out.write("            <!----offer part start-->\n");
      out.write("\n");
      out.write("           <div class=\"container-fluid\">\n");
      out.write("               <div class=\"row\" style=\"margin-left:3px;margin-top:1%;margin-right:3px;cursor:pointer\">\n");
      out.write("                   <div class=\"col-sm-3 card\" >\n");
      out.write("                       <div class=\"row\">\n");
      out.write("                           \n");
      out.write("                           <div class=\"col-sm-11\" id=\"cardforoffer\">\n");
      out.write("                               <center><h5 style=\"margin-top:1%;color:white;font-size:30px\">UNDER</h5></center>\n");
      out.write("                               <center><h5><i class=\"fa fa-rupee\" style=\"color:white;font-size:70px \">199</i></h5></center>\n");
      out.write("                               \n");
      out.write("                           </div>\n");
      out.write("                           <div class=\"col-sm-1\"></div>\n");
      out.write("                       </div>\n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("                    <div class=\"col-sm-3 card\" >\n");
      out.write("                       <div class=\"row\">\n");
      out.write("                           \n");
      out.write("                           <div class=\"col-sm-11\" id=\"cardforoffer\">\n");
      out.write("                               <center><h5 style=\"margin-top:1%;color:white;font-size:30px\">UNDER</h5></center>\n");
      out.write("                               <center><h5><i class=\"fa fa-rupee\" style=\"color:white;font-size:70px \">299</i></h5></center>\n");
      out.write("                               \n");
      out.write("                           </div>\n");
      out.write("                           <div class=\"col-sm-1\"></div>\n");
      out.write("                       </div>\n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("                    <div class=\"col-sm-3 card\" >\n");
      out.write("                       <div class=\"row\">\n");
      out.write("                           \n");
      out.write("                           <div class=\"col-sm-11\" id=\"cardforoffer\">\n");
      out.write("                               <center><h5 style=\"margin-top:1%;color:white;font-size:30px\">UNDER</h5></center>\n");
      out.write("                               <center><h5><i class=\"fa fa-rupee\" style=\"color:white;font-size:70px \">499</i></h5></center>\n");
      out.write("                               \n");
      out.write("                           </div>\n");
      out.write("                           <div class=\"col-sm-1\"></div>\n");
      out.write("                       </div>\n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("                    <div class=\"col-sm-3 card\" >\n");
      out.write("                       <div class=\"row\">\n");
      out.write("                           \n");
      out.write("                           <div class=\"col-sm-11\" id=\"cardforoffer\">\n");
      out.write("                               <center><h5 style=\"margin-top:1%;color:white;font-size:30px\">UNDER</h5></center>\n");
      out.write("                               <center><h5><i class=\"fa fa-rupee\" style=\"color:white;font-size:70px \">599</i></h5></center>\n");
      out.write("                               \n");
      out.write("                           </div>\n");
      out.write("                           <div class=\"col-sm-1\"></div>\n");
      out.write("                       </div>\n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("               </div>\n");
      out.write("           </div>\n");
      out.write("<!----offer part end-->\n");
      out.write("<!-- laptop part start-->\n");
      out.write(" <div class=\"container-fluid\"    >\n");
      out.write("            <div class=\"row\"   style=\"margin-top:1%\" >\n");
      out.write("                 <div class=\"col-sm-12\" >\n");
      out.write("                  \n");
      out.write("                            <div class=\"row\" id=\"card_for_product_div\" >\n");
      out.write("                        <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                            <h5 style=\"float:left\">Laptop</h5>\n");
      out.write("                            <input type=\"button\" value=\"VIEW ALL\" class=\"btn btn-primary\" id=\"cardforviewall\" style=\"float:right;background-color:#3392F3;color:white;border-color:#3392F3;margin-bottom:1%\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-12\" style=\"height:1px;background-color:#F1F2F4\"></div>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            \n");
      out.write("                                     \n");
      out.write("                            <div id=\"header-carousel3\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">\n");
      out.write("                                <div class=\"carousel-inner\">\n");
      out.write("                                 <div class=\"carousel-item active\" >\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                     \n");
      out.write("\n");
      out.write("                ");
        
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
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            
      out.write("\n");
      out.write("                          \n");
      out.write("                                    \n");
      out.write("                                           \n");
      out.write("                                           \n");
      out.write("                                        <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                            \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                     <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code);
      out.write(".jpg\"style=\"height:150px\"  alt=\"\"/>\n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                    <h6>");
      out.print(product_title);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                     \n");
      out.write("                                                   \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("    ");

                        }
                            
      out.write("\n");
      out.write("                          </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                      \n");
      out.write("                            <div class=\"carousel-item\" >\n");
      out.write("                           <div class=\"row\">\n");
      out.write("                              \n");
      out.write("                            ");

                           
                           
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
                
      out.write("\n");
      out.write("               \n");
      out.write("                                 \n");
      out.write("\n");
      out.write("                                 \n");
      out.write("                                       \n");
      out.write("                                                 <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                                    \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code_for_new);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                    <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code_for_new);
      out.write(".jpg\"  style=\"height:150px\" alt=\"\"/> \n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                     <h6 >");
      out.print(product_title_for_new);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price_for_new);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                          \n");
      out.write("                                        </div>\n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                ");

                        }
                            
      out.write("\n");
      out.write("                             </div>\n");
      out.write("                                              </div>\n");
      out.write(" \n");
      out.write("                               \n");
      out.write("                            ");

                        }
                        



                     catch (Exception e) {
                    }



                
      out.write("\n");
      out.write("        \n");
      out.write("                                 \n");
      out.write(" </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <a class=\"carousel-control-prev\" href=\"#header-carousel3\" data-slide=\"prev\">\n");
      out.write("                                <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                            </a>\n");
      out.write("                            <a class=\"carousel-control-next\" href=\"#header-carousel3\" data-slide=\"next\">\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                             \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                       </div>   \n");
      out.write("                              \n");
      out.write("                \n");
      out.write("                               \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("                \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--laptop part end--->\n");
      out.write("\n");
      out.write("<!---- washing machine part-->\n");
      out.write("             <div class=\"container-fluid\"    >\n");
      out.write("            <div class=\"row\"   style=\"margin-top:1%\" >\n");
      out.write("                 <div class=\"col-sm-12\" >\n");
      out.write("                  \n");
      out.write("                            <div class=\"row\" id=\"card_for_product_div\" >\n");
      out.write("                        <div class=\"col-sm-12\" style=\"margin-top:2%\">\n");
      out.write("                            <h5 style=\"float:left\">Washing Machines</h5>\n");
      out.write("                            <button   class=\"btn btn-primary\" id=\"cardforviewall\" style=\"float:right;;color:white;margin-bottom:1%\"><a href=\"viewall.jsp?cid=Washing Machines\" style=\"color:white\">VIEW ALL</a></button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-12\" style=\"height:1px;background-color:#F1F2F4\"></div>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            \n");
      out.write("                                     \n");
      out.write("                            <div id=\"header-carousel4\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">\n");
      out.write("                                <div class=\"carousel-inner\">\n");
      out.write("                                 <div class=\"carousel-item active\" >\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                     \n");
      out.write("\n");
      out.write("                ");
        
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
                        ResultSet rs = st.executeQuery("select * from product where status='1' AND sub_category='"+sub_category+"' limit 0,4 "); 
                        while (rs.next()) {
                            product_title = rs.getString("title");
                            product_code = rs.getString("product_code");
                            product_cat = rs.getString("sub_category");
                            
                            ResultSet rs1 = st1.executeQuery("select * from product_list where status='1' AND product_code='" + product_code + "' ");
                            if (rs1.next()) {
                                product_price = rs1.getString("price");
                            }
                             img_code = product_code + "_" + 1;
                            
      out.write("\n");
      out.write("                          \n");
      out.write("                                    \n");
      out.write("                                           \n");
      out.write("                                           \n");
      out.write("                                        <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                           \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                     <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code);
      out.write(".jpg\" style=\"height:170px\" alt=\"\"/>\n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                    <h6>");
      out.print(product_title);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                     \n");
      out.write("                                                   \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("    ");

                        }
                            
      out.write("\n");
      out.write("                          </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                      \n");
      out.write("                            <div class=\"carousel-item\" >\n");
      out.write("                           <div class=\"row\">\n");
      out.write("                              \n");
      out.write("                            ");

                           
                           
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
                
      out.write("\n");
      out.write("               \n");
      out.write("                                 \n");
      out.write("\n");
      out.write("                                 \n");
      out.write("                                       \n");
      out.write("                                                 <div class=\"col-sm-3\"  style=\"background-color:white;padding:20px;\">\n");
      out.write("                                            \n");
      out.write("                                                \n");
      out.write("                                                <!---<p class=\"text-right\">15 Products</p>-->\n");
      out.write("                                                <a href=\"viewproduct.jsp?v=");
      out.print(product_code_for_new);
      out.write("\" class=\"cat-img position-relative overflow-hidden mb-3\">\n");
      out.write("                                                    <img class=\"img-fluid\" src=\"product_photos/");
      out.print(img_code_for_new);
      out.write(".jpg\" style=\"height:170px\"  alt=\"\"/> \n");
      out.write("                                                </a>\n");
      out.write("                                                <div class=\"row\"> \n");
      out.write("                                                    <div class=\"col-sm-8\">\n");
      out.write("                                                     <h6 >");
      out.print(product_title_for_new);
      out.write("</h6> \n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\"></div>\n");
      out.write("                                                </div>\n");
      out.write("                                                \n");
      out.write("                                                <h6  style=\"color:green\"><i class=\"fa fa-rupee\"></i>");
      out.print(product_price_for_new);
      out.write("&nbsp;40% off</h6> \n");
      out.write("                                                <h6>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                                </h6>\n");
      out.write("                                           \n");
      out.write("                                        </div>\n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                ");

                        }
                            
      out.write("\n");
      out.write("                             </div>\n");
      out.write("                                              </div>\n");
      out.write(" \n");
      out.write("                               \n");
      out.write("                            ");

                        }
                        



                     catch (Exception e) {
                    }



                
      out.write("\n");
      out.write("        \n");
      out.write("                                 \n");
      out.write(" </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <a class=\"carousel-control-prev\" href=\"#header-carousel4\" data-slide=\"prev\">\n");
      out.write("                                <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                            </a>\n");
      out.write("                            <a class=\"carousel-control-next\" href=\"#header-carousel4\" data-slide=\"next\">\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                             \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                       </div>   \n");
      out.write("                              \n");
      out.write("                \n");
      out.write("                               \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("                \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           \n");
      out.write("           <!----washing machine part end-->\n");
      out.write("\n");
      out.write("\n");
      out.write("       \n");
      out.write("\n");
      out.write("        <!-- Register modal start!--->                                              \n");
      out.write("        <div class=\"modal\" id=\"myModal\" >\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <!-- Modal Header -->\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Sign Up</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <!-- Modal body -->\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                        <div class=\"login-form\">\n");
      out.write("                            <form action=\"user_register.jsp\"  method=\"post\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Name:</label>\n");
      out.write("                                    <input type=\"text\"  name=\"user\"class=\"form-control\"required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Email:</label>\n");
      out.write("                                    <input type=\"email\"  name=\"email\"class=\"form-control\"required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Password:</label>\n");
      out.write("                                    <input type=\"password\" name=\"pass\" class=\"form-control\"  required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Retype-Password:</label>\n");
      out.write("                                    <input type=\"password\" name=\"cpass\" class=\"form-control\" required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block\">Sign Up</button>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </form>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- registration Modal End-->\n");
      out.write("        <div class=\"modal\" id=\"myModal1\" >\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <!-- Modal Header -->\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Sign in</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <!-- Modal body -->\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                        <div class=\"login-form\">\n");
      out.write("                            <form action=\"user_login.jsp\"  method=\"post\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Email:</label>\n");
      out.write("                                    <input type=\"email\"  name=\"email\"class=\"form-control\"required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Password:</label>\n");
      out.write("                                    <input type=\"password\" name=\"password\" class=\"form-control\" required=\"required\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary btn-block\"  style=\"color:white\">Log in</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"clearfix\">\n");
      out.write("                                    <label class=\"float-left form-check-label\"><input type=\"checkbox\"> Remember me</label>\n");
      out.write("                                    <a href=\"#\" class=\"float-right\" style=\"color:blue\">Forgot Password?</a>\n");
      out.write("                                </div>        \n");
      out.write("                            </form>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Login Modal end-->\n");
      out.write("        \n");
      out.write("\n");
      out.write("       \n");
      out.write("        <!-- Featured End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Vendor Start -->\n");
      out.write("          <div class=\"container-fluid pt-5\" >\n");
      out.write("            <div class=\"row px-xl-5 pb-3\" >\n");
      out.write("                <div class=\"col-lg-3 col-md-6 col-sm-12 pb-1\">\n");
      out.write("                    <div class=\"d-flex align-items-center border mb-4\" style=\"padding: 38px;\">\n");
      out.write("                        <h1 class=\"fa fa-check text-danger m-0 mr-3\"></h1>\n");
      out.write("                        <h5 class=\"font-weight-semi-bold m-0\">Quality Product</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-3 col-md-6 col-sm-12 pb-1\">\n");
      out.write("                    <div class=\"d-flex align-items-center border mb-4\" style=\"padding: 38px;\">\n");
      out.write("                        <h1 class=\"fa fa-shipping-fast text-danger m-0 mr-2\"></h1>\n");
      out.write("                        <h5 class=\"font-weight-semi-bold m-0\">Free Shipping</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-3 \">\n");
      out.write("                    <div class=\"d-flex align-items-center border mb-4\" style=\"padding: 30px;\">\n");
      out.write("                        <h1 class=\"fas fa-exchange-alt text-danger m-0 mr-3\"></h1>\n");
      out.write("                        <h5 class=\"font-weight-semi-bold m-0\">14-Day Return</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <div class=\"d-flex align-items-center border mb-4\" style=\"padding: 38px;\">\n");
      out.write("                        <h1 class=\"fa fa-phone-volume text-danger m-0 mr-3\"></h1>\n");
      out.write("                        <h5 class=\"font-weight-semi-bold m-0\">24/7 Support</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Featured End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Vendor Start -->\n");
      out.write("        <div class=\"container-fluid py-5\">\n");
      out.write("            <div class=\"row px-xl-5\">\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"owl-carousel vendor-carousel\">\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-1.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-2.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-3.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-4.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-5.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-6.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-7.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"vendor-item border p-4\">\n");
      out.write("                            <img src=\"img/vendor-8.jpg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Vendor End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Footer Start -->\n");
      out.write("        <div class=\"container-fluid bg-dark text-light mt-5 pt-5\">\n");
      out.write("            <div class=\"row px-xl-5 pt-5\">\n");
      out.write("                <div class=\"col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5\">\n");
      out.write("                    <a href=\"\" class=\"text-decoration-none\">\n");
      out.write("                        <h1 class=\"mb-4 display-5 font-weight-semi-bold\"><span class=\"text-light font-weight-bold border border-white px-3 mr-1\">E-Shop</span>Shopper</h1>\n");
      out.write("                    </a>\n");
      out.write("                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>\n");
      out.write("                    <p class=\"mb-2\"><i class=\"fa fa-map-marker-alt text-light mr-3\"></i>123 Street, New York, USA</p>\n");
      out.write("                    <p class=\"mb-2\"><i class=\"fa fa-envelope text-light mr-3\"></i>info@example.com</p>\n");
      out.write("                    <p class=\"mb-0\"><i class=\"fa fa-phone-alt text-light mr-3\"></i>+012 345 67890</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-8 col-md-12\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-4 mb-5\">\n");
      out.write("                            <h5 class=\"font-weight-bold text-light mb-4\">Quick Links</h5>\n");
      out.write("                            <div class=\"d-flex flex-column justify-content-start\">\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"index.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Home</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"shop.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Our Shop</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"detail.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shop Detail</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"cart.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shopping Cart</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"checkout.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Checkout</a>\n");
      out.write("                                <a class=\"text-light\" href=\"contact.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Contact Us</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 mb-5\">\n");
      out.write("                            <h5 class=\"font-weight-bold text-light mb-4\">Quick Links</h5>\n");
      out.write("                            <div class=\"d-flex flex-column justify-content-start\">\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"index.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Home</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"shop.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Our Shop</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"detail.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shop Detail</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"cart.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shopping Cart</a>\n");
      out.write("                                <a class=\"text-light mb-2\" href=\"checkout.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Checkout</a>\n");
      out.write("                                <a class=\"text-light\" href=\"contact.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Contact Us</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 mb-5\">\n");
      out.write("                            <h5 class=\"font-weight-bold text-light mb-4\">Newsletter</h5>\n");
      out.write("                            <form action=\"\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control border-0 py-4\" placeholder=\"Your Name\" required=\"required\" />\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <input type=\"email\" class=\"form-control border-0 py-4\" placeholder=\"Your Email\"\n");
      out.write("                                           required=\"required\" />\n");
      out.write("                                </div>\n");
      out.write("                                <div>\n");
      out.write("                                    <button class=\"btn btn-danger btn-block border-0 py-3\" type=\"submit\">Subscribe Now</button>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row border-top border-light mx-xl-5 py-4\">\n");
      out.write("                <div class=\"col-md-6 px-xl-0\">\n");
      out.write("                    <p class=\"mb-md-0 text-center text-md-left text-light\">\n");
      out.write("                        &copy; <a class=\"text-light font-weight-semi-bold\" href=\"#\">Eshop</a>. All Rights Reserved. Designed\n");
      out.write("                        by Rohit Choudhary\n");
      out.write("                       \n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-6 px-xl-0 text-center text-md-right\">\n");
      out.write("                    <img class=\"img-fluid\" src=\"img/payments.png\" alt=\"\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Footer End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Back to Top -->\n");
      out.write("        <a href=\"#\" class=\"btn btn-success back-to-top\"><i class=\"fa fa-angle-double-up\"></i></a>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- JavaScript Libraries -->\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <script src=\"lib/easing/easing.min.js\"></script>\n");
      out.write("        <script src=\"lib/owlcarousel/owl.carousel.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Contact Javascript File -->\n");
      out.write("        <script src=\"mail/jqBootstrapValidation.min.js\"></script>\n");
      out.write("        <script src=\"mail/contact.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Template Javascript -->\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
