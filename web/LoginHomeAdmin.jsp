
<!DOCTYPE HTML>
<html>
    <head>
        <title>Admin Login</title>
        <!-- Meta tag Keywords -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Personal Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Meta tag Keywords -->

        <!-- css files -->
        <link rel="stylesheet" href="css/style_3.css" type="text/css" media="all" /> <!-- Style-CSS --> 
        <link rel="stylesheet" href="css/font-awesome_1.css"> <!-- Font-Awesome-Icons-CSS -->
        <!-- //css files -->

        <!-- online-fonts -->
        <link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext" rel="stylesheet">
        <!-- //online-fonts -->


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
                } else {

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
                    xmlhttp.open("GET", "./adminLogin?email=" + email + "&password=" + password, true);
                    xmlhttp.send();
                }
            }
        </script>



    </head>
    <body>
        <!--header-->
        <div class="header-w3l">
            <h1>Admin Login</h1>
        </div>
        <!--//header-->

        <!--main-->
        <div class="main-content-agile">
            <div class="sub-main-w3">	
                <div class="wthree-pro">
                    <img src="images/admin2.png" alt="image">
                    <h2>Login Now</h2>
                </div>
                <form action="#" method="post">
                    <input id="email" placeholder="E-mail" name="Name" class="user" type="text" required="">
                    <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br><br>
                    <input   id="password" placeholder="Password" name="Password" class="pass" type="password" required="">
                    <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><br>

                    <div class="sub-w3l">
                        <span>  <a style="color:white" href="forgotpassword.jsp">Forgot Password</a></span>
                        <div class="right-w3l" >
                            <input type="button" value="Login"onclick="ajax()">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--//main-->

        <!--footer-->
        <div class="footer">
            <p>&copy; 2018 EasyHelp All rights reserved | Design by Rishab and Shivam</p>
        </div>
        <!--//footer-->

    </body>
</html>