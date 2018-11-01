package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AdminLogoutNavbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    if(session.getAttribute("email")==null)
    {
        
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            window.location.href=\"LoginHomeAdmin.jsp\";\r\n");
      out.write("            </script>\r\n");
      out.write("        ");

    }
    
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--booststrap-->\r\n");
      out.write("<link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" >\r\n");
      out.write("<!--//booststrap end-->\r\n");
      out.write("\r\n");
      out.write("<!-- font-awesome icons -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/font-awesome.min.css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- //font-awesome icons -->\r\n");
      out.write("<!--stylesheets-->\r\n");
      out.write("<link href=\"css/style_1.css\" rel='stylesheet' type='text/css' media=\"all\">\r\n");
      out.write("<link href=\"css/popuo-box.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" /><!-- //pop-ups-->\r\n");
      out.write("<!--<link href=\"css/lsb.css\" rel=\"stylesheet\" type=\"text/css\"> gallery lsb-->\r\n");
      out.write("\r\n");
      out.write("<link href=\"//fonts.googleapis.com/css?family=Montserrat:400,500,600\" rel=\"stylesheet\">\r\n");
      out.write("<!--//style sheet end here-->\r\n");
      out.write("<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/modernizr-2.6.2.min.js\"></script>\r\n");
      out.write("<script src=\"js/bootstrap.min.js\"></script>\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"header-w3layouts\" > \r\n");
      out.write("    <!-- Navigation -->\r\n");
      out.write("    <nav class=\"navbar navbar-default navbar-fixed-top top-nav-collapse\">\r\n");
      out.write("        <div class=\"navbar-header page-scroll\">\r\n");
      out.write("            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\r\n");
      out.write("                <span class=\"sr-only\"></span>\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("            </button>\r\n");
      out.write("            <h1><a class=\"navbar-brand\" href=\"index.html\">Easy<span>Help</span>\r\n");
      out.write("                </a></h1>\r\n");
      out.write("        </div> \r\n");
      out.write("        <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("        <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\r\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->\r\n");
      out.write("                <li class=\"hidden\"><a class=\"page-scroll\" href=\"#page-top\"></a>\t</li>\r\n");
      out.write("                <li><a class=\"page-scroll\" href=\"adminhome.jsp\">Home</a></li>\r\n");
      out.write("                <li class=\"dropdown\">\r\n");
      out.write("\r\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Manage<span class=\"caret\"></span></a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("\r\n");
      out.write("                        <li><a href=\"addServiceCategories.jsp\" class=\"\" style=\"color:#000033\" >Manage Categories<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>\r\n");
      out.write("                        <li><a href=\"manageSubCategories.jsp\" class=\"\" style=\"color:#000033\" >Manage SubCategories<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>\r\n");
      out.write("                        <li><a href=\"manageservices.jsp\" class=\"\" style=\"color:#000033\" >Manage Services<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>\r\n");
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"dropdown\">\r\n");
      out.write("\r\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Merchant Options <span class=\"caret\"></span></a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("\r\n");
      out.write("                        <li><a href=\"AdminApproveMerchant.jsp\" class=\"\" style=\"color:#000033\" >Merchant Approve<span class=\"glyphicon glyphicon-user\"></span></a></li>\r\n");
      out.write("                        <li><a href=\"ReviewMerchants.jsp\" class=\"\" style=\"color:#000033\" >Merchant Review<span class=\"glyphicon glyphicon-user\"></span></a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li><a class=\"page-scroll scroll\" href=\"ChangeMerchantPassword.jsp\">Change Password</a></li>\r\n");
      out.write("                <li><a class=\"page-scroll scroll\" href=\"./AdminLogout\">Logout</a></li>\r\n");
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /.navbar-collapse -->\r\n");
      out.write("    </nav>  \r\n");
      out.write("</div>\t\r\n");
      out.write("<!-- //header -->");
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
