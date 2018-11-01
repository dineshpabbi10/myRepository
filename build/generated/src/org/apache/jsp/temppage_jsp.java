package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class temppage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/jquery.rateyo.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/jquery.rateyo.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"getavg('new')\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"jumbotron\" style=\"text-align: center\">\n");
      out.write("                <h1>Star Rating with JQuery Demo</h1>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-4 col-sm-offset-2\" style=\"text-align: center\">\n");
      out.write("                <label>Add New Rating</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-4\" style=\"text-align: center\">\n");
      out.write("                <label>Average Rating</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!--div that shows rating bar-->\n");
      out.write("            <div class=\"col-sm-2 col-sm-offset-3\">\n");
      out.write("                <center><div id=\"giverating\"></div></center>\n");
      out.write("            </div> \n");
      out.write("            <h4 class=\"col-sm-2\" id=\"newratingtext\"></h4>\n");
      out.write("\n");
      out.write("            <!--div that shows a average rating-->\n");
      out.write("            <div class=\"col-sm-2\">\n");
      out.write("                <center><div id=\"averagerating\"></div></center>\n");
      out.write("            </div>\n");
      out.write("            <h4 class=\"col-sm-2\" id=\"ratingtext\"></h4>\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-4 col-sm-offset-2\" style=\"text-align: center\">\n");
      out.write("                <label>This Rating will be added to the database</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!--div that shows a average rating-->\n");
      out.write("            <div class=\"col-sm-4\" style=\"text-align: center\">\n");
      out.write("                <label>This is the average of all the ratings in the database</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-offset-2 col-sm-8 alert alert-danger\" style=\"margin-top: 20px\">\n");
      out.write("                <label>This page uses a Database to store ratings</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            /////Create Rating Bar and add onclick listener/////\n");
      out.write("            $('#giverating').rateYo({\n");
      out.write("                halfStar: true,\n");
      out.write("                onSet: function (rating, rateYoInstance)\n");
      out.write("                {\n");
      out.write("                    addRating(rating);\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            /////Create Average Rating Bar/////\n");
      out.write("            $('#averagerating').rateYo({\n");
      out.write("                rating: 0,\n");
      out.write("                readOnly: true\n");
      out.write("            });\n");
      out.write("            document.getElementById('ratingtext').innerHTML = '0/5';\n");
      out.write("\n");
      out.write("            /////Function to get Average Rating from Database//////\n");
      out.write("            function getavg(from)\n");
      out.write("            {\n");
      out.write("                var xml = new XMLHttpRequest();\n");
      out.write("\n");
      out.write("                xml.onreadystatechange = function ()\n");
      out.write("                {\n");
      out.write("                    if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                    {\n");
      out.write("                        var response = xml.responseText.trim();\n");
      out.write("\n");
      out.write("                        alert(\"average: \" + response);\n");
      out.write("                        /////Create rating bar that shows average rating/////\n");
      out.write("                        if (from == 'new')\n");
      out.write("                        {\n");
      out.write("                            $('#averagerating').rateYo({\n");
      out.write("                                rating: response,\n");
      out.write("                                readOnly: true\n");
      out.write("                            });\n");
      out.write("                            document.getElementById('ratingtext').innerHTML = response + '/5';\n");
      out.write("                        } else\n");
      out.write("                        {\n");
      out.write("                            $('#averagerating').rateYo('rating', response);\n");
      out.write("                            document.getElementById('ratingtext').innerHTML = response + '/5';\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xml.open('GET', './getAverageRating', true);\n");
      out.write("                xml.send();\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            ////Function to Add Rating to Database//////\n");
      out.write("            function addRating(score)\n");
      out.write("            {\n");
      out.write("                alert('score: ' + score);\n");
      out.write("\n");
      out.write("                var xml = new XMLHttpRequest();\n");
      out.write("\n");
      out.write("                xml.onreadystatechange = function ()\n");
      out.write("                {\n");
      out.write("                    if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                    {\n");
      out.write("                        var response = xml.responseText.trim();\n");
      out.write("\n");
      out.write("                        if (response == \"success\")\n");
      out.write("                        {\n");
      out.write("                            getavg('old');\n");
      out.write("                        } else\n");
      out.write("                        {\n");
      out.write("                            alert(\"Failed to add rating\");\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xml.open('GET', './AddRating?score=' + score, true);\n");
      out.write("                xml.send();\n");
      out.write("                document.getElementById('newratingtext').innerHTML = score + '/5';\n");
      out.write("            }\n");
      out.write("        </script>\n");
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
