<%-- 
    Document   : ChangePassword
    Created on : Apr 8, 2018, 11:20:59 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>

            function go()
            {
                var oldpassword = document.getElementById("oldpassword").value;
                var newpassword = document.getElementById("newpassword").value;
                var confirmpassword = document.getElementById("confirmpassword").value;
                if (oldpassword == "") {
                    alert("enter oldpassword");
                } else if (newpassword == "") {
                    alert("enter newpassword");
                } else if (confirmpassword == "") {
                    alert("enter confirm password");
                } else if (confirmpassword != newpassword) {
                    alert(" new password and confirm password not match");
                } else

                {

                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res == "success")
                            {


                                alert("password changed");
                            } else
                            {
                                alert("change unsuccessful");
                            }
                        }

                    };
                    xmlhttp.open("GET", "./AdminChangePass?oldpassword=" + oldpassword + "&newpassword=" + newpassword, true);
                    xmlhttp.send();
                }

            }



        </script>





    </head>
    <body style="margin-top: 80px;background: url('images/back9.jpg');height: 580px">
         <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>
        <div class="container">

            <form>  
                <div class="form-group">
                    <div>
                        <label>OldPassword</label><br>
                        <input type="text" class="form-control" placeholder="enter old password" id="oldpassword"/><br>

                    </div>
                    <div>
                        <label>NewPassword</label><br>
                        <input type="text" class="form-control" placeholder="enter new password" id="newpassword"/><br>
                    </div>

                    <div>
                        <label>ConfirmPassword</label><br>
                        <input type="text" class="form-control" placeholder="confirm password" id="confirmpassword"/><br>
                    </div>

                    <input type="button" class="btn btn-danger" value="change" onclick="go()"/>

                </div>
            </form>
        </div>
    </body>
</html>
