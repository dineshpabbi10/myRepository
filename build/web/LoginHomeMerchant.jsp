<!--A Design by W3layouts
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

    <head>
        <title></title>
        <!-- Meta Tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Groovy Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
              />
        <script type="application/x-javascript">
            addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
            window.scrollTo(0, 1);
            }
        </script>
        <!-- //Meta Tags -->
        <!-- Font-Awesome-CSS -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--// Font-Awesome-CSS -->
        <!-- Required Css -->
        <link href="css/style_2.css" rel='stylesheet' type='text/css' />
        <!--// Required Css -->
        <!--fonts-->
        <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
        <!--//fonts-->


        <script>
//            function login() {
//                $("#myModal").modal('show');
//            }


            function ajax()
            {


                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                if (email === "" || password === "")
                {
                    alert("Must fill all fields");
                } else if (email.indexOf("@") <= 0 || email.lastIndexOf(".") < email.indexOf("@"))
                {
                    alert("enter proper email");
                } else
                {
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
                            } else if (res === "signup")
                            {
                                window.location.href = "MerchantSignup2.jsp";
                            } else if (xmlhttp.responseText.trim() == "failed")
                            {
                                alert("login unsuccessfull");
                            } else if (xmlhttp.responseText.trim() == "Pending")
                            {
                                alert("Your Profile is Under Process");
                            } else if (xmlhttp.responseText.trim() == "block")
                            {
                                alert("Your Profile is Blocked");
                            }

                        }
                        ;
                    }
                    xmlhttp.open("GET", "./merchantLogin?email=" + email + "&password=" + password, true);
                    xmlhttp.send();
                }
            }
        </script>

    </head>

    <body>
        <!--background-->
        <h1>Merchant Login</h1>
        <!-- Main-Content -->
        <div class="main-w3layouts-form">
            <h2>Login to your account</h2>
            <!-- main-w3layouts-form -->
            <form action="#" method="post">
                <div class="fields-w3-agileits">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <input type="text" name="Username" id="email" required="" placeholder="Email" />
                </div>
                <div class="fields-w3-agileits">
                    <span class="fa fa-key" aria-hidden="true"></span>
                    <input type="password" id="password" name="Password" required="" placeholder="Password" />
                </div>
                <div class="remember-section-wthree">
                    <ul>

                        <li> <a href="forgotmerchantpassword.jsp">Forgot password?</a> </li>
                    </ul>
                    <div class="clear"> </div>
                </div>
                <input type="button" onclick="ajax()" value="Login" />
            </form>
            <!--// main-w3layouts-form -->
            <!-- Social icons -->
            <!--		<div class="footer_grid-w3ls">
                                    <h5 class="sub-hdg-w3l">or login with your social profile</h5>
                                    <ul class="social-icons-agileits-w3layouts">
                                            <li><a href="#" class="fa fa-facebook"></a></li>
                                            <li><a href="#" class="fa fa-twitter"></a></li>
                                            <li><a href="#" class="fa fa-google-plus"></a></li>
                                    </ul>
                            </div>-->
            <!--// Social icons -->
        </div>
        <!--// Main-Content-->
        <!-- copyright -->
        <div class="copyright-w3-agile">
            <p>Easy Help: All Copyrights Reserved. Created by :Rishab Madaan and Shivam Aggarwal			</p>
        </div>
        <!--// copyright -->
        <!--//background-->
    </body>

</html>