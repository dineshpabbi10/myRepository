package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MerchantLogoutNavbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write(" <!--booststrap-->\n");
      out.write(" ");

    if(session.getAttribute("email")==null)
    {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            window.location.href=\"\"LoginHomeMerchant.jsp\"\";\n");
      out.write("            </script>\n");
      out.write("        ");

    }
    
    
      out.write("\n");
      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" >\n");
      out.write("        <!--//booststrap end-->\n");
      out.write("\n");
      out.write("        <!-- font-awesome icons -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\" />\n");
      out.write("\n");
      out.write("        <!-- //font-awesome icons -->\n");
      out.write("        <!--stylesheets-->\n");
      out.write("        <link href=\"css/style_1.css\" rel='stylesheet' type='text/css' media=\"all\">\n");
      out.write("        <link href=\"css/popuo-box.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" /><!-- //pop-ups-->\n");
      out.write("        <!--<link href=\"css/lsb.css\" rel=\"stylesheet\" type=\"text/css\"> gallery lsb-->\n");
      out.write("\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Montserrat:400,500,600\" rel=\"stylesheet\">\n");
      out.write("        <!--//style sheet end here-->\n");
      out.write("                <script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/modernizr-2.6.2.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\t\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"header-w3layouts\" > \n");
      out.write("            <!-- Navigation -->\n");
      out.write("            <nav class=\"navbar navbar-default navbar-fixed-top top-nav-collapse\">\n");
      out.write("                <div class=\"navbar-header page-scroll\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n");
      out.write("                        <span class=\"sr-only\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <h1><a class=\"navbar-brand\" href=\"index.html\">Easy<span>Help</span>\n");
      out.write("                        </a></h1>\n");
      out.write("                </div> \n");
      out.write("                <!-- Collect the nav links, forms, and other content for toggling -->\n");
      out.write("                <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->\n");
      out.write("                        <li class=\"hidden\"><a class=\"page-scroll\" href=\"#page-top\"></a>\t</li>\n");
      out.write("                        <li><a class=\"page-scroll\" href=\"HomePage.jsp\">Home</a></li>\n");
      out.write("                        <li><a class=\"page-scroll scroll\" href=\"merchantHome.jsp\">Home</a></li>\n");
      out.write("                        <li><a class=\"page-scroll scroll\" href=\"MerchantServiceSelect.jsp\">Select Services</a></li>\n");
      out.write("                        <li><a class=\"page-scroll scroll\" href=\"merchantBookings.jsp\">My Bookings</a></li>\n");
      out.write("                        <li><a class=\"page-scroll scroll\" href=\"HomePage.jsp\">Edit Profile</a></li>\n");
      out.write("                        <li><a class=\"page-scroll scroll\" href=\"ChangeMerchantPassword.jsp\">Change Password</a></li>\n");
      out.write("                         <li><a class=\"page-scroll scroll\" href=\"./MerchantLogout\">Logout</a></li>\n");
      out.write("                     \n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <!-- /.navbar-collapse -->\n");
      out.write("            </nav>  \n");
      out.write("        </div>\t\n");
      out.write("        <!-- //header -->");
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
