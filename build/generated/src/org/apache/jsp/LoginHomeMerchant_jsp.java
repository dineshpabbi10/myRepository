package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginHomeMerchant_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!--A Design by W3layouts\n");
      out.write("Author: W3layouts\n");
      out.write("Author URL: http://w3layouts.com\n");
      out.write("License: Creative Commons Attribution 3.0 Unported\n");
      out.write("License URL: http://creativecommons.org/licenses/by/3.0/\n");
      out.write("-->\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title></title>\n");
      out.write("        <!-- Meta Tags -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Groovy Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements\"\n");
      out.write("              />\n");
      out.write("        <script type=\"application/x-javascript\">\n");
      out.write("            addEventListener(\"load\", function () {\n");
      out.write("            setTimeout(hideURLbar, 0);\n");
      out.write("            }, false);\n");
      out.write("\n");
      out.write("            function hideURLbar() {\n");
      out.write("            window.scrollTo(0, 1);\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <!-- //Meta Tags -->\n");
      out.write("        <!-- Font-Awesome-CSS -->\n");
      out.write("        <link href=\"css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("        <!--// Font-Awesome-CSS -->\n");
      out.write("        <!-- Required Css -->\n");
      out.write("        <link href=\"css/style_2.css\" rel='stylesheet' type='text/css' />\n");
      out.write("        <!--// Required Css -->\n");
      out.write("        <!--fonts-->\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\">\n");
      out.write("        <!--//fonts-->\n");
      out.write("\n");
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
      out.write("                if (email === \"\" || password === \"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"Must fill all fields\");\n");
      out.write("                } else if (email.indexOf(\"@\") <= 0 || email.lastIndexOf(\".\") < email.indexOf(\"@\"))\n");
      out.write("                {\n");
      out.write("                    alert(\"enter proper email\");\n");
      out.write("                } else\n");
      out.write("                {\n");
      out.write("                    var xmlhttp = new XMLHttpRequest();\n");
      out.write("                    xmlhttp.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                        {\n");
      out.write("                            var res = xmlhttp.responseText.trim();\n");
      out.write("                            if (res === \"success\")\n");
      out.write("                            {\n");
      out.write("                                window.location.href = \"merchantHome.jsp\";\n");
      out.write("\n");
      out.write("                                alert(\"login successful\");\n");
      out.write("                            } else if (res === \"signup\")\n");
      out.write("                            {\n");
      out.write("                                window.location.href = \"MerchantSignup2.jsp\";\n");
      out.write("                            } else if (xmlhttp.responseText.trim() == \"failed\")\n");
      out.write("                            {\n");
      out.write("                                alert(\"login unsuccessfull\");\n");
      out.write("                            } else if (xmlhttp.responseText.trim() == \"Pending\")\n");
      out.write("                            {\n");
      out.write("                                alert(\"Your Profile is Under Process\");\n");
      out.write("                            } else if (xmlhttp.responseText.trim() == \"block\")\n");
      out.write("                            {\n");
      out.write("                                alert(\"Your Profile is Blocked\");\n");
      out.write("                            }\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                        ;\n");
      out.write("                    }\n");
      out.write("                    xmlhttp.open(\"GET\", \"./merchantLogin?email=\" + email + \"&password=\" + password, true);\n");
      out.write("                    xmlhttp.send();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!--background-->\n");
      out.write("        <h1>Merchant Login</h1>\n");
      out.write("        <!-- Main-Content -->\n");
      out.write("        <div class=\"main-w3layouts-form\">\n");
      out.write("            <h2>Login to your account</h2>\n");
      out.write("            <!-- main-w3layouts-form -->\n");
      out.write("            <form action=\"#\" method=\"post\">\n");
      out.write("                <div class=\"fields-w3-agileits\">\n");
      out.write("                    <span class=\"fa fa-user\" aria-hidden=\"true\"></span>\n");
      out.write("                    <input type=\"text\" name=\"Username\" id=\"email\" required=\"\" placeholder=\"Email\" />\n");
      out.write("                </div>\n");
      out.write("                <div class=\"fields-w3-agileits\">\n");
      out.write("                    <span class=\"fa fa-key\" aria-hidden=\"true\"></span>\n");
      out.write("                    <input type=\"password\" id=\"password\" name=\"Password\" required=\"\" placeholder=\"Password\" />\n");
      out.write("                </div>\n");
      out.write("                <div class=\"remember-section-wthree\">\n");
      out.write("                    <ul>\n");
      out.write("\n");
      out.write("                        <li> <a href=\"forgotmerchantpassword.jsp\">Forgot password?</a> </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <div class=\"clear\"> </div>\n");
      out.write("                </div>\n");
      out.write("                <input type=\"button\" onclick=\"ajax()\" value=\"Login\" />\n");
      out.write("            </form>\n");
      out.write("            <!--// main-w3layouts-form -->\n");
      out.write("            <!-- Social icons -->\n");
      out.write("            <!--\t\t<div class=\"footer_grid-w3ls\">\n");
      out.write("                                    <h5 class=\"sub-hdg-w3l\">or login with your social profile</h5>\n");
      out.write("                                    <ul class=\"social-icons-agileits-w3layouts\">\n");
      out.write("                                            <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("                                            <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("                                            <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                            </div>-->\n");
      out.write("            <!--// Social icons -->\n");
      out.write("        </div>\n");
      out.write("        <!--// Main-Content-->\n");
      out.write("        <!-- copyright -->\n");
      out.write("        <div class=\"copyright-w3-agile\">\n");
      out.write("            <p>Easy Help: All Copyrights Reserved. Created by :Rishab Madaan and Shivam Aggarwal\t\t\t</p>\n");
      out.write("        </div>\n");
      out.write("        <!--// copyright -->\n");
      out.write("        <!--//background-->\n");
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
