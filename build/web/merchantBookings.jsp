<%-- 
    Document   : merchantBookings
    Created on : May 7, 2018, 4:01:39 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.rateyo.min.js" type="text/javascript"></script>
        <link href="css/jquery.rateyo.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script>
            var bookingid, serviceinfo;

            function show() {
//                document.getElementById("logindiv").style.display = 'none';
//                document.getElementById("otp").value = "";
//                document.getElementById("email").value = "";
//                document.getElementById("name").value = "";
//                document.getElementById("mobile").value = "";
//                document.getElementById("lpassword").value = "";
                $("#myModal").modal('show');
            }



            function fetch()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();

                        alert(res);
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];

                        var ans = "";
                        ans += "<table class='table table-hover'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <td>Booking_id</td> <td>Service_name</td> <td>Customer_Mobile</td><td>Address</td><td>Date</td><td>Time</td><td>CustomerName</td><td>Generate Bill</td></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["booking_id"] + "</td>";
                                  ans += "<td>" + js["service_name"] + "</td>";
                            ans += "<td>" + js["customermobile"] + "</td>";
                            ans += "<td>" + js["address"] + "</td>";
                            ans += "<td>" + js["servicedate"] + "</td>";
                            ans += "<td>" + js["time"] + "</td>";
                          //  ans += "<td>" + js["service_name"] + "</td>";
                            ans += "<td>" + js["name"] + "</td>";
                            // ans += "<td><input type='button' value='Service Complete' class='btn btn-success' onclick='generateotp()' /></td>";


                            var str = JSON.stringify(js);

                            if (js["status"] === "confirm")

                            {

                                ans += "<td><input type='button' value='Service Complete' class='btn btn-success' onclick='generateotp(" + js["booking_id"] + "," + str + ") ' /></td>";

                            } else if (js["status"] === "billed")
                            {
                                ans += "<td> bill generated</td>";
                            } else if (js["status"] === "paid")
                            {
                                //ans += "<td> bill paid</td>";
                                ans += "<td> <input type='button' class='btn btn-default' value='View Rating' onclick='viewRating(" + js["booking_id"] + ")'>  </td> "
                            }


                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./FetchMerchantBookingDetails", true);
                xml.send();



            }




            function  generateotp(booking_id, js)

            {

                serviceinfo = js;

                bookingid = booking_id;

                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function ()

                {

                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                    {

                        var res = xmlhttp.responseText.trim();



                        alert(res);

                        if (res === "success")

                        {

                            $("#myModal").modal('show');

                        }
                        else
                        {
                            alert("You cannot yet finish the serviceand cannot generate bill");
                        }

                    }

                };

                xmlhttp.open("GET", "./generateBookOtp?bookingid=" + booking_id + "&opr=sendotp", true);

                xmlhttp.send();

            }



            function verify()

            {

                var otp = document.getElementById("otp").value;

                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function ()

                {

                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                    {

                        var res = xmlhttp.responseText.trim();



                        if (res == "verified") {

                            alert("otp verified");

                            $("#myModal").modal("hide");

                            document.getElementById("servicename").innerHTML = serviceinfo["service_name"];
                            var servicetype = serviceinfo["servicetype"];
                            document.getElementById("servicetype").innerHTML = servicetype;

                            if (servicetype == "Price per Hour Service")
                            {
                                document.getElementById("priceperhour").style.display = "block";
                                document.getElementById("pph").innerHTML = serviceinfo["priceperhour"];
                            } else if (servicetype == "Fixed Price Service")
                            {
                                document.getElementById("fixedprice").style.display = "block";
                                document.getElementById("fp").innerHTML = serviceinfo["fixedprice"];
                            } else if (servicetype == "Dynamic Price Service")
                            {
                                document.getElementById("dynamicprice").style.display = "block";
                                document.getElementById("dp").innerHTML = serviceinfo["dynamicprice"];

                            }





                            $("#myModal1").modal("show");

                        } else {

                            alert("otp not match");

                        }





                    }

                };

                xmlhttp.open("GET", "./generateBookOtp?otp=" + otp + "&opr=verify" + "&bookingid=" + bookingid, true);

                xmlhttp.send();



            }



            function billpph() {



                var price = parseInt(document.getElementById("pph").innerHTML);

                var hours = parseInt(document.getElementById("tpph").value);

                alert(price + "---" + hours);

                var total = price * hours;

                document.getElementById("tp").innerHTML = total;



            }

            function billdp() {


                var price = parseInt(document.getElementById("dp").innerHTML);

                var variablePrice = parseInt(document.getElementById("tdp").value);
                alert(price + variablePrice);
                var total = price + variablePrice;

                document.getElementById("tp").innerHTML = total;

            }

            function billfp() {





                var price = parseInt(document.getElementById("fp").innerHTML);



                var service = parseInt(document.getElementById("tfp").value);



                var total = price * service;

                document.getElementById("tp").innerHTML = total;



            }
            function valuesubmit()
            {
                var value = document.getElementById("tp").innerHTML;
                alert(value);
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function ()

                {

                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                    {

                        var res = xmlhttp.responseText.trim();
                        if (res == "success")
                        {
                            $("#myModal1").modal("hide");

                            fetch();
                        }
                    }
                };
                xmlhttp.open("GET", "./generateBill?opr=" + value + "&bookingid=" + bookingid, true);
                xmlhttp.send();

            }

            function viewRating(bookingid)
            {

                $("#myModal2").modal("show");
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function ()

                {

                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                    {

                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        var js = jsa[0];
                        var rating = js["rating"];
                        var comment = js["comment"];
                        document.getElementById("comments").innerHTML = comment;
                         document.getElementById("rate").innerHTML = rating;
//                        $('#ratings').rateYo({
//                            rating: rating,
//                            readOnly: true
//                        });

                    }



                };

                xmlhttp.open("GET", "./ViewMerchantRating?bookingid=" + bookingid, true);

                xmlhttp.send();



            }




        </script>
    </head>
    <body onload="fetch()" style="margin-top: 80px">
  <jsp:include page="MerchantLogoutNavbar.jsp"/>
  <h1 style="margin-left: 400px"><b>Merchant Bookings</b></h1>
        <div id="d1">



        </div>


        <div id="myModal" class="modal fade" role="dialog">

            <div class="modal-dialog">



                <!-- Modal content-->

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <h4 class="modal-title">Confirm OTP</h4>

                    </div>

                    <div class="modal-body">



                        <form class="form-horizontal">



                            <div class="form-group">



                                <div class="form-group">

                                    <label class="control-label col-sm-4" for="mobile">Enter OTP</label>

                                    <div class="col-sm-6">

                                        <input id="otp"  type="password" placeholder="Enter OTP Sent to Entered customer Mobile No" class="form-control" required /><br>

                                    </div>

                                </div>

                                <input type="button" value="Submit" class="btn btn-success " style="" onclick="verify()" />



                            </div>

                        </form> 

                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>

                </div>



            </div>

        </div>




        <div id="myModal1" class="modal fade" role="dialog">

            <div class="modal-dialog">



                <!-- Modal content-->

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <h4 class="modal-title">Generate bill</h4>

                    </div>

                    <div class="modal-body">



                        <label  col-sm-4> Service Name:</label><label col-sm-8 id="servicename"></label>

                        <br> <label  col-sm-4> Service Type:</label><label col-sm-8 id="servicetype"></label>>

                        <div id="priceperhour" style="display:none">

                            <label> Price per hour</label>

                            <label id="pph" ></label>

                            <br> <label> No of hours</label>

                            <input type="text" class="form-control" id="tpph" onkeyup="billpph()"/>

                        </div>

                        <div id="fixedprice "  style="display:none">



                            <label>Fixed Price</label>

                            <label id="fp" ></label>

                            <label> No of services </label>

                            <input type="text" class="form-control" id="tfp" onkeyup="billfp()"/>

                        </div>

                        <div id="dynamicprice" style="display:none">

                            <label> Minimum  Price</label>

                            <label id="dp" ></label>

                            <label> Total Extra Charges</label>

                            <input type="text" class="form-control" placeholder="Extra Charges" id="tdp" onkeyup="billdp()"/>

                        </div>

                        <br>  <label>Total Price</label>

                        <label id="tp"></label>


                        <button type="button" onclick="valuesubmit()" class="btn btn-default">submit</button>



                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>

                </div>



            </div>

        </div>




        <div id="myModal2" class="modal fade" role="dialog">

            <div class="modal-dialog">



                <!-- Modal content-->

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <h4 class="modal-title">View My Ratings</h4>

                    </div>

                    <div class="modal-body">



                        <form class="form-horizontal">



                            <div class="form-group">



                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <label>RATINGS</label>
                                        <div id="rate"></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Comments</label>
                                        <label id="comments"></label>

                                        <!--<input id="otp"  type="password" placeholder="Enter OTP Sent to Entered customer Mobile No" class="form-control" required /><br>-->

                                    </div>

                                </div>

                                <!--<input type="button" value="Submit" class="btn btn-success " style="margin-left: 195px;" onclick="verify()" />-->



                            </div>

                        </form> 

                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>

                </div>



            </div>

        </div>




    </body>
</html>
