package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginHomeAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Admin Login</title>\n");
      out.write("        <!-- Meta tag Keywords -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Personal Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false);\n");
      out.write("            function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <!-- Meta tag Keywords -->\n");
      out.write("\n");
      out.write("        <!-- css files -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style_3.css\" type=\"text/css\" media=\"all\" /> <!-- Style-CSS --> \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/font-awesome_1.css\"> <!-- Font-Awesome-Icons-CSS -->\n");
      out.write("        <!-- //css files -->\n");
      out.write("\n");
      out.write("        <!-- online-fonts -->\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext\" rel=\"stylesheet\">\n");
      out.write("        <!-- //online-fonts -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            //            function login() {\n");
      out.write("            //                $(\"#myModal\").modal('show');\n");
      out.write("            //            }\n");
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
      out.write("                } else {\n");
      out.write("\n");
      out.write("                    var xmlhttp = new XMLHttpRequest();\n");
      out.write("                    xmlhttp.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                        {\n");
      out.write("                            var res = xmlhttp.responseText.trim();\n");
      out.write("                            if (res === \"success\")\n");
      out.write("                            {\n");
      out.write("                                window.location.href = \"adminhome.jsp\";\n");
      out.write("\n");
      out.write("                                alert(\"login successful\");\n");
      out.write("                            } else\n");
      out.write("                            {\n");
      out.write("                                alert(\"login unsuccessfull\");\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("                        ;\n");
      out.write("                    }\n");
      out.write("                    xmlhttp.open(\"GET\", \"./adminLogin?email=\" + email + \"&password=\" + password, true);\n");
      out.write("                    xmlhttp.send();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--header-->\n");
      out.write("        <div class=\"header-w3l\">\n");
      out.write("            <h1>Admin Login</h1>\n");
      out.write("        </div>\n");
      out.write("        <!--//header-->\n");
      out.write("\n");
      out.write("        <!--main-->\n");
      out.write("        <div class=\"main-content-agile\">\n");
      out.write("            <div class=\"sub-main-w3\">\t\n");
      out.write("                <div class=\"wthree-pro\">\n");
      out.write("                    <img src=\"images/admin2.png\" alt=\"image\">\n");
      out.write("                    <h2>Login Now</h2>\n");
      out.write("                </div>\n");
      out.write("                <form action=\"#\" method=\"post\">\n");
      out.write("                    <input id=\"email\" placeholder=\"E-mail\" name=\"Name\" class=\"user\" type=\"text\" required=\"\">\n");
      out.write("                    <span class=\"icon1\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br><br>\n");
      out.write("                    <input   id=\"password\" placeholder=\"Password\" name=\"Password\" class=\"pass\" type=\"password\" required=\"\">\n");
      out.write("                    <span class=\"icon2\"><i class=\"fa fa-unlock\" aria-hidden=\"true\"></i></span><br>\n");
      out.write("\n");
      out.write("                    <div class=\"sub-w3l\">\n");
      out.write("                        <span>  <a style=\"color:white\" href=\"forgotpassword.jsp\">Forgot Password</a></span>\n");
      out.write("                        <div class=\"right-w3l\" >\n");
      out.write("                            <input type=\"button\" value=\"Login\"onclick=\"ajax()\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--//main-->\n");
      out.write("\n");
      out.write("        <!--footer-->\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <p>&copy; 2018 EasyHelp All rights reserved | Design by Rishab and Shivam</p>\n");
      out.write("        </div>\n");
      out.write("        <!--//footer-->\n");
      out.write("\n");
      out.write("    </body>\n");
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
