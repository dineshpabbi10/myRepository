package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MerchantSignupNew_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Official Signup Form Flat Responsive widget Template :: w3layouts</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <!-- fonts -->\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Monoton\" rel=\"stylesheet\">\n");
      out.write("        <!-- /fonts -->\n");
      out.write("        <!-- css -->\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <link href=\"css/style_4.css\" rel='stylesheet' type='text/css' media=\"all\" />\n");
      out.write("        <!-- /css -->\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function go()\n");
      out.write("            {\n");
      out.write("                var password = document.getElementById(\"password1\").value;\n");
      out.write("                var confirmpassword = document.getElementById(\"password2\").value;\n");
      out.write("                if (password == \"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"enter password\");\n");
      out.write("                } else if (confirmpassword == \"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"enter confirm password\");\n");
      out.write("                } else if (confirmpassword != password)\n");
      out.write("                {\n");
      out.write("                    alert(\"password and confirmpassword do not match\");\n");
      out.write("                } else\n");
      out.write("                {\n");
      out.write("                    var ans = \"\";\n");
      out.write("                    var formdata = new FormData();\n");
      out.write("\n");
      out.write("                    var controls = document.getElementById(\"form1\").elements;\n");
      out.write("\n");
      out.write("                    alert(\"found \" + controls.length + \" controls in form\");\n");
      out.write("\n");
      out.write("                    var flag = 0;\n");
      out.write("                    for (var i = 0; i < controls.length; i++)\n");
      out.write("                    {\n");
      out.write("                        if (controls[i].name == \"\" || controls[i].name == null)\n");
      out.write("                        {\n");
      out.write("                            flag = 1;\n");
      out.write("                        }\n");
      out.write("\n");
      out.write("                        if (controls[i].type == \"file\")\n");
      out.write("                        {\n");
      out.write("                            if (controls[i].files.length != 0)\n");
      out.write("                            {\n");
      out.write("                                ans = ans + controls[i].name + \": \" + controls[i].files[0].name + \"\\n\";\n");
      out.write("                                formdata.append(controls[i].name, controls[i].files[0]);\n");
      out.write("                            } else\n");
      out.write("                            {\n");
      out.write("                                flag = 2;\n");
      out.write("                            }\n");
      out.write("                        } else    // for other input types  text,password,select\n");
      out.write("                        {\n");
      out.write("                            ans = ans + controls[i].name + \": \" + controls[i].value + \"\\n\";\n");
      out.write("                            //formdata.append(\"rn\",document.getElementById(\"rn\").value);\n");
      out.write("                            //formdata.append(firstfile.name,firstfile);\n");
      out.write("\n");
      out.write("                            formdata.append(controls[i].name, controls[i].value);\n");
      out.write("                        }\n");
      out.write("                        //                    alert(ans);\n");
      out.write("                        //                    alert(flag);\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    if (flag == 1)\n");
      out.write("                    {\n");
      out.write("                        alert(\"CHECK: --> Give name attribute to all controls in form\");\n");
      out.write("                    } else if (flag == 2)\n");
      out.write("                    {\n");
      out.write("                        alert(\"CHECK: --> Select Files for file controls\");\n");
      out.write("                    } else\n");
      out.write("                    {\n");
      out.write("                        alert(ans);\n");
      out.write("                        alert(formdata);\n");
      out.write("\n");
      out.write("                        var xhr = new XMLHttpRequest();\n");
      out.write("\n");
      out.write("                        xhr.open(\"POST\", \"./MerchantSignupServlet\", true);\n");
      out.write("                        //for response receiving\n");
      out.write("                        xhr.onreadystatechange = function ()\n");
      out.write("                        {\n");
      out.write("                            if (xhr.readyState === 4 && xhr.status == 200)\n");
      out.write("                            {\n");
      out.write("                                alert(xhr.responseText);\n");
      out.write("                                //fetch();\n");
      out.write("                                        if(xhr.responseText.trim()===\"success\")\n");
      out.write("                                        {\n");
      out.write("                                            window.location.href = \"MerchantSignup2.jsp\";\n");
      out.write("                                        }\n");
      out.write("\n");
      out.write("                            }\n");
      out.write("                        };\n");
      out.write("                        xhr.send(formdata);\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 class=\"w3ls\">Merchant Signup</h1>\n");
      out.write("        <div class=\"content-w3ls\">\n");
      out.write("            <div class=\"content-agile1\">\n");
      out.write("                <h2 class=\"agileits1\">Official</h2>\n");
      out.write("                <p class=\"agileits2\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"content-agile2\">\n");
      out.write("                <form action=\"#\" method=\"post\" id=\"form1\">\n");
      out.write("                    <div class=\"form-control w3layouts\"> \n");
      out.write("                        <input type=\"text\" id=\"firstname\" name=\"name\" placeholder=\"Name\" title=\"Please enter your First Name\" required=\"\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-control w3layouts\">\t\n");
      out.write("                        <input type=\"email\" id=\"email\" name=\"email\" placeholder=\"E-mail\" title=\"Please enter a valid email\" required=\"\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-control agileinfo\">\t\n");
      out.write("                        <input type=\"password\" class=\"lock\" name=\"password\" placeholder=\"Password\" id=\"password1\" required=\"\">\n");
      out.write("                    </div>\t\n");
      out.write("\n");
      out.write("                    <div class=\"form-control agileinfo\">\t\n");
      out.write("                        <input type=\"password\" class=\"lock\" name=\"confirmpassword\" placeholder=\"Confirm Password\" id=\"password2\" required=\"\">\n");
      out.write("                    </div>\t\t\t\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("                                    <input type=\"button\" class=\"register\" onclick=\"go()\" value=\"Register\">\n");
      out.write("\n");
      out.write("                <script type=\"text/javascript\">\n");
      out.write("                    window.onload = function () {\n");
      out.write("                        document.getElementById(\"password1\").onchange = validatePassword;\n");
      out.write("                        document.getElementById(\"password2\").onchange = validatePassword;\n");
      out.write("                    }\n");
      out.write("                    function validatePassword() {\n");
      out.write("                        var pass2 = document.getElementById(\"password2\").value;\n");
      out.write("                        var pass1 = document.getElementById(\"password1\").value;\n");
      out.write("                        if (pass1 != pass2)\n");
      out.write("                            document.getElementById(\"password2\").setCustomValidity(\"Passwords Don't Match\");\n");
      out.write("                        else\n");
      out.write("                            document.getElementById(\"password2\").setCustomValidity('');\n");
      out.write("                        //empty string means no validation error\n");
      out.write("                    }\n");
      out.write("                </script>\n");
      out.write("                <p class=\"wthree w3l\">Already Registered? <a href=\"LoginHomeMerchant.jsp\" style=\"color: white\"><u>LogIn</u></a></p>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("        </div>\n");
      out.write("        <p class=\"copyright w3l\">© 2017 Official Signup Form. All Rights Reserved | Design by <a href=\"https://w3layouts.com/\" target=\"_blank\">W3layouts</a></p>\n");
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
