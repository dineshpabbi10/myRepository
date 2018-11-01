package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class subHome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("         <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("   \n");
      out.write("        <script>\n");
      out.write("             function fetch()\n");
      out.write("            {\n");
      out.write("                var xml = new XMLHttpRequest();\n");
      out.write("                xml.onreadystatechange = function ()\n");
      out.write("                {\n");
      out.write("                    if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                    {\n");
      out.write("                        var res = xml.responseText.trim();\n");
      out.write("\n");
      out.write("\n");
      out.write("                        var mainjson = JSON.parse(res);\n");
      out.write("                        var jsa = mainjson[\"ans\"];\n");
      out.write("\n");
      out.write("                        var ans = \"\";\n");
      out.write("                        ans += \"<table class='table table-hover'>\";\n");
      out.write("\n");
      out.write("                        ans += \"<thead class='bg-primary'>\";\n");
      out.write("                        \n");
      out.write("                        ans += \"</thead>\";\n");
      out.write("\n");
      out.write("                        ans += \"<tbody>\";\n");
      out.write("\n");
      out.write("\n");
      out.write("                        for (var i = 0; i < jsa.length; i++)\n");
      out.write("                        {\n");
      out.write("                            var js = jsa[i];\n");
      out.write("                            ans += \"<tr>\";\n");
      out.write("                              ans += \"<td><input type='button' value=\\\"\"+js['category_name']+\"\\\"\"+ \" class='btn btn-success' onclick='viewsub(\" + js[\"category_id\"] + \")' /></td>\";\n");
      out.write("                            \n");
      out.write("                          \n");
      out.write("\n");
      out.write("                          \n");
      out.write("                           \n");
      out.write("                            ans += \"</tr>\";\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                        ans += \"</tbody>\";\n");
      out.write("                        ans += \"</table>\";\n");
      out.write("\n");
      out.write("                        document.getElementById(\"d1\").innerHTML = ans;\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xml.open(\"GET\", \"./FetchDetailsOfCategories\", true);\n");
      out.write("                xml.send();\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("   function viewsub(category_id)\n");
      out.write("            {\n");
      out.write("\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("\n");
      out.write("                    var xml = new XMLHttpRequest();\n");
      out.write("                    xml.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                        {\n");
      out.write("                            var res = xml.responseText.trim();\n");
      out.write("                             var mainjson = JSON.parse(res);\n");
      out.write("                        var jsa = mainjson[\"ans\"];\n");
      out.write("                             var ans = \"\";\n");
      out.write("                        ans += \"<table class='table table-hover'>\";\n");
      out.write("\n");
      out.write("                        ans += \"<thead class='bg-primary'>\";\n");
      out.write("                        \n");
      out.write("                        ans += \"</thead>\";\n");
      out.write("\n");
      out.write("                        ans += \"<tbody>\";\n");
      out.write("\n");
      out.write("\n");
      out.write("                        for (var i = 0; i < jsa.length; i++)\n");
      out.write("                        {\n");
      out.write("                            var js = jsa[i];\n");
      out.write("                            ans += \"<tr>\";\n");
      out.write("                      \n");
      out.write("                            ans += \"<td>\" + js[\"subcategory_name\"] + \"</td>\";\n");
      out.write("                          \n");
      out.write("\n");
      out.write("                          \n");
      out.write("                           \n");
      out.write("                            ans += \"</tr>\";\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                        ans += \"</tbody>\";\n");
      out.write("                        ans += \"</table>\";\n");
      out.write("\n");
      out.write("                        document.getElementById(\"d2\").innerHTML = ans;\n");
      out.write("                        }\n");
      out.write("                    };\n");
      out.write("                    xml.open(\"GET\", \"./getSubCategories?category_id=\" + category_id, true);\n");
      out.write("                    xml.send();\n");
      out.write("                \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body onload=\"fetch()\">\n");
      out.write("        <div >\n");
      out.write("            <div id=\"d1\" class=\"col-sm-4\"></div>\n");
      out.write("            <div id=\"d2\"class=\"col-sm-8\"></div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        <h1 ></h1>\n");
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
