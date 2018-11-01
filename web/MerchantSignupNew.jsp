<!doctype html>
<html>
    <head>
        <title>Official Signup Form Flat Responsive widget Template :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style_4.css" rel='stylesheet' type='text/css' media="all" />
        <!-- /css -->

        <script>
            function go()
            {
                var password = document.getElementById("password1").value;
                var confirmpassword = document.getElementById("password2").value;
                if (password == "")
                {
                    alert("enter password");
                } else if (confirmpassword == "")
                {
                    alert("enter confirm password");
                } else if (confirmpassword != password)
                {
                    alert("password and confirmpassword do not match");
                } else
                {
                    var ans = "";
                    var formdata = new FormData();

                    var controls = document.getElementById("form1").elements;

                    alert("found " + controls.length + " controls in form");

                    var flag = 0;
                    for (var i = 0; i < controls.length; i++)
                    {
                        if (controls[i].name == "" || controls[i].name == null)
                        {
                            flag = 1;
                        }

                        if (controls[i].type == "file")
                        {
                            if (controls[i].files.length != 0)
                            {
                                ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                                formdata.append(controls[i].name, controls[i].files[0]);
                            } else
                            {
                                flag = 2;
                            }
                        } else    // for other input types  text,password,select
                        {
                            ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                            //formdata.append("rn",document.getElementById("rn").value);
                            //formdata.append(firstfile.name,firstfile);

                            formdata.append(controls[i].name, controls[i].value);
                        }
                        //                    alert(ans);
                        //                    alert(flag);
                    }

                    if (flag == 1)
                    {
                        alert("CHECK: --> Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("CHECK: --> Select Files for file controls");
                    } else
                    {
                        alert(ans);
                        alert(formdata);

                        var xhr = new XMLHttpRequest();

                        xhr.open("POST", "./MerchantSignupServlet", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                alert(xhr.responseText);
                                //fetch();
                                        if(xhr.responseText.trim()==="success")
                                        {
                                            window.location.href = "MerchantSignup2.jsp";
                                        }

                            }
                        };
                        xhr.send(formdata);
                    }
                }
            }
        </script>
    </head>
    <body>
        <h1 class="w3ls">Merchant Signup</h1>
        <div class="content-w3ls">
            <div class="content-agile1">
                <h2 class="agileits1">Official</h2>
                <p class="agileits2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="content-agile2">
                <form action="#" method="post" id="form1">
                    <div class="form-control w3layouts"> 
                        <input type="text" id="firstname" name="name" placeholder="Name" title="Please enter your First Name" required="">
                    </div>

                    <div class="form-control w3layouts">	
                        <input type="email" id="email" name="email" placeholder="E-mail" title="Please enter a valid email" required="">
                    </div>

                    <div class="form-control agileinfo">	
                        <input type="password" class="lock" name="password" placeholder="Password" id="password1" required="">
                    </div>	

                    <div class="form-control agileinfo">	
                        <input type="password" class="lock" name="confirmpassword" placeholder="Confirm Password" id="password2" required="">
                    </div>			

                </form>
                                    <input type="button" class="register" onclick="go()" value="Register">

                <script type="text/javascript">
                    window.onload = function () {
                        document.getElementById("password1").onchange = validatePassword;
                        document.getElementById("password2").onchange = validatePassword;
                    }
                    function validatePassword() {
                        var pass2 = document.getElementById("password2").value;
                        var pass1 = document.getElementById("password1").value;
                        if (pass1 != pass2)
                            document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                        else
                            document.getElementById("password2").setCustomValidity('');
                        //empty string means no validation error
                    }
                </script>
                <p class="wthree w3l">Already Registered? <a href="LoginHomeMerchant.jsp" style="color: white"><u>LogIn</u></a></p>

            </div>
            <div class="clear"></div>
        </div>
        <p class="copyright w3l">© 2017 Official Signup Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>
    </body>
</html>