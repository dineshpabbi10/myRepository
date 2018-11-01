<%-- 
    Document   : customersignup
    Created on : Apr 18, 2018, 12:47:40 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>
            var alreadyexit;
            function show() {
                document.getElementById("logindiv").style.display = 'none';
                document.getElementById("otp").value = "";
                document.getElementById("email").value = "";
                document.getElementById("name").value = "";
                document.getElementById("mobile").value = "";
                document.getElementById("lpassword").value = "";
                $("#myModal").modal('show');
            }


            function sendotp()
            {
                document.getElementById("logindiv").style.display = 'none';
                document.getElementById("otp").value = "";
                document.getElementById("email").value = "";
                document.getElementById("name").value = "";
                document.getElementById("password").value = "";
                var mobile = document.getElementById("mobile").value;
                if (mobile == "") {
                    alert("enter mobile no");
                } else if (mobile.length != 10) {
                    alert("mobile no must be of 10 digits");
                } else if (isNaN(mobile)) {
                    alert("mobile no use numerals only");
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();

                            if (res == "alreadyexist") {
                                alreadyexit = "true";
                                alert("User Already Registered /otp sent to mobile just enter and login");
                            } else if (res == "notexist") {
                                alreadyexit = "false";
                                alert("First Time User/ otp sent to mobile fill other details and login");
                            }



                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?mobile=" + mobile + "&opr=sendotp", true);
                    xmlhttp.send();
                }
            }
            function verify()
            {
                var otp = document.getElementById("otp").value;
                var mobile = document.getElementById("mobile").value;
                if (otp == "") {
                    alert("enter otp");
                } else if (otp.length != 5) {
                    alert("otp must be of 5 digits");
                } else if (isNaN(otp)) {
                    alert("otp include numerals only");
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();

                            if (res == "verified") {
                                alert("otp verified");
                                if (alreadyexit == "false") {
                                    document.getElementById("logindiv").style.display = 'block';
                                    document.getElementById("mobile").disabled = "false";
                                    document.getElementById("otp").disabled = "false";
                                    document.getElementById("btverify").disabled = "false";
                                } else if (alreadyexit == "true") {
                                    window.location.href = "customerhome.jsp";
                                }

                            } else {
                                alert("otp not match");
                            }


                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?otp=" + otp + "&opr=verify" + "&alreadyexist=" + alreadyexit + "&mobile=" + mobile, true);
                    xmlhttp.send();
                }
            }
            function login() {
                var email = document.getElementById("email").value;
                var name = document.getElementById("name").value;
                var mobile = document.getElementById("mobile").value;
                var password = document.getElementById("password").value;
                if (email == "") {
                    alert("enter email");
                } else if (email.indexOf("@") == -1 || email.indexOf("@") > email.lastIndexOf(".")) {
                    alert("invalid email");
                } else if (name == "") {
                    alert("enter name");
                } else if (password == "") {
                    alert("enter password");
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            alert(res);
                            if (res == "success") {
                                alert("sign up success");
                                document.getElementById("otp").value = "";
                                document.getElementById("email").value = "";
                                document.getElementById("name").value = "";
                                document.getElementById("mobile").value = "";
                                document.getElementById("password").value = "";
                                document.getElementById("mobile").enabled = "true";
                                document.getElementById("otp").enabled = "true";
                                document.getElementById("btverify").enabled = "true";
                                $("#myModal").modal('hide');
                                window.location.href = "customerhome.jsp";
                            } else {
                                alert("email already registered");
                            }


                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?email=" + email + "&name=" + name + "&mobile=" + mobile + "&password=" + password + "&opr=signup", true);
                    xmlhttp.send();
                }
            }
            function passwordlogin() {
                var mobile = document.getElementById("mobile").value;
                var password = document.getElementById("lpassword").value;
                if (mobile == "") {
                    alert("enter mobile no");
                } else if (mobile.length != 10) {
                    alert("mobile no must be of 10 digits");
                } else if (isNaN(mobile)) {
                    alert("mobile no use numerals only");
                } else if (password === "") {
                    alert("fill password");
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res === "success") {

                                $("#myModal").modal("hide");
                                window.location.href = "customerhome.jsp";
                            } else {
                                alert("invalid email /password");
                            }


                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?mobile=" + mobile + "&password=" + password + "&opr=loginusingpassword", true);
                    xmlhttp.send();

                }
            }



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
                            window.location.href = "adminhome.jsp";

                            alert("login successful");
                        } else
                        {
                            alert("login unsuccessfull");
                        }
                    }
                    ;
                }
                xmlhttp.open("GET", "./customerhome?email=" + email + "&password=" + password, true);
                xmlhttp.send();
            }


        </script>
    </head>
    <body>

        <!--modal popup start-->

        <div class="container">

            <div class ="jumbotron">


                <div class="row">
                    <div class="col-sm-12">



                        <button type="button" class="btn btn-info btn-sm " onclick="show()" >Customer Login/Signup  </button>


                        <!-- Modal -->
                            
                           <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Customer Login/Signup</h4>
                                    </div>
                                    <div class="modal-body">


                                        <form class="form-horizontal">

                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="email">Enter Mobile </label>
                                                <div class="col-sm-8">
                                                    <input id="mobile" name="mobile" type="tel"  placeholder="Enter Mobile" class="form-control" required  /><br>
                                                    <label class="control-label col-sm-4" for="password">Enter Password </label>
                                                    <div class="col-sm-8">   
                                                        <input id="lpassword" name="lpassword" type="password"  placeholder="Enter Password" class="form-control" required  /><br>

                                                        <input id="btpasswordlogin" type="button" value="Login Using Password" class="btn btn-success " style="margin-left: 195px;" onclick="passwordlogin()" />
                                                        <input id="btsendotp" type="button" value="Send OTP" class="btn btn-success " style="margin-left: 195px;" onclick="sendotp()" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="control-label col-sm-4" for="password">Enter OTP</label>
                                                    <div class="col-sm-8">
                                                        <input id="otp"  type="password" placeholder="Enter OTP Sent to Entered Mobile No" class="form-control" required /><br>

                                                        <input id="btverify" type="button" value="Verify OTP" class="btn btn-success " style="margin-left: 195px;" onclick="verify()" />
                                                    </div>
                                                </div>
                                                <div id="logindiv">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="name">Enter Name</label>
                                                        <div class="col-sm-8">
                                                            <input id="name" type="text"  placeholder="Enter Name" class="form-control" required  />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="email">Enter Email</label>
                                                        <div class="col-sm-8">
                                                            <input id="email" type="email"  placeholder="Enter Email" class="form-control" required  />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="password">Enter Password</label>
                                                        <div class="col-sm-8">
                                                            <input id="password" type="password"  placeholder="Enter Password" class="form-control" required  />
                                                        </div>
                                                    </div>

                                                    <input type="button" value="login" class="btn btn-success " style="margin-left: 195px;" onclick="login() ajax()" />
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
                <!--modal pop up ended--> 


                </div>
            </div>
            </div>
            <!--main container ended-->
    </body>
</html>
