package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MerchantServiceSelect_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <script src=\"js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"js/jquery-1.7.2.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <title>Select Services</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <script>\r\n");
      out.write("        var globaljsa;\r\n");
      out.write("        var globaljsasub;\r\n");
      out.write("        var selectedid;\r\n");
      out.write("        var selectedindex;\r\n");
      out.write("        var ans;\r\n");
      out.write("        var checkvalues = \"\";\r\n");
      out.write("        function check(value) {\r\n");
      out.write("            var v = value;\r\n");
      out.write("            if (event.target.checked) {\r\n");
      out.write("                if (checkvalues.indexOf(v) == -1) {\r\n");
      out.write("                    checkvalues += v + \"~~\";\r\n");
      out.write("\r\n");
      out.write("                    document.getElementById(\"chkhidden\").value = checkvalues;\r\n");
      out.write("                    //alert(checkvalues);\r\n");
      out.write("                }\r\n");
      out.write("            } else {\r\n");
      out.write("                if (checkvalues.indexOf(v) != -1) {\r\n");
      out.write("                    checkvalues = checkvalues.replace(v + \"~~\", \"\");\r\n");
      out.write("                    document.getElementById(\"chkhidden\").value = checkvalues;\r\n");
      out.write("                    //alert(checkvalues);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        function fetchcategories() {\r\n");
      out.write("            var xml = new XMLHttpRequest();\r\n");
      out.write("            xml.onreadystatechange = function ()\r\n");
      out.write("            {\r\n");
      out.write("                if (xml.readyState == 4 && xml.status == 200)\r\n");
      out.write("                {\r\n");
      out.write("                    var ans1 = \"\";\r\n");
      out.write("                    var res = xml.responseText.trim();\r\n");
      out.write("                    var mainjson = JSON.parse(res);\r\n");
      out.write("                    var jsa = mainjson[\"ans\"];\r\n");
      out.write("                    globaljsa = jsa;\r\n");
      out.write("                    ans1 += \"<option>--Select Category--</option>\";\r\n");
      out.write("                    for (var i = 0; i < jsa.length; i++)\r\n");
      out.write("                    {\r\n");
      out.write("                        var js = jsa[i];\r\n");
      out.write("                        ans1 += \"<option value=\\\"\" + js[\"category_id\"] + \"\\\">\" + js[\"category_name\"] + \"</option>\";\r\n");
      out.write("                    }\r\n");
      out.write("                    document.getElementById(\"maincat\").innerHTML = ans1;\r\n");
      out.write("                }\r\n");
      out.write("            };\r\n");
      out.write("            xml.open(\"GET\", \"./GetCategories\", true);\r\n");
      out.write("            xml.send();\r\n");
      out.write("        }\r\n");
      out.write("        function setselectedcategory(value)\r\n");
      out.write("        {\r\n");
      out.write("            selectedid = value;\r\n");
      out.write("            selectedindex = document.getElementById(\"maincat\").selectedIndex - 1;\r\n");
      out.write("            var index = document.getElementById(\"maincat\").selectedIndex;\r\n");
      out.write("            if (index == 0)\r\n");
      out.write("            {\r\n");
      out.write("\r\n");
      out.write("                alert(\"Select any category\");\r\n");
      out.write("            } else\r\n");
      out.write("            {\r\n");
      out.write("                fetchsubcategoriestable(value);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        function fetchsubcategoriestable(cid) {\r\n");
      out.write("            var xml = new XMLHttpRequest();\r\n");
      out.write("            xml.onreadystatechange = function ()\r\n");
      out.write("            {\r\n");
      out.write("                if (xml.readyState == 4 && xml.status == 200)\r\n");
      out.write("                {\r\n");
      out.write("                    var res = xml.responseText.trim();\r\n");
      out.write("\r\n");
      out.write("                    var mainjson = JSON.parse(res);\r\n");
      out.write("                    var jsa = mainjson[\"ans\"];\r\n");
      out.write("                    globaljsasub = jsa;\r\n");
      out.write("                    ans = \"<div class=\\\"container\\\" >\";\r\n");
      out.write("                    for (var i = 0; i < jsa.length; i++)\r\n");
      out.write("                    {\r\n");
      out.write("                        var js = jsa[i];\r\n");
      out.write("                        ans += \"<div>\";\r\n");
      out.write("                        var subcatid = js[\"subcategory_id\"];\r\n");
      out.write("                        var subname = js[\"subcategory_name\"];\r\n");
      out.write("                        kkkk(subcatid, subname);\r\n");
      out.write("                        ans += \"</div>\";\r\n");
      out.write("                    }\r\n");
      out.write("                    ans += \"</div>\";\r\n");
      out.write("                }\r\n");
      out.write("            };\r\n");
      out.write("            xml.open(\"GET\", \"./getSubCategories?category_id=\" + cid, false);\r\n");
      out.write("            xml.send();\r\n");
      out.write("        }\r\n");
      out.write("        function kkkk(subcatid, subname) {\r\n");
      out.write("            var xmlsub = new XMLHttpRequest();\r\n");
      out.write("            xmlsub.onreadystatechange = function ()\r\n");
      out.write("            {\r\n");
      out.write("                if (xmlsub.readyState == 4 && xmlsub.status == 200)\r\n");
      out.write("                {\r\n");
      out.write("                    var ressub = xmlsub.responseText.trim();\r\n");
      out.write("                    var mainjsonsub = JSON.parse(ressub);\r\n");
      out.write("                    var jsasub = mainjsonsub[\"ans\"];\r\n");
      out.write("\r\n");
      out.write("                    ans += \"<div style=\\\"margin-left:210px\\\"><h4 style=\\\"color: #000000\\\"><b>Services Under Sub-Category: </b><label style=\\\"color: #ff0033\\\">\" + subname + \"</label></h4></div>\";\r\n");
      out.write("                    ans += \"<div class=\\\"row\\\" style=\\\"margin-left:10px\\\">\";\r\n");
      out.write("                    for (var isub = 0; isub < jsasub.length; isub++)\r\n");
      out.write("                    {\r\n");
      out.write("                       var jssub = jsasub[isub];\r\n");
      out.write("                        ans += \"<div class=\\\"col-sm-4 col-sm-offset-2\\\">\";\r\n");
      out.write("                        var st = jssub[\"status\"];\r\n");
      out.write("                        if (st == \"false\") {\r\n");
      out.write("                            ans += \"<input type=\\\"checkbox\\\" id=\\\"\" + isub + \"\\\"  name=\\\"\" + isub + \"\\\" value=\" + jssub[\"service_id\"] + \" onchange=\\\"check(this.value)\\\"><label>&nbsp;\" + jssub[\"service_name\"] + \"</label>\";\r\n");
      out.write("                        }\r\n");
      out.write("                        else if (st == \"true\") {\r\n");
      out.write("                            ans += \"<input type=\\\"checkbox\\\" id=\\\"\" + isub + \"\\\" checked=\\\"true\\\" name=\\\"\" + isub + \"\\\" value=\" + jssub[\"service_id\"] + \" onchange=\\\"check(this.value)\\\"><label>&nbsp;\" + jssub[\"service_name\"] + \"</label>\";\r\n");
      out.write("                            checkvalues += jssub[\"service_id\"] + \"~~\";\r\n");
      out.write("\r\n");
      out.write("                            document.getElementById(\"chkhidden\").value = checkvalues;\r\n");
      out.write("                        }\r\n");
      out.write("                        ans += \"</div>\";\r\n");
      out.write("                    }\r\n");
      out.write("                    ans += \"</div>\";\r\n");
      out.write("                    document.getElementById(\"d1\").innerHTML = ans;\r\n");
      out.write("                }\r\n");
      out.write("            };\r\n");
      out.write("            xmlsub.open(\"GET\", \"./showservicesformerchantselect?subcategory_id=\" + subcatid, true);\r\n");
      out.write("            xmlsub.send();\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        function savedata() {\r\n");
      out.write("            var xml = new XMLHttpRequest();\r\n");
      out.write("            xml.onreadystatechange = function()\r\n");
      out.write("            {\r\n");
      out.write("                if (xml.readyState == 4 && xml.status == 200)\r\n");
      out.write("                {\r\n");
      out.write("                    var res = xml.responseText.trim();\r\n");
      out.write("                    alert(res);\r\n");
      out.write("\r\n");
      out.write("                }\r\n");
      out.write("            };\r\n");
      out.write("            xml.open(\"GET\", \"./savemerchantservices?checkvalues=\" + checkvalues, false);\r\n");
      out.write("            xml.send();\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <body onload=\"fetchcategories()\" style=\"background-color:#ff9999\" background=\"pics/23.jpg\">\r\n");
      out.write("        <div class=\"container\"><div class=\"page-header\"><center><h1 style=\"color:#ff0033\"><b>SELECT - SERVICES</b> </h1></center></div>\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-sm-8 col-sm-offset-2\">\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"hidden\" id=\"chkhidden\" />\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label>Select Category</label><select class=\"form-control\" id=\"maincat\" name=\"maincat\" onchange=\"setselectedcategory(this.value)\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </select>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"d1\" style=\"margin-top: 50px\">\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("             <center><input type=\"button\" value=\"Save \" onclick=\"savedata()\"  class=\"btn btn-success\"/></center>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
