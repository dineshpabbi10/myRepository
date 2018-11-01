package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginHomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!--Author: W3layouts\n");
      out.write("Author URL: http://w3layouts.com\n");
      out.write("License: Creative Commons Attribution 3.0 Unported\n");
      out.write("License URL: http://creativecommons.org/licenses/by/3.0/\n");
      out.write("-->\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Personal Login Form Responsive Widget Template :: w3layouts</title>\n");
      out.write("<!-- Meta tag Keywords -->\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<meta name=\"keywords\" content=\"Personal Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements\" />\n");
      out.write("<script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false);\n");
      out.write("function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("<!-- Meta tag Keywords -->\n");
      out.write("\n");
      out.write("<!-- css files -->\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\" /> <!-- Style-CSS --> \n");
      out.write("<link rel=\"stylesheet\" href=\"css/font-awesome.css\"> <!-- Font-Awesome-Icons-CSS -->\n");
      out.write("<!-- //css files -->\n");
      out.write("\n");
      out.write("<!-- online-fonts -->\n");
      out.write("<link href=\"//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext\" rel=\"stylesheet\">\n");
      out.write("<!-- //online-fonts -->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!--header-->\n");
      out.write("\t<div class=\"header-w3l\">\n");
      out.write("\t\t<h1>Personal Login Form</h1>\n");
      out.write("\t</div>\n");
      out.write("<!--//header-->\n");
      out.write("\n");
      out.write("<!--main-->\n");
      out.write("<div class=\"main-content-agile\">\n");
      out.write("\t<div class=\"sub-main-w3\">\t\n");
      out.write("\t\t<div class=\"wthree-pro\">\n");
      out.write("\t\t\t<img src=\"images/pro.jpg\" alt=\"image\">\n");
      out.write("\t\t\t<h2>Login Now</h2>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<form action=\"#\" method=\"post\">\n");
      out.write("\t\t\t<input placeholder=\"Username or E-mail\" name=\"Name\" class=\"user\" type=\"text\" required=\"\">\n");
      out.write("\t\t\t<span class=\"icon1\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br><br>\n");
      out.write("\t\t\t<input  placeholder=\"Password\" name=\"Password\" class=\"pass\" type=\"password\" required=\"\">\n");
      out.write("\t\t\t<span class=\"icon2\"><i class=\"fa fa-unlock\" aria-hidden=\"true\"></i></span><br>\n");
      out.write("\t\t\t<div class=\"sub-w3l\">\n");
      out.write("\t\t\t\t<span><input type=\"checkbox\" />Remember Me</span>\n");
      out.write("\t\t\t\t<div class=\"right-w3l\">\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"Login\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<!--//main-->\n");
      out.write("\n");
      out.write("<!--footer-->\n");
      out.write("<div class=\"footer\">\n");
      out.write("\t<p>All rights reserved | Design by Rishab Madaan</p>\n");
      out.write("</div>\n");
      out.write("<!--//footer-->\n");
      out.write("\n");
      out.write("</body>\n");
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
