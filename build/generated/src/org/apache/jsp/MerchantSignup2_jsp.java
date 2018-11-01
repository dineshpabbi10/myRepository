package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MerchantSignup2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            function go()\n");
      out.write("            { \n");
      out.write("                var ans = \"\";\n");
      out.write("                var formdata = new FormData();\n");
      out.write("\n");
      out.write("                var controls = document.getElementById(\"form1\").elements;\n");
      out.write("\n");
      out.write("                alert(\"found \" + controls.length + \" controls in form\");\n");
      out.write("\n");
      out.write("                var flag = 0;\n");
      out.write("                for (var i = 0; i < controls.length; i++)\n");
      out.write("                {\n");
      out.write("                    if (controls[i].name == \"\" || controls[i].name == null)\n");
      out.write("                    {\n");
      out.write("                        flag = 1;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    if (controls[i].type == \"file\")\n");
      out.write("                    {\n");
      out.write("                        if (controls[i].files.length != 0)\n");
      out.write("                        {\n");
      out.write("                            ans = ans + controls[i].name + \": \" + controls[i].files[0].name + \"\\n\";\n");
      out.write("                            formdata.append(controls[i].name, controls[i].files[0]);\n");
      out.write("                        } else\n");
      out.write("                        {\n");
      out.write("                            flag = 2;\n");
      out.write("                        }\n");
      out.write("                    } else    // for other input types  text,password,select\n");
      out.write("                    {\n");
      out.write("                        ans = ans + controls[i].name + \": \" + controls[i].value + \"\\n\";\n");
      out.write("                        //formdata.append(\"rn\",document.getElementById(\"rn\").value);\n");
      out.write("                        //formdata.append(firstfile.name,firstfile);\n");
      out.write("\n");
      out.write("                        formdata.append(controls[i].name, controls[i].value);\n");
      out.write("                    }\n");
      out.write("//                    alert(ans);\n");
      out.write("//                    alert(flag);\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if (flag == 1)\n");
      out.write("                {\n");
      out.write("                    alert(\"CHECK: --> Give name attribute to all controls in form\");\n");
      out.write("                } else if (flag == 2)\n");
      out.write("                {\n");
      out.write("                    alert(\"CHECK: --> Select Files for file controls\");\n");
      out.write("                } else\n");
      out.write("                {\n");
      out.write("                    alert(ans);\n");
      out.write("                    alert(formdata);\n");
      out.write("\n");
      out.write("                    var xhr = new XMLHttpRequest();\n");
      out.write("\n");
      out.write("                    xhr.open(\"POST\", \"./MerchantSignupServlet2\", true);\n");
      out.write("                    //for response receiving\n");
      out.write("                    xhr.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xhr.readyState === 4 && xhr.status === 200)\n");
      out.write("                        {\n");
      out.write("                            alert(xhr.responseText);\n");
      out.write("                            if(xhr.responseText.trim()===\"success\")\n");
      out.write("                            {\n");
      out.write("                                alert(\"your application is under process, once you are verified you will get a message\");\n");
      out.write("                                window.location.href=\"LoginHomeMerchant.jsp\";\n");
      out.write("                            }\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                    };\n");
      out.write("                    xhr.send(formdata);\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            \n");
      out.write("\n");
      out.write("            \n");
      out.write("            </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body style=\"background: url('images/Background13.jpg');height: 580px\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"page-header\">\n");
      out.write("                 <h1>Complete your signup</h1>\n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("        </div>\n");
      out.write("            <form class=\"form-horizontal\" id=\"form1\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                <label class=\"col-sm-4\">Mobile-No</label>\n");
      out.write("                <div class=\"col-sm-8\"><input type=\"text\" class=\"form-control\" name=\"phoneNo\"/>                \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                 <div class=\"form-group\">\n");
      out.write("                <label class=\"col-sm-4\">Enter Start-Time</label>\n");
      out.write("                <div class=\"col-sm-8\"><input type=\"time\" class=\"form-control\" name=\"starttime\"/>                \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                 <div class=\"form-group\">\n");
      out.write("                <label class=\"col-sm-4\">Enter End-Time</label>\n");
      out.write("                <div class=\"col-sm-8\"><input type=\"time\" class=\"form-control\" name=\"endtime\"/>                \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                 <div class=\"form-group\">\n");
      out.write("                <label class=\"col-sm-4\">Photo</label>\n");
      out.write("                <div class=\"col-sm-8\"><input type=\"file\" class=\"form-control\" name=\"photo\"/>                \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                 <div class=\"form-group\">\n");
      out.write("                <label class=\"col-sm-4\">ID-Proof</label>\n");
      out.write("                <div class=\"col-sm-8\"><input type=\"file\" class=\"form-control\" name=\"proof\"/>                \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("              <div class=\"form-group\">\n");
      out.write("               \n");
      out.write("                  <div class=\"col-sm-offset-4 col-sm-2\"><input type=\"button\" value=\"Submit\" class=\"form-control btn btn-default\" onclick=\"go()\"></div>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
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
