<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <title></title>
        <!--meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Sweet Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <!--        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
                    function hideURLbar(){ window.scrollTo(0,1); } </script>-->
        <!--//meta tags ends here-->
        <link href="css/jquery.rateyo.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.rateyo.min.js" type="text/javascript"></script>
    <a href="js/jquery.rateyo.min.js.map"></a>
    <a href="css/jquery.rateyo.min.css.map"></a>

        <script>
            function submitquery()
            {
                var name, lastname, email, phone, message;
                name = document.getElementById("queryname").value;
                lastname = document.getElementById("querylastname").value;
                email = document.getElementById("queryemail").value;
                phone = document.getElementById("queryphone").value;
                message = document.getElementById("querymessage").value;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status === 200)
                    {
                        var res = xhr.responseText.trim();
                        if (res === "success")
                        {
                            document.getElementById("queryname").value = "";
                            document.getElementById("querylastname").value = "";
                            document.getElementById("queryemail").value = "";
                            document.getElementById("queryphone").value = "";
                            document.getElementById("querymessage").value = "";
                            alert("Query submitted, We will reach out to you shortly");
                        }
                    }
                };
                xhr.open("GET", "./submitquery?name=" + name + "&lastname=" + lastname + "&email=" + email + "&phone=" + phone + "&message=" + message, true);
                xhr.send();
            }

            function fetch()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();


                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];

                        var ans = "";



                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
//                            ans += "<li><a href=\"#\" onclick=\"showsubcategories(" + js["category_id"] + ")\"  >" + js["category_name"] + "</a></li>";

                            ans += "<div onclick=\"showsubcategories(" + js["category_id"] + ",'" + js["category_name"] + "')\" class=\"col-sm-4 col-xs-4 agile_gallery_grid\">";
                            if (i >= 3)
                            {
                                ans += "<div class=\"w3ls_gallery_grid-low\">";
                            } else
                            {
                                ans += "<div class=\"w3ls_gallery_grid-top\">";
                            }
                            ans += "<a  class=\"lsb-preview wthree_p_grid\" data-lsb-group=\"header\">";
                            ans += "<img src=\"" + js["icon"] + "\" alt=\" \" class=\"img-responsive\" />";
                            ans += "<div class=\"agileinfo_content_wrap\">";
                            ans += "<div class=\"agileits_content\">";
                            ans += "<h3>" + js["category_name"] + "</h3>";
                            ans += "<p>" + js["description"] + "</p>";
                            ans += "</div>";
                            ans += "</div>";
                            ans += "</a>";
                            ans += "</div>";
                            ans += "<div class=\"clearfix\"> </div>";
                            ans += "</div>";

                        }

//alert(ans);
                        document.getElementById("divcat").innerHTML = ans;

                    }
                };
                xml.open("GET", "./AddCategoryServlet", true);
                xml.send();
            }


            function showsubcategories(id, name)
            {
                window.location.href = "showsubcategories.jsp?id=" + id + "&name=" + name;
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
                            if (res === "failed") {
                                alert("invalid mobile/password");

                            } else {
                                $("#myModal").modal("hide");
                                sessionStorage.setItem("mobile", mobile);

                                var ans = "";
                                ans += "  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">" + res + "<span class=\"caret\"></span></a>";
                                ans += "  <ul class=\"dropdown-menu\">";
                                ans += "<li><a href=\"./CustomerLogout\"  >Logout<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>";
                                ans += "    <li><a href=\"CustomerChangePassword.jsp\" >Change Password<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                ans += " <li><a href=\"customerBookingsHistory.jsp\" >My Bookings<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                ans += "</ul>";
                                document.getElementById("logincheck").innerHTML = ans;
                            }
                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?mobile=" + mobile + "&password=" + password + "&opr=loginusingpassword", true);
                    xmlhttp.send();

                }
            }

            function sendotp()
            {
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
                    var xmlhttp = new XMLHttpResystequest();
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
                            document.getElementById("otpdiv").style.display = "block";
                            document.getElementById("btmerchants").style.display = "none";
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

                            if (res == "failed") {

                                alert("otp not match");

                            } else {

                                alert("otp verified");
                                if (alreadyexit == "false") {
                                    document.getElementById("logindiv").style.display = 'block';
                                    document.getElementById("mobile").disabled = "false";
                                    document.getElementById("otp").disabled = "false";
                                    document.getElementById("btverify").disabled = "false";
                                } else if (alreadyexit == "true") {
                                    customermobile = mobile;
                                    $("#myModal").modal('hide');
                                    sessionStorage.setItem("mobile", mobile);

                                    var ans = "";
                                    ans += "  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">" + res + "<span class=\"caret\"></span></a>";
                                    ans += "  <ul class=\"dropdown-menu\">";
                                    ans += "<li><a href=\"./CustomerLogout\"  >Logout<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>";
                                    ans += "    <li><a href=\"CustomerChangePassword.jsp\" >Change Password<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                    ans += " <li><a href=\"customerBookingsHistory.jsp\" >My Bookings<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                    ans += "</ul>";
                                    document.getElementById("logincheck").innerHTML = ans;
                                }
                            }
                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?otp=" + otp + "&opr=verify&alreadyexist=" + alreadyexit + "&mobile=" + mobile, true);
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

                                sessionStorage.setItem("mobile", mobile);

                                var ans = "";
                                ans += "  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">" + res + "<span class=\"caret\"></span></a>";
                                ans += "  <ul class=\"dropdown-menu\">";
                                ans += "<li><a href=\"./CustomerLogout\"  >Logout<span class=\"glyphicon glyphicon-briefcase\"></span></a></li>";
                                ans += "    <li><a href=\"CustomerChangePassword.jsp\" >Change Password<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                ans += " <li><a href=\"customerBookingsHistory.jsp\" >My Bookings<span class=\"glyphicon glyphicon-user\"></span></a></li>";
                                ans += "</ul>";
                                document.getElementById("logincheck").innerHTML = ans;
                            } else {
                                alert("email already registered");
                            }
                        }
                    };
                    xmlhttp.open("GET", "./sendcustomerotp?email=" + email + "&name=" + name + "&mobile=" + mobile + "&password=" + password + "&opr=signup", true);
                    xmlhttp.send();
                }
            }
        </script>
    </head>
    <body onload="fetch()">
        <jsp:include page="customernavbar.jsp"></jsp:include>


            <!--Slider-->
            <div class="slider">
                <div class="callbacks_container w3l">
                    <ul class="rslides" id="slider">
                        <li>
                            <div class="slider-img w3-oneimg">
                            </div>
                            <div class="slider-info">
                                <h4>Register Now</h4>
                                <p>One Step Solution to all Home Services</p>

                            </div>
                        </li>
                        <li>
                            <div class="slider-img w3-twoimg">
                            </div>
                            <div class="slider-info">
                                <h4>Book Now , Pay Later</h4>
                                <p>Pay Only after the Service. No Hidden charges </p>
                            </div>
                        </li>
                        <li>
                            <div class="slider-img w3-threeimg">
                            </div>
                            <div class="slider-info">
                                <h4>Hire Experts</h4>
                                <p>Get to know more about our services at just a click</p>
                            </div>
                        </li>
                        <li>
                            <div class="slider-img w3-fourimg">
                            </div>
                            <div class="slider-info">
                                <h4>Call Now</h4>
                                <p>24/7 Availability . We belive in Customer Satisfaction</p>
                            </div>
                        </li>

                    </ul>

                </div>
                <div class="clearfix"></div>
            </div>
            <!--//Slider-->
            <div class="about w3 " id="about">
                <div class="container">
                    <h3 class="title-w3-agile">About</h3>
                    <div class="col-sm-4 ser-grid">

                        <div class="ser-top-w3layouts">
                            <div class="con hvr-shutter-in-horizontal">
                                <span class="fa fa-home" aria-hidden="true"></span>
                            </div>

                            <p>Your Home</p>
                        </div>
                    </div>
                    <div class="col-sm-4 ser-grid two">
                        <div class="ser-top-w3layouts">
                            <div class="con hvr-shutter-in-horizontal">
                                <span class="fa fa-key" aria-hidden="true"></span>
                            </div>

                            <p>Our Services</p>
                        </div>
                    </div>

                    <div class="col-sm-4 ser-grid">
                        <div class="ser-top-w3layouts">
                            <div class="con hvr-shutter-in-horizontal">
                                <span class="fa fa-money" aria-hidden="true"></span>
                            </div>

                            <p>Your Benefit</p>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="about-top-grid ">
                        <h4>About us
                        </h4>
                        <p>
                            EasyHelp is a new company founded in 2018, operating currently in the city of Amritsar.
                            We aim to provide quality services to our customers and at the same time aim to move ahead in leaps and bounds .
                            EasyHelp truly has a unique selling proposition to delight our customers . We extend our service promise through our partners and merchants .
                            We Shivam and Rishab, the two founding partners , have and will always stand firm for our moto "Always at your Service".


                        </p>
                    </div>
                </div>
            </div>
            <!-- Stats -->
            <div class="stats-agileits" id="stats">
                <div class="container">
                    <h3 class="title-w3-agile">Stats</h3>
                <%
                    int clientcount = 0, merchantcount = 0, servoffer = 0, servcomp = 0;

                    ResultSet rs = DBLoader.executeQuery("select count(name) as clients from customers");
                    if (rs.next()) {
                        clientcount = rs.getInt("clients");
                    }

                    rs = DBLoader.executeQuery("select count(email) as merchants from merchant_info");
                    if (rs.next()) {
                        merchantcount = rs.getInt("merchants");
                    }

                    rs = DBLoader.executeQuery("select count(service_id) as serv from services");
                    if (rs.next()) {
                        servoffer = rs.getInt("serv");
                    }

                    rs = DBLoader.executeQuery("select count(booking_id) as book from booking where status='billed' or status='paid'");
                    if (rs.next()) {
                        servcomp = rs.getInt("book");
                    }
                %>
                <div class="stats-info agileits w3layouts">
                    <div class="col-md-3 col-sm-6 col-xs-6 agileits w3layouts stats-grid stats-grid-1">
                        <div class=" agileits-w3layouts counter" id="clientcount"><%=clientcount%></div>
                        <div class="stat-info-w3ls">
                            <h4 class="agileits w3layouts">clients</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 agileits w3layouts stats-grid stats-grid-2">

                        <div class=" agileits-w3layouts counter" id="servoffer"><%=servoffer%></div>
                        <div class="stat-info-w3ls">
                            <h4 class="agileits w3layouts ">Services Offered</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 stats-grid agileits w3layouts stats-grid-3">

                        <div class=" agileits-w3layouts counter" id="servcomp"><%=servcomp%></div>
                        <div class="stat-info-w3ls">
                            <h4 class="agileits w3layouts ">Services Completed</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 stats-grid agileits w3layouts stats-grid-4">

                        <div class=" agileits-w3layouts counter" id="merchantcount"><%=merchantcount%></div>
                        <div class="stat-info-w3ls">
                            <h4 class="agileits w3layouts">Merchants</h4>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <!-- //Stats -->
        <!--news-->
        <div class="event-more" id="features">
            <div class="container">
                <h3 class="title-w3-agile">Features</h3>
                <div class="w3_agile_grids">
                    <div class="col-md-4 col-sm-4 services-left">
                        <div class="w3_agileits_events_grid" data-aos="zoom-in">
                            <div class="wthree_events_grid">
                                <div class="wthree_events_grid1">
                                    <img src="images/NeWcUSTOMER.jpg" alt=" " class="img-responsive">
                                </div>
                                <div class="agileinfo_events_grid1">
                                    <h5><a href="#" >24/7 Services</a></h5>
                                    <p class="para-agileits-w3layouts">Get 24/7 Customer Support Service for all your services and queries. </p>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-4 col-sm-4 services-left middle">
                        <div class="w3_agileits_events_grid" data-aos="zoom-in">
                            <div class="wthree_events_grid">
                                <div class="wthree_events_grid1">
                                    <img src="images/affordablePricesNew.jpg" alt=" " class="img-responsive">
                                </div>
                                <div class="agileinfo_events_grid1">
                                    <h5><a href="#" >Affordable Price</a></h5>
                                    <p class="para-agileits-w3layouts">Pay Minimum and Avail Maximum with us . Min Price Guaranteed.</p>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-4 col-sm-4 services-left">
                        <div class="w3_agileits_events_grid" data-aos="zoom-in">
                            <div class="wthree_events_grid">
                                <div class="wthree_events_grid1">
                                    <img src="images/Newpersonalized services.jpg" alt=" " class="img-responsive">
                                </div>
                                <div class="agileinfo_events_grid1">
                                    <h5><a href="#" >Personalized service</a></h5>
                                    <p class="para-agileits-w3layouts">We care for you and We give Personalised Services.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>


        <!--//news-->

        <!-- gallery -->
        <div id="categories" class="gallery">

            <div class="container">
                <h3 class="title-w3-agile" >Categories</h3>		
                <div class="agile_gallery_grids" id="divcat">	

                </div> 
            </div>
        </div>
        <!-- //gallery --> 

        <!-- team -->
        <!--        <div class="team" id="merchants">
        
                    <div class="container">
                        <h3 class="title-w3-agile">Our Merchants</h3>
                        <div class="agileits-team-grids">
                            <div class="col-md-3  col-sm-6 col-xs-6 agileits-team-grid top">
                                <div class="team-info">
                                    <img src="images/t1.jpg" alt="">
                                    <div class="team-caption"> 
                                        <h4>katrina wally</h4>
                                        <p>Lorem Ipsum</p>
                                                                        <ul>
                                                                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-rss"></span></a></li>
                                                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6  col-xs-6 agileits-team-grid top">
                                <div class="team-info">
                                    <img src="images/t4.jpg" alt="">
                                    <div class="team-caption"> 
                                        <h4>john max</h4>
                                        <p>Lorem Ipsum</p>
                                                                        <ul>
                                                                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-rss"></span></a></li>
                                                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6  col-xs-6 agileits-team-grid team-mid">
                                <div class="team-info">
                                    <img src="images/t2.jpg" alt="">
                                    <div class="team-caption"> 
                                        <h4>roy kent</h4>
                                        <p>Lorem Ipsum</p>
                                                                        <ul>
                                                                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-rss"></span></a></li>
                                                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3  col-sm-6 col-xs-6 agileits-team-grid">
                                <div class="team-info">
                                    <img src="images/t3.jpg" alt="">
                                    <div class="team-caption"> 
                                        <h4>joy Idson</h4>
                                        <p>Lorem Ipsum</p>
                                                                        <ul>
                                                                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                                                            <li><a href="#"><span class="fa fa-rss"></span></a></li>
                                                                        </ul>
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>-->
        <!-- //team-->
        <!--contact -->
        <div class="contact" id="contact">
            <div class="container">	
                <h3 class="title-w3-agile">Contact Us</h3>		
                <div class="contact-form">
                    <form action="#" method="post">
                        <div class="col-md-6 col-sm-6 col-xs-6 left-way-w3">
                            <div class=" form-left" >
                                <input type="text" Name="name" id="queryname" placeholder="Name" required="">
                            </div>
                            <div class=" form-left" >
                                <input type="text" Name="last name" id="querylastname" placeholder="Last Name" required="">
                                <div class="clearfix"> </div>
                            </div>
                            <div class=" form-right ">
                                <input class="email" type="email" id="queryemail" Name="email" placeholder="Email" required="">
                            </div>
                            <div class="form-right phone" >
                                <input  type="text" Name="phone" id="queryphone" placeholder="Phone" required="">
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-6 right-way-w3">
                            <textarea placeholder="Message" required="" id="querymessage"></textarea>
                            <input type="button" value="Submit" onclick="submitquery()">
                        </div>
                        <div class="clearfix"> </div>
                    </form>
                </div>
            </div>
        </div>		
        <!--//contact -->
        <!--footer-->
        <div class="footer">
            <div class="container">
                <!-- Copyright -->
                <div class="col-md-7 copyright">
                    <p>© 2017 EasyHelp Official. All Rights Reserved | Design by Rishab Madaan</p>

                </div>
                <!-- //Copyright -->
                <div class="col-md-5 bottom-head">
                    <div class="icons-buttn">
                        <ul>
                            <li><a href="https://www.facebook.com/"><span class="fa fa-facebook"></span></a></li>
                            <li><a href="https://twitter.com/"><span class="fa fa-twitter"></span></a></li>
                            <li><a href="https://plus.google.com/"><span class="fa fa-google-plus"></span></a></li>
                            <!--<li><a href="#"><span class="fa fa-vk"></span></a></li>-->
                        </ul>
                    </div>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>	
        <!--//footer-->	

        <!--Login Modal-->
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

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4" for="password">Enter Password </label>
                                <div class="col-sm-8">   
                                    <input id="lpassword" name="lpassword" type="password"  placeholder="Enter Password" class="form-control" required  />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <center>
                                        <input id="btpasswordlogin" type="button" value="Login Using Password" class="btn btn-success " onclick="passwordlogin()" />
                                    </center>
                                </div>

                                <div class="col-sm-6">
                                    <center>
                                        <input id="btsendotp" type="button" value="Send OTP" class="btn btn-success " onclick="sendotp()" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <center>
                                    <a href="LoginHomeMerchant.jsp"><input id="btmerchants" type="button" style="margin-top:15px" value="Go TO Merchant Login" class="btn btn-success " /> </a>  
                                </center>

                            </div>
                            <div class="form-group" id="otpdiv" style="display: none;margin-top: 10px">
                                <label class="control-label col-sm-4" for="password">Enter OTP</label>
                                <div class="col-sm-8">
                                    <input id="otp"  type="password" placeholder="Enter OTP Sent to Entered Mobile No" class="form-control" required /><br>
                                </div>
                                <input id="btverify" type="button" value="Verify OTP" class="btn btn-success " onclick="verify()" />
                            </div>


                            <div id="logindiv" style="display: none">
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

                                <input type="button" value="login" class="btn btn-success " onclick="login()" />
                            </div>

                        </form> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!--menu script-->


        <!--//menu script-->
        <!-- banner-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
                                    $(function () {
                                        $("#slider").responsiveSlides({
                                            auto: true,
                                            pager: true,
                                            nav: true,
                                            speed: 1000,
                                            namespace: "callbacks",
                                            before: function () {
                                                $('.events').append("<li>before event fired.</li>");
                                            },
                                            after: function () {
                                                $('.events').append("<li>after event fired.</li>");
                                            }
                                        });
                                    });
        </script>
        <!-- OnScroll-Number-Increase-JavaScript -->
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.countup.js"></script>
        <script>
                                    $('.counter').countUp();
        </script>
        <!-- //OnScroll-Number-Increase-JavaScript -->
        <!--pop-up-box video-->
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <script>
                                    $(document).ready(function () {
                                        $('.popup-with-zoom-anim').magnificPopup({
                                            type: 'inline',
                                            fixedContentPos: false,
                                            fixedBgPos: true,
                                            overflowY: 'auto',
                                            closeBtnInside: true,
                                            preloader: false,
                                            midClick: true,
                                            removalDelay: 300,
                                            mainClass: 'my-mfp-zoom-in'
                                        });

                                    });
        </script>
        <!-- //pop-up-box video -->
        <!-- gallery-lightbox -->  
        <script src="js/lsb.min.js"></script>
        <!--        <script>
                                        $(window).load(function () {
                                            $.fn.lightspeedBox();
                                        });
                </script> -->
        <!-- //gallery-lightbox -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top_1.js"></script>
        <script type="text/javascript" src="js/easing_1.js"></script>
        <script type="text/javascript">
                                    jQuery(document).ready(function ($) {
                                        $(".scroll").click(function (event) {
                                            event.preventDefault();
                                            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                        });
                                    });
        </script>
        <!-- start-smoth-scrolling -->

        <!-- for-bottom-to-top smooth scrolling -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */
                $().UItoTop({easingType: 'easeOutQuart'});
            }
            );
        </script>
        <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        <!-- //for-bottom-to-top smooth scrolling -->
    </body>
</html>