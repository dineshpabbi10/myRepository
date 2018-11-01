
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>

        <script>
//            function login() {
//                $("#myModal").modal('show');
//            }


            function ajax()
            {


                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        if (res === "success")
                        {
                            window.location.href = "merchantHome.jsp";

                            alert("login successful");
                        } 
                        else if(xmlhttp.responseText.trim()=="failed")
                        {
                            alert("login unsuccessfull");
                        }
                        
                        else if(xmlhttp.responseText.trim()=="Pending")
                        {
                            alert("Your Profile is Under Process");
                        }
                         
                          else if(xmlhttp.responseText.trim()=="block")
                        {
                            alert("Your Profile is Blocked");
                        }
                         
                    }
                    ;
                }
                xmlhttp.open("GET", "./merchantLogin?email=" + email + "&password=" + password, true);
                xmlhttp.send();
            }
        </script>

    </head>
    <body>
        <div class="container">



            <div class="row">
                <div class="col-sm-12">



                    <button type="button" class="btn btn-info btn-lg" onclick="login()" >Click Here To Login</button>

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">User Login</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label>Enter Email</label>
                                            <input type="email" placeholder="enter email" class="form-control" id="email" />
                                        </div>

                                        <div class="form-group">
                                            <label>Enter Password</label>
                                            <input type="password" placeholder="enter password" class="form-control" id="password" />
                                        </div>

                                        <input type="button" class="btn btn-success" onclick="ajax()"value="Login" /><br>
                                        <br>

                                        <div class="form-group" > 
                                            <a href="forgotmerchantpassword.jsp" class="form-control btn btn-success">forgot password</a>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>





            </div>
    </body>
</html>
