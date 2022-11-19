package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class product_005fimage_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<script>\n");
      out.write("$(document).ready(function(){\n");
      out.write("\n");
      out.write("    $(\"#but_upload\").click(function(){\n");
      out.write("            alert(\"hello\");\n");
      out.write("        var fd = new FormData();\n");
      out.write("        var files = $('#file')[0].files;\n");
      out.write("        \n");
      out.write("        // Check file selected or not\n");
      out.write("        if(files.length > 0 ){\n");
      out.write("           fd.append('file',files[0]);\n");
      out.write("\n");
      out.write("           $.ajax({\n");
      out.write("              url:'product_image_upload_process.jsp',\n");
      out.write("              type:'post',\n");
      out.write("              data: fd,\n");
      out.write("              contentType: false,\n");
      out.write("              processData: false,\n");
      out.write("              success: function(response){\n");
      out.write("                 if(response != 0){\n");
      out.write("                    $(\"#img\").attr(\"src\",response); \n");
      out.write("                    $(\".preview img\").show(); // Display image element\n");
      out.write("                 }else{\n");
      out.write("                    alert('file not uploaded');\n");
      out.write("                 }\n");
      out.write("              },\n");
      out.write("           });\n");
      out.write("        }else{\n");
      out.write("           alert(\"Please select a file.\");\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" <div class=\"login-form\" style=\"overflow:scroll;\"  >\n");
      out.write("        <div class=\"form-group\">\n");
      out.write("            <!--ACTION=\"FileUploadProcess.jsp\" ACTION=\"product_image_upload_Process.jsp\" -->\n");
      out.write("           \n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-12\">\n");
      out.write("                    <span style=\"color:red\">*Upload Product photos Upto 4.</span>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <form method=\"post\" action=\"\" enctype=\"multipart/form-data\" id=\"myform\">\n");
      out.write("        <div class='preview'>\n");
      out.write("            <img src=\"\" id=\"img\" width=\"100\" height=\"100\">\n");
      out.write("        </div>\n");
      out.write("        <div >\n");
      out.write("            <input type=\"file\" id=\"file\" name=\"file\" />\n");
      out.write("            <input type=\"button\" class=\"button\" value=\"Upload\" id=\"but_upload\">\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("                \n");
      out.write("             \n");
      out.write("               <!-- <img src=\"profile/usercode.jpg\">-->\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("   \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("       <!-- <div class=\"form-group\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("\n");
      out.write("      <button class=\"btn btn-primary\"  id=\"imageUploadForm\" rel=\"\"   style=\"background-color:#3392F3;border-color:#3392F3\">Save</button>\n");
      out.write("  </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("            </div>-->\n");
      out.write("  <div class=\"clearfix\">\n");
      out.write("\n");
      out.write("        </div>        \n");
      out.write("\n");
      out.write("\n");
      out.write("</div>");
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
