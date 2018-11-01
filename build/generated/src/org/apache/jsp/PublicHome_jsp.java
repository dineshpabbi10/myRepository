package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class PublicHome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("           <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("\n");
      out.write("            <div class=\"container-fluid\" >\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>                                                \n");
      out.write("                    </button>\n");
      out.write("                    <a  class=\"navbar-brand\" href=\"#\"> bahadur Chand Electronics </a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("                        <li class=\"dropdown\">\n");
      out.write("                           <!-- <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Settings <span class=\"caret\"></span></a>\n");
      out.write("                            <ul class=\"dropdown-menu\">\n");
      out.write("                                \n");
      out.write("                                <li><a href=\"welcome.jsp\">   My Profile</a></li>\n");
      out.write("                                <li><a href=\"#\">Logout</a></li>\n");
      out.write("                            </ul>-->\n");
      out.write("                        </li>\n");
      out.write("                        \n");
      out.write("                        <li><input type=\"search\" placeholder=\" search here \" padding=\"10px\"/></li>\n");
      out.write("                        <li><input type=\"button\" value=\" search \"/></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        <li><a href=\"#\">Sign Up<span class=\"glyphicon glyphicon-user\"></span> </a></li>\n");
      out.write("                        <li><a href=\"adminLogin.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        </div>\n");
      out.write("        <!-- Data Area -->\n");
      out.write("        <div class=\"container\" style=\"background-image: url(designpics/carp1.jpg); \">\n");
      out.write("            <div class=\"row\"><h2>Electronics</h2></div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <div class=\"col-sm-3\"> <img src=\"designpics/carp1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/> </div>\n");
      out.write("\n");
      out.write("                 <div class=\"col-sm-3\">  <img src=\"designpics/carp1.jpg\" alt=\"\"style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("        \n");
      out.write("                  <div class=\"col-sm-3\">  <img src=\"designpics/carp1.jpg\" alt=\"\"style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("                   <div class=\"col-sm-3\"> <img src=\"designpics/carp1.jpg\" alt=\"\"style=\"width: 150px;height: 150px\"/> </div>\n");
      out.write("            </div>\n");
      out.write("              <div class=\"row\"><h2>Repairs</h2></div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <div class=\"col-sm-3\">      <img src=\"designpics/carp1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("         \n");
      out.write("                 <div class=\"col-sm-3\">       <img src=\"designpics/elect1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("                  <div class=\"col-sm-3\">        <img src=\"designpics/plum1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/>  </div>\n");
      out.write("           \n");
      out.write("                   <div class=\"col-sm-3\">      <img src=\"designpics/mob1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/>  </div>\n");
      out.write("                   \n");
      out.write("              \n");
      out.write("            </div>\n");
      out.write("                <div class=\"row\"><h2>Home Furnishing and Interiors</h2></div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <div class=\"col-sm-3\">           <img src=\"designpics/arch1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/>  </div>\n");
      out.write("        \n");
      out.write("                 <div class=\"col-sm-3\">            <img src=\"designpics/int1.jpg\" alt=\"\" style=\"width: 150px;height: 150px\"/> </div>\n");
      out.write("                \n");
      out.write("               \n");
      out.write("                 <div class=\"col-sm-3\">  <img src=\"designpics/paint1.jpg\" alt=\"\"style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("                   \n");
      out.write("           \n");
      out.write("                 <div class=\"col-sm-3\">      <img src=\"designpics/cons1.jpg\" alt=\"\"style=\"width: 150px;height: 150px\"/></div>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("        <div class=\"\"></div>\n");
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
