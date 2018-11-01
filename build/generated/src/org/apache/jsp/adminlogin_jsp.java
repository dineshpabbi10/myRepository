package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("//            function login() {\n");
      out.write("//                $(\"#myModal\").modal('show');\n");
      out.write("//            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            function ajax()\n");
      out.write("            {\n");
      out.write("\n");
      out.write("\n");
      out.write("                var email = document.getElementById(\"email\").value;\n");
      out.write("                var password = document.getElementById(\"password\").value;\n");
      out.write("\n");
      out.write("                var xmlhttp = new XMLHttpRequest();\n");
      out.write("                xmlhttp.onreadystatechange = function ()\n");
      out.write("                {\n");
      out.write("                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                    {\n");
      out.write("                        var res = xmlhttp.responseText.trim();\n");
      out.write("                        if (res === \"success\")\n");
      out.write("                        {\n");
      out.write("                            window.location.href = \"adminhome.jsp\";\n");
      out.write("\n");
      out.write("                            alert(\"login successful\");\n");
      out.write("                        } else\n");
      out.write("                        {\n");
      out.write("                            alert(\"login unsuccessfull\");\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                    ;\n");
      out.write("                }\n");
      out.write("                xmlhttp.open(\"GET\", \"./adminLogin?email=\" + email + \"&password=\" + password, true);\n");
      out.write("                xmlhttp.send();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <button type=\"button\" class=\"btn btn-info btn-lg\" onclick=\"login()\" >Click Here To Login</button>\n");
      out.write("\n");
      out.write("                    <!-- Modal -->\n");
      out.write("                    <div id=\"myModal\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                        <div class=\"modal-dialog\">\n");
      out.write("\n");
      out.write("                            <!-- Modal content-->\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                                    <h4 class=\"modal-title\">User Login</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-body\">\n");
      out.write("                                    <form>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label>Enter Email</label>\n");
      out.write("                                            <input type=\"email\" placeholder=\"enter email\" class=\"form-control\" id=\"email\" />\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label>Enter Password</label>\n");
      out.write("                                            <input type=\"password\" placeholder=\"enter password\" class=\"form-control\" id=\"password\" />\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <input type=\"button\" class=\"btn btn-success\" onclick=\"ajax()\"value=\"Login\" /><br>\n");
      out.write("                                        <br>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\" > \n");
      out.write("                                            <a href=\"forgotpassword.jsp\" class=\"form-control btn btn-success\">forgot password</a>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-footer\">\n");
      out.write("                                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
