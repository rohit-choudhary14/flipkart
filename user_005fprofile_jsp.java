package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class user_005fprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");

    String email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
    }
    
    if(email!=null){
    
    
    
    
    
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <title>E-Shopp</title>\n");
      out.write("    <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("    <meta content=\"Free HTML Templates\" name=\"keywords\">\n");
      out.write("    <meta content=\"Free HTML Templates\" name=\"description\">\n");
      out.write("\n");
      out.write("    <!-- Favicon -->\n");
      out.write("    <link href=\"img/favicon.ico\" rel=\"icon\">\n");
      out.write("\n");
      out.write("    <!-- Google Web Fonts -->\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap\" rel=\"stylesheet\"> \n");
      out.write("\n");
      out.write("    <!-- Font Awesome -->\n");
      out.write("    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Libraries Stylesheet -->\n");
      out.write("    <link href=\"lib/owlcarousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <!-- Customized Bootstrap Stylesheet -->\n");
      out.write("    <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("       #card{\n");
      out.write(" \n");
      out.write("  \n");
      out.write("   box-shadow:5px 5px 5px rgba(0,0, 0, 0.4);\n");
      out.write("   \n");
      out.write("    \n");
      out.write("   \n");
      out.write("} \n");
      out.write("#heart{\n");
      out.write("    color:white;\n");
      out.write("}\n");
      out.write("#account:hover{\n");
      out.write("    color:blue;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("#address:hover{\n");
      out.write("    color:blue;\n");
      out.write("}\n");
      out.write("#pan:hover{\n");
      out.write("    color:blue;\n");
      out.write("}\n");
      out.write("      \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body >\n");
      out.write("    <!-- Topbar Start -->\n");
      out.write("    <div class=\"container-fluid\"  >\n");
      out.write("        \n");
      out.write("        <div class=\"row align-items-center py-3 px-xl-5\" style=\"background-color:blue;\">\n");
      out.write("            <div class=\"col-lg-2 d-none d-lg-block\">\n");
      out.write("                <a href=\"\" class=\"text-decoration-none\">\n");
      out.write("                    <h1 class=\"m-0 display-5 font-weight-semi-bold\"><span class=\"text-primary font-weight-bold border px-3 mr-1\">E</span>Shop</h1>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-4 col-6 text-left\">\n");
      out.write("               \n");
      out.write("                    <div class=\"input-group\" style=\"background-color:white\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Search for products\">\n");
      out.write("                        <div class=\"input-group-append\">\n");
      out.write("                            <span class=\"input-group-text bg-transparent text-primary\">\n");
      out.write("                                <i class=\"fa fa-search\" ></i>\n");
      out.write("                            </span>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("              ");
            String name=" ";
                                             try{
                                                                        
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                         ResultSet rs=st.executeQuery("select *  from user where email='"+email+"' ");  
                                                                          while(rs.next()){
                                                                              
                                                                              
                                                                             name=rs.getString("name");
                                                                           
                                                                            
                                                                              
                                                            
                                                                     
      out.write("\n");
      out.write("            <div class=\"col-sm-2\">\n");
      out.write("                <div class=\"nav-item dropdown\" style=\"color:white\">\n");
      out.write("                            <a  style=\"cursor:pointer\" data-toggle=\"dropdown\">");
      out.print(name);
      out.write("\n");
      out.write("                                <i class=\"fa fa-angle-down\" style=\"padding:10px\"></i></a>\n");
      out.write("                            <div class=\"dropdown-menu position-absolute\">\n");
      out.write("                                <a href=\"user_profile.jsp\" class=\"dropdown-item\"><i class=\"fa fa-user\">My Profile</i></a>\n");
      out.write("                                 <a href=\"\" class=\"dropdown-item\"><i class=\"fa fa-heart\">Wish-List</i></a>\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\"><i class=\"fa fa-sign-out\">Logout</i></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("               \n");
      out.write("                 \n");
      out.write("                  ");

                                                                          }
                                             }
                                             catch(Exception e){} 





      out.write("  \n");
      out.write("            </div>    \n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("            <div class=\"col-sm-2\">\n");
      out.write("                 <div class=\"nav-item dropdown\" style=\"color:white\">\n");
      out.write("                            <a style=\"cursor:pointer\"data-toggle=\"dropdown\">More \n");
      out.write("                                <i class=\"fa fa-angle-down\" style=\"padding:10px\"></i></a>\n");
      out.write("                            <div class=\"dropdown-menu position-absolute\">\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\"><i class=\"fa fa-sell\">Sell on E-Shop</i></a>\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\"><i class=\"fa fa-sell\">24*7 Customer Care</i></a>\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\">Baby's Dresses</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-2\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                 <a  style=\"cursor:pointer\" >\n");
      out.write("                    <i class=\"fa fa-shopping-cart\" id=\"heart\" ></i>\n");
      out.write("                    <span id=\"heart\">Cart</span>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <!-- Topbar End -->\n");
      out.write("    <!-- Navbar Start -->\n");
      out.write("    <div class=\"container-fluid\" >\n");
      out.write("        <div class=\"row\" id=\"card\">\n");
      out.write("           \n");
      out.write("            \n");
      out.write("               \n");
      out.write("                               ");

                                             try{
                                                                        int status=1;
                                                                        int sr=1;
                                                                        String album_code=" "; 
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
                                                                          Statement st=cn.createStatement();
                                                                         ResultSet rs=st.executeQuery("select *  from category where status="+status+" limit 0,6 ");  
                                                                          while(rs.next()){
                                                                              
                                                                              
                                                                             String cat_name=rs.getString("cat_name");
                                                                             String cat_code=rs.getString("cat_code");
                                                                            
                                                                              
                                                            
                                                                     
      out.write("\n");
      out.write("                                                                     <div class=\"col-sm-2\">\n");
      out.write("                                                                         <img src=\"category_photos/");
      out.print(sr);
      out.write(".webp\" style=\"height:100px\"> \n");
      out.write("                             <a href=\"#\" class=\"nav-link\" data-toggle=\"dropdown\" style=\"color:black\" id=\"category\">");
      out.print(cat_name);
      out.write("</a>\n");
      out.write("                           <!--- <i class=\"fa fa-angle-down float-right mt-1\"></i>\n");
      out.write("                           <div class=\"dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0\">\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\">Men's Dresses</a>\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\">Women's Dresses</a>\n");
      out.write("                                <a href=\"\" class=\"dropdown-item\">Baby's Dresses</a>\n");
      out.write("                            </div---->\n");
      out.write("                                                                     </div>\n");
      out.write("            ");
      
                                                                              sr++;
                                                                          }
                                                                          
      out.write("\n");
      out.write("            </div>                \n");
      out.write("                                                                          </div>\n");
      out.write("                        \n");
      out.write("                 \n");
      out.write("                                                                          \n");
      out.write("                                                                          ");

                                             }
                                             catch(Exception e){} 
                                                                             
                                                                             
         
                                             
      out.write("\n");
      out.write("                                             \n");
      out.write("                                             <div class=\"container-fluid\" style=\"margin-top:2%;background-color:#F5F5F5;\" >\n");
      out.write("                                                 \n");
      out.write("          <div class=\"row\"  >    <div class=\"col-sm-1\">\n");
      out.write("                                    \n");
      out.write("                                 </div>                                \n");
      out.write("                               \n");
      out.write("              <div class=\"col-sm-3 card\" style=\"height:900px;padding:20px;margin-top:2%\">\n");
      out.write("                  <div class=\"row\">\n");
      out.write("                      <div class=\"col-sm-12 card\" style=\"height:80px;width:50px\">\n");
      out.write("                          <div class=\"row\">\n");
      out.write("                          <div class=\"col-sm-3\">\n");
      out.write("                          <img src=\"category_photos/profile-pic-male_4811a1.svg\" style=\"height:70px;margin:5px\">\n");
      out.write("                          </div>\n");
      out.write("                          <div class=\"col-sm-9\" style=\"margin-top:10%\"><span style=\"color:black;\"> Hello,</span>\n");
      out.write("                              <span style=\"color:black;\">");
      out.print(name);
      out.write("</span>\n");
      out.write("                          </div>\n");
      out.write("                          \n");
      out.write("                         \n");
      out.write("                         </div>\n");
      out.write("                   </div>\n");
      out.write("              </div>\n");
      out.write("                          <div class=\"row\" style=\"margin-top:3%\">\n");
      out.write("                      <div class=\"col-sm-12 card\" style=\"height:200px\">\n");
      out.write("                          \n");
      out.write("                          <div class=\"row\">\n");
      out.write("                               <!-----Acount Setting Part start--->\n");
      out.write("                          <div class=\"col-sm-2\" style=\"margin-top:9%\">\n");
      out.write("                              <i class=\"fa fa-user\" style=\"font-size:30px;color:blue\"></i>\n");
      out.write("                          </div>\n");
      out.write("                          <div class=\"col-sm-8\" style=\"margin-top:10%\" id=\"account\">\n");
      out.write("                              <span style=\"color:black;\">ACCOUNT SETTINGS</span>\n");
      out.write("                          </div>\n");
      out.write("                              <div class=\"col-sm-2\" style=\"margin-top:10%\">\n");
      out.write("                                  <i class=\"fa fa-angle-right\" style=\"font-size:20px;cursor:pointer\"  id=\"account\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <div class=\"col-sm-12\" style=\"height:1px;background-color:#F5F5F5\"></div>\n");
      out.write("                               <div class=\"col-sm-12\" style=\"height:10px;\"></div>\n");
      out.write("                          <!-----Acount Setting Part End--->\n");
      out.write("                              <div class=\"col-sm-2\">1.</div>\n");
      out.write("                              <div class=\"col-sm-10\">\n");
      out.write("                                  <h6 id=\"pan\" style=\"cursor:pointer\">Profile Information</h6> \n");
      out.write("\n");
      out.write("\n");
      out.write("                              </div>\n");
      out.write("                              <div class=\"col-sm-12\" style=\"height:10px;\"></div>\n");
      out.write("                        \n");
      out.write("                          <!-----Manage Address Part start--->\n");
      out.write("                              <div class=\"col-sm-2\">2.</div>\n");
      out.write("                              <div class=\"col-sm-10\" >\n");
      out.write("                                  <h6 id=\"address\" style=\"cursor:pointer\">Manage Addresses</h6> \n");
      out.write("\n");
      out.write("\n");
      out.write("                              </div>\n");
      out.write("                          <!-----Manage Address Part End--->  \n");
      out.write("                          <div class=\"col-sm-12\" style=\"height:10px;\"></div>\n");
      out.write("                         \n");
      out.write("                        <!-----Pan Card Part start--->\n");
      out.write("                          \n");
      out.write("                              <div class=\"col-sm-2\">3.</div>\n");
      out.write("                              <div class=\"col-sm-10\">\n");
      out.write("                                  <h6 id=\"pan\" style=\"cursor:pointer\">PAN Card Information</h6> \n");
      out.write("\n");
      out.write("\n");
      out.write("                              </div>\n");
      out.write("                           <!-----Pan Card Part end--->   \n");
      out.write("                          <div class=\"col-sm-12\" style=\"height:10px;\"></div>\n");
      out.write("                         \n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("                          \n");
      out.write("                      </div>\n");
      out.write("              </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"col-sm-1\">\n");
      out.write("                                    \n");
      out.write("                                 </div>\n");
      out.write("              <!--- Personal info Start--->\n");
      out.write("                          <div class=\"col-sm-6 card\" style=\"height:900px;color:black;margin-top:2%\">\n");
      out.write("                  <div class=\"row\">\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-6\"><h6>Personal Information</h6></div>\n");
      out.write("                      <div class=\"col-sm-5\">\n");
      out.write("                 \n");
      out.write("                      </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"row\" style=\"margin-top:3%\">\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-4 card\" style=\"background-color:#F5F5F5;height:40px;color:black\">\n");
      out.write("                          <span >");
      out.print(name);
      out.write("</span>\n");
      out.write("                      </div>\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-4\" >\n");
      out.write("                          <h6><a href=# style=\"color:blue\">Edit</a></h6>\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"col-sm-1\">\n");
      out.write("                           \n");
      out.write("                      </div>\n");
      out.write("                  </div>\n");
      out.write("                      <!---Email Part start--->\n");
      out.write("                   <div class=\"row\" style=\"margin-top:4%\">\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-6\"><h6>Email Address</h6></div>\n");
      out.write("                      <div class=\"col-sm-5\">\n");
      out.write("                  \n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"col-sm-1\">\n");
      out.write("                  \n");
      out.write("                      </div>\n");
      out.write("                  </div> \n");
      out.write("                       <div class=\"row\" style=\"margin-top:3%\">\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-4 card\" style=\"background-color:#F5F5F5;height:40px;color:black\">\n");
      out.write("                          <span >");
      out.print(email);
      out.write("</span>\n");
      out.write("                      </div>\n");
      out.write("                       <div class=\"col-sm-1\"></div>\n");
      out.write("                      <div class=\"col-sm-4\">\n");
      out.write("                          <h6><a href=# style=\"color:blue\">Edit</a></h6>\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"col-sm-1\"></div>\n");
      out.write("                  </div><!----- Email Part End--->\n");
      out.write("                      <!---\n");
      out.write("                      Faq Question Start--->\n");
      out.write("                      <div class=\"row\" style=\"margin-top:3%\">\n");
      out.write("                          <div class=\"col-sm-1\"></div>\n");
      out.write("                       <div class=\"col-sm-11\">\n");
      out.write("                      <h6>FAQs</h6></div>\n");
      out.write("                          <div class=\"col-sm-1\"></div>\n");
      out.write("                          <div class=\"col-sm-11\">\n");
      out.write("                              <p><h6>What happens when I update my email address (or mobile number)?</h6></p>\n");
      out.write("                              <p>  Your login email id (or mobile number) changes, likewise. You'll receive all your account related communication on your updated email address (or mobile number).\n");
      out.write("                              </p>\n");
      out.write("                                    <p> <h6>  When will my E-Shop account be updated with the new email address (or mobile number)?</h6></p>\n");
      out.write("                                    <p>It happens as soon as you confirm the verification code sent to your email (or mobile) and save the changes.</p>\n");
      out.write("\n");
      out.write("                                    <p> <h6> What happens to my existing E-Shop account when I update my email address (or mobile number)?</h6></p>\n");
      out.write("                                    <p> Updating your email address (or mobile number) doesn't invalidate your account. Your account remains fully functional. You'll continue seeing your Order history, saved information and personal details.\n");
      out.write("                                    </p>\n");
      out.write("\n");
      out.write("                                    <p> <h6> Does my Seller account get affected when I update my email address?</h6></p>\n");
      out.write("                                    <p>  E-Shop has a 'single sign-on' policy. Any changes will reflect in your Seller account also.</p>\n");
      out.write("                          </div>\n");
      out.write("                      \n");
      out.write("                  </div>\n");
      out.write("                   <!---- Faq Question End\n");
      out.write("                      ----->\n");
      out.write("              </div>\n");
      out.write("                      <!---- Personal info End--->\n");
      out.write("              <div class=\"col-sm-2\"></div>\n");
      out.write("              \n");
      out.write("          </div>\n");
      out.write("      \n");
      out.write("\n");
      out.write("\n");
      out.write("                                             </div>\n");
      out.write("   \n");
      out.write("   \n");
      out.write("    <!-- Subscribe Start -->\n");
      out.write("   \n");
      out.write("    <!-- Subscribe End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write(" \n");
      out.write("    <!-- Vendor End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Footer Start -->\n");
      out.write("    <div class=\"container-fluid bg-secondary text-dark mt-5 pt-5\">\n");
      out.write("        <div class=\"row px-xl-5 pt-5\">\n");
      out.write("            <div class=\"col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5\">\n");
      out.write("                <a href=\"\" class=\"text-decoration-none\">\n");
      out.write("                    <h1 class=\"mb-4 display-5 font-weight-semi-bold\"><span class=\"text-primary font-weight-bold border border-white px-3 mr-1\">E</span>Shopper</h1>\n");
      out.write("                </a>\n");
      out.write("                <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>\n");
      out.write("                <p class=\"mb-2\"><i class=\"fa fa-map-marker-alt text-primary mr-3\"></i>123 Street, New York, USA</p>\n");
      out.write("                <p class=\"mb-2\"><i class=\"fa fa-envelope text-primary mr-3\"></i>info@example.com</p>\n");
      out.write("                <p class=\"mb-0\"><i class=\"fa fa-phone-alt text-primary mr-3\"></i>+012 345 67890</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-8 col-md-12\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-4 mb-5\">\n");
      out.write("                        <h5 class=\"font-weight-bold text-dark mb-4\">Quick Links</h5>\n");
      out.write("                        <div class=\"d-flex flex-column justify-content-start\">\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"index.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Home</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"shop.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Our Shop</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"detail.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shop Detail</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"cart.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shopping Cart</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"checkout.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Checkout</a>\n");
      out.write("                            <a class=\"text-dark\" href=\"contact.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Contact Us</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 mb-5\">\n");
      out.write("                        <h5 class=\"font-weight-bold text-dark mb-4\">Quick Links</h5>\n");
      out.write("                        <div class=\"d-flex flex-column justify-content-start\">\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"index.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Home</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"shop.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Our Shop</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"detail.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shop Detail</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"cart.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Shopping Cart</a>\n");
      out.write("                            <a class=\"text-dark mb-2\" href=\"checkout.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Checkout</a>\n");
      out.write("                            <a class=\"text-dark\" href=\"contact.jsp\"><i class=\"fa fa-angle-right mr-2\"></i>Contact Us</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 mb-5\">\n");
      out.write("                        <h5 class=\"font-weight-bold text-dark mb-4\">Newsletter</h5>\n");
      out.write("                        <form action=\"\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <input type=\"text\" class=\"form-control border-0 py-4\" placeholder=\"Your Name\" required=\"required\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <input type=\"email\" class=\"form-control border-0 py-4\" placeholder=\"Your Email\"\n");
      out.write("                                    required=\"required\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <button class=\"btn btn-primary btn-block border-0 py-3\" type=\"submit\">Subscribe Now</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row border-top border-light mx-xl-5 py-4\">\n");
      out.write("            <div class=\"col-md-6 px-xl-0\">\n");
      out.write("                <p class=\"mb-md-0 text-center text-md-left text-dark\">\n");
      out.write("                    &copy; <a class=\"text-dark font-weight-semi-bold\" href=\"#\">Your Site Name</a>. All Rights Reserved. Designed\n");
      out.write("                    by\n");
      out.write("                    <a class=\"text-dark font-weight-semi-bold\" href=\"https://htmlcodex.com\">HTML Codex</a><br>\n");
      out.write("                    Distributed By <a href=\"https://themewagon.com\" target=\"_blank\">ThemeWagon</a>\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6 px-xl-0 text-center text-md-right\">\n");
      out.write("                <img class=\"img-fluid\" src=\"img/payments.png\" alt=\"\">\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <!-- Footer End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Back to Top -->\n");
      out.write("    <a href=\"#\" class=\"btn btn-primary back-to-top\"><i class=\"fa fa-angle-double-up\"></i></a>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- JavaScript Libraries -->\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script src=\"lib/easing/easing.min.js\"></script>\n");
      out.write("    <script src=\"lib/owlcarousel/owl.carousel.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Contact Javascript File -->\n");
      out.write("    <script src=\"mail/jqBootstrapValidation.min.js\"></script>\n");
      out.write("    <script src=\"mail/contact.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Template Javascript -->\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("</body>\n");

    }
    else{
        
        
        response.sendRedirect("index.jsp"); 
    }
                                             
                                             
                                             
                                             
                                             
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
