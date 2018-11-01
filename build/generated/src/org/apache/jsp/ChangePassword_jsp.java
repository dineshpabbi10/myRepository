package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ChangePassword_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            function go()\n");
      out.write("            {\n");
      out.write("                var oldpassword = document.getElementById(\"oldpassword\").value;\n");
      out.write("                var newpassword = document.getElementById(\"newpassword\").value;\n");
      out.write("                var confirmpassword = document.getElementById(\"confirmpassword\").value;\n");
      out.write("if(oldpassword==\"\"){\n");
      out.write("    alert(\"enter oldpassword\");\n");
      out.write("}\n");
      out.write("else if(newpassword==\"\"){\n");
      out.write("    alert(\"enter newpassword\");\n");
      out.write("}\n");
      out.write("else if(confirmpassword==\"\"){\n");
      out.write("    alert(\"enter confirm password\");\n");
      out.write("}\n");
      out.write("else if(confirmpassword!=newpassword){\n");
      out.write("    alert(\" new password and confirm password not match\");\n");
      out.write("}\n");
      out.write("else\n");
      out.write("    \n");
      out.write("                {\n");
      out.write("                   \n");
      out.write("                    var xmlhttp = new XMLHttpRequest();\n");
      out.write("                    xmlhttp.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                        {\n");
      out.write("                            var res = xmlhttp.responseText.trim();\n");
      out.write("                            if (res == \"success\")\n");
      out.write("                            {\n");
      out.write("               \n");
      out.write("\n");
      out.write("                                alert(\"password changed\");\n");
      out.write("                            } else\n");
      out.write("                            {\n");
      out.write("                                alert(\"change unsuccessful\");\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("\n");
      out.write("                    };\n");
      out.write("                    xmlhttp.open(\"GET\", \"./AdminChangePass?oldpassword=\" + oldpassword + \"&newpassword=\" + newpassword, true);\n");
      out.write("                    xmlhttp.send();\n");
      out.write("                } \n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            <form>  \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <div>\n");
      out.write("        <label>OldPassword</label><br>\n");
      out.write("        <input type=\"text\" class=\"form-control\" placeholder=\"enter old password\" id=\"oldpassword\"/><br>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("        <label>NewPassword</label><br>\n");
      out.write("        <input type=\"text\" class=\"form-control\" placeholder=\"enter new password\" id=\"newpassword\"/><br>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div>\n");
      out.write("        <label>ConfirmPassword</label><br>\n");
      out.write("        <input type=\"text\" class=\"form-control\" placeholder=\"confirm password\" id=\"confirmpassword\"/><br>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("        <input type=\"button\" class=\"btn btn-danger\" value=\"change\" onclick=\"go()\"/>\n");
      out.write(" \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
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
