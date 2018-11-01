
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>

        <script>


            var alreadyexit, jsaservices, selectedserviceid, customermobile, address, servicedate, servicetime;

            <%
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                if (session.getAttribute("usermobile") != null) {
            %>
            customermobile = "<%=session.getAttribute("usermobile")%>";
            sessionStorage.setItem("mobile", "<%=session.getAttribute("mobile")%>");
            <%
                }
            %>




            function getSubCategories(cid)
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
                            var subcategory_id = js["subcategory_id"];
                            var subcategory_name = js["subcategory_name"];
                            var icon = js["icon"];
                            ans += "<div onclick=\"showservices(" + js["subcategory_id"] + ")\" class=\"col-sm-4 col-xs-4 agile_gallery_grid\">";
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
                            ans += "<h3>" + js["subcategory_name"] + "</h3>";
                            ans += "<p>" + js["description"] + "</p>";
                            ans += "</div>";
                            ans += "</div>";
                            ans += "</a>";
                            ans += "</div>";
                            ans += "<div class=\"clearfix\"> </div>";
                            ans += "</div>";
                        }
                        document.getElementById("subcatdiv").innerHTML = ans;
                    }
                };
                xml.open("GET", "./getSubCategories?category_id=" + cid, true);
                xml.send();
            }

            function showservices(sid)
            {
                var ans = "";
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();

                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        jsaservices = jsa;
                        ans += "<div class=\"row \">";
                        ans += "<div class=\"col-sm-12 \">";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            var serviceid = js["service_id"];
                            var sername = js["service_name"];

                            ans += "<a href=\"#\"   onclick=\"showservicesdetailmodal(" + i + ")\" style='margin-top:20px'>";
                            ans += "<h3>" + sername + "</h3>";
                            ans += "</a>";


                        }
                        ans += "</div>";
                        ans += "</div>";
                        document.getElementById("servicesdiv").innerHTML = ans;
                        $("#mymodalservices").modal('show');

                    }
                };

                xml.open("GET", "./getServices?subcategory_id=" + sid, false);
                xml.send();
            }
            function showservicesdetailmodal(index) {

                var ans = "";
                $("#mymodalservices").modal('hide');
                var js = jsaservices[index];
                selectedserviceid = js["service_id"];
                var sername = js["service_name"];
                var sertype = js["servicetype"];
                var priceperhour = js["priceperhour"];
                var dynamicprice = js["dynamicprice"];
                var fixedprice = js["fixedprice"];
                var serdesc = js["servicedescription"];


                ans += "<center><label>" + sername + "</label></center><br>";

                ans += "<center><img src='" + js["icon"] + "' style='width:200px;height:200px'></center>";

                ans += "  <center><p> " + serdesc + "</p></center>";

//                ans += "<div class='col-sm-offset-1 col-sm-4'>" + sertype + "</div>";
//
//                ans += "<div class='col-sm-offset-2 col-sm-5'>";
//
//                if (sertype === "Price per Hour Service")
//                {
//                    ans += "Price Per Hour  :" + priceperhour;
//                } else if (sertype === "Dynamic Price Service")
//                {
//                    ans += "Dynamic Price : " + dynamicprice;
//                } else
//                {
//                    ans += "Fixed Price :" + fixedprice;
//                }
//
//                ans += "</div>";

                ans += "<center><label>" + sertype + "</label></center>";

                ans += "<center><label>";

                if (sertype === "Price per Hour Service")
                {
                    ans += "Price Per Hour  :" + priceperhour;
                } else if (sertype === "Dynamic Price Service")
                {
                    ans += "Dynamic Price : " + dynamicprice;
                } else
                {
                    ans += "Fixed Price :" + fixedprice;
                }

                ans += "</label></center>";

                ans += "<input type=\"button\"  value=\"Book Service\" class=\"btn btn-default\"  onclick=\"checkLogin()\" />";
                document.getElementById("servicedetaildiv").innerHTML = ans;
                $("#mymodalservicesdetail").modal('show');
            }

            function checkLogin()
            {
                var customermobile = sessionStorage.getItem("mobile")
                if (customermobile !== null && customermobile !== "")
                {
                    $("#mymodaladdress").modal("show");
                    $("#mymodalservicesdetail").modal('hide');
                } else
                {
                    $("#mymodalservicesdetail").modal('hide');
                    $("#myModal").modal('show');
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
                            if (res === "failed") {
                                alert("invalid mobile/password");


                            } else {
                                customermobile = mobile;
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
                                $("#mymodaladdress").modal("show");
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
                                    $("#mymodaladdress").modal("show");
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
                                customermobile = mobile;
                                document.getElementById("otp").value = "";
                                document.getElementById("email").value = "";
                                document.getElementById("name").value = "";
                                document.getElementById("mobile").value = "";
                                document.getElementById("password").value = "";
                                document.getElementById("mobile").enabled = "true";
                                document.getElementById("otp").enabled = "true";
                                document.getElementById("btverify").enabled = "true";
                                $("#myModal").modal('hide');
                                $("#mymodaladdress").modal("show");
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



            function getaddress() {
                address = document.getElementById("caddress").value;
                if (address === "" || address === null)
                {
                    alert("Must give some address");
                }
                $("#mymodaladdress").modal("hide");

                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                if (dd < 10)
                {
                    dd = '0' + dd
                }
                if (mm < 10)
                {
                    mm = '0' + mm
                }
                today = yyyy + '-' + mm + '-' + dd;
                document.getElementById("datepicker1").min = today;
                $("#mymodaldatetime").modal("show");
            }




            function datetimefunction() {
                servicedate = document.getElementById("datepicker1").value;
                servicetime = document.getElementById("timepicker1").value;
                if (servicedate === "" || servicedate === null)
                {
                    alert("must choose a date and time");

                } else if (servicetime === "" || servicetime === null)
                {
                    alert("must choose some time");
                } else
                {
                    $("#mymodaldatetime").modal("hide");
                    var ans = "";


                    ans += "<label class='col-sm-offset-1 col-sm-6 control-label' > Service Id:  </label>";
                    ans += "<label class='col-sm-3'>" + selectedserviceid + "</label>"

                    ans += "<label class='col-sm-offset-1 col-sm-6 control-label'> Mobile Number Of Customer</label>";
                    ans += "<label class='col-sm-3'>" + customermobile + "</label>"

                    ans += "  <label class='col-sm-offset-1 col-sm-6 control-label'>Customer Address:  </label>";
                    ans += "<label class='col-sm-3'>" + address + "</label>"

                    ans += "<label class='col-sm-offset-1 col-sm-6 control-label'> Date  :</label>";
                    ans += "<label class='col-sm-3'>" + servicedate + "</label>"

                    ans += "<label class='col-sm-offset-1 col-sm-6 control-label'> Time:</label>";
                    ans += "<label class='col-sm-3'>" + servicetime + "</label>"


                    ans += "<input type=\"button\"  value=\"Book Service\" class=\"btn btn-default\"  onclick=\"bookfinalservice()\" />";
                    document.getElementById("bookingdetaildiv").innerHTML = ans;
                    $("#mymodalbookingdetails").modal("show");
                }

            }
            function bookfinalservice() {

                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function ()
                {
                    if (xhr.status == 200 && xhr.readyState == 4)
                    {

                        $("#mymodalbookingdetails").modal("hide");
                        var res = xhr.responseText.trim();
                        alert(res);
                        if (res === "fail")
                        {
                            alert("you already have booked this service");
                        } else if (res == "no merchant")
                        {
                            alert("we do not have available merchant for this service right now,if u are preety give us your number");
                        } else
                        {
                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];
                            var detail = jsa[0];
                            var ans = "";
                            ans += "<label>Merchant Alloted:</label>";
                            ans += "<br>";
                            ans += detail["name"];
                            ans += "<br>";
                            ans += "<label>Merchant mobileno:</label>";
                            ans += "<br>";
                            ans += detail["phoneno"];
                            ans += "<br>";
                            ans += "<label>Merchant Email:</label>";
                            ans += "<br>";
                            ans += detail["email"];
                            ans += "<br>";
                            ans += "<label>Merchant Photo:</label>";
                            ans += "<br>";
                            ans += "<img src='" + detail["photo"] + "'style='width:100px;height:100px'/>";
                            document.getElementById("details").innerHTML = ans;
                            $("#mymodalfinaldetails").modal("show");

                        }

                    }
                };
                xhr.open("GET", "./bookservice?serviceid=" + selectedserviceid + "&customermobileno=" + customermobile + "&address=" + address + "&servicedate=" + servicedate + "&time=" + servicetime, true);
                xhr.send();
            }
        </script>
    </head>
    <body onload="getSubCategories(<%=id%>)">
        <jsp:include page="customernavbar.jsp"></jsp:include>
            <div id="gallery" class="gallery" style="margin-top: 20px">

                <div class="container">
                    <h3 class="title-w3-agile" >Sub Categories for <%=name%></h3>		
                <div class="agile_gallery_grids" id="subcatdiv">	

                </div> 
            </div>
        </div>

        <!-- Modal show Services-->
        <div id="mymodalservices" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: #cc3300">Choose a Service</h4>
                    </div>
                    <div class="modal-body">
                        <div id="servicesdiv">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!--services detail model-->
        <div id="mymodalservicesdetail" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: #cc3300">Service Detail</h4>
                    </div>
                    <div class="modal-body">
                        <div id="servicedetaildiv">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

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
                                    <a href="MerchantLogin.jsp"><input id="btmerchants" type="button" style="margin-top:15px" value="Go TO Merchant Login" class="btn btn-success " /> </a>  
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



        <!--get Adress Modal-->
        <div id="mymodaladdress" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Enter Address</h4>
                    </div>
                    <div class="modal-body">


                        <form class="form-horizontal">

                            <div class="form-group">
                                <label>Enter Address</label>
                                <textarea cols="4" rows="4" placeholder="enter address" id="caddress" class="form-control"></textarea>


                            </div>
                            <input type="button" value="Next" class="btn btn-success "  onclick="getaddress()" />
                        </form> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>


        <!--Date Time Modal-->
        <div id="mymodaldatetime" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Enter Date Time</h4>
                    </div>
                    <div class="modal-body">


                        <form class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-offset-2 col-sm-3">Select Date</label>
                                <div class="col-sm-3">  <input type="date" id="datepicker1"class="form-control" style="width: 200px;height: 50px;"></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-offset-2 col-sm-3">Select Time</label>
                                <div class="col-sm-3"> <input  class="form-control"type="time" id="timepicker1" style="width: 200px;height: 50px"></div>

                            </div>
                            <input type="button" value="Next" class="btn btn-success " onclick="datetimefunction()" />
                        </form> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!--bookimg detalis modal-->
        <div id="mymodalbookingdetails" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Booking Details</h4>
                    </div>
                    <div class="modal-body">
                        <div id="bookingdetaildiv">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>


        <!--Booking confirmation model-->

        <div id="mymodalfinaldetails" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2>Booking Confirmed</h2>
                    </div>
                    <div class="modal-body">
                        <div id="details">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>



    </body>
</html>
