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
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script src="js/jquery.rateyo.min.js" type="text/javascript"></script>
        <link href="css/jquery.rateyo.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script>

            var globalbookingid;
            var rating="";
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
                        ans += "<tr> <td>ServiceDate</td> <td>Service_name</td> <td>Merchant_Name</td><td>MerchantMobile</td><td>Booking_Date</td><td>Time</td><td>total price</td><td></td><td></td></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["servicedate"] + "</td>";
                            ans += "<td>" + js["service_name"] + "</td>";
                            ans += "<td>" + js["name"] + "</td>";
                            ans += "<td>" + js["phoneno"] + "</td>";
                            ans += "<td>" + js["bookingdate"] + "</td>";
                            ans += "<td>" + js["time"] + "</td>";
                            ans += "<td>" + js["totalprice"] + "</td>";
                            //ans+="<td>"+js["booking_id"]+"</td>";
                            if (js["status"] === "confirm")
                            {
                               // ans += "<td> Service pending</td>";
                                ans+="<td><input type='button' value='cancel booking ' class='btn btn-success' onclick='cancelbooking(" + js ["booking_id"] +")' /></td>";
                            } else if (js["status"] === "billed")
                            {
                                ans += "<td><input type='button' value='pay bill' class='btn btn-success' onclick='paybill(" + js ["booking_id"] + ",\"" + js["totalprice"] + "\")' /></td>";
                            } else if (js["status"] === "paid")
                            {
                                //ans += "<td>bill paid</td>"
                                ans += "<td> <input type='button' class='btn btn-default' value='Give Rating' onclick='giveRating(\"" + js["service_name"] + "\",\"" + js["name"] + "\"," + js["booking_id"] + ")'/>  </td> "
                            }

                            //   ans += "<td>" + js[""] + "</td>";
                            // ans += "<td><img src='" + js["icon"] + "' width='100' height='100' /></td>";

                            //  ans += "<td><input type='button' value='Edit' class='btn btn-success' /></td>";
                            //ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["category_id"] + ")' /></td>";



                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./customerbookings", true);
                xml.send();
            }

            function paybill(bookingid, price)

            {


                alert(price);
                var security1 = sessionStorage.getItem("security");
                var options = {

                    "key": "rzp_test_96HeaVmgRvbrfT",
                    "amount": price + "00", // 2000 paise = INR 20
                    "name": "BookMyHelper",
                    "description": "Payment for Service",
                    "image": "/your_logo.png",
                    "handler": function (response) {

                        var payid = response.razorpay_payment_id;
                        alert(payid);
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.onreadystatechange = function ()

                        {

                            if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                            {

                                var res = xmlhttp.responseText.trim();
                                alert(res);
                                if (res === "success")

                                {
                                    fetch();
                                }

                            }

                        };
                        xmlhttp.open("GET", "./billpay?bookingid=" + bookingid, true);
                        xmlhttp.send();
                    },
                    "prefill": {

                    },
                    "notes": {

                    },
                    "theme": {

                        "color": "#F37254"

                    }

                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
            }
            function giveRating(service_name, merchant_name, booking_id)
            {
                globalbookingid = booking_id;
                $("#myModal").modal("show");
                document.getElementById("servicename").innerHTML = service_name;
                document.getElementById("merchantname").innerHTML = merchant_name;
            }
            function sendRatingData()
            {



                var comment = document.getElementById("comment").value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()

                {

                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)

                    {

                        var res = xmlhttp.responseText.trim();
                        if (res == "success")
                        {
                            alert(res);
                            $("#myModal").modal("hide");
                        }
                    }
                };
                xmlhttp.open("GET", "./GiveRating?bookingid=" + globalbookingid + "&rating=" + rating + "&comment=" + comment, true);
                xmlhttp.send();
            }

            function  setchkvalue(value, id) {
        
                rating=value;
                document.getElementById("chk1").checked =false;
                document.getElementById("chk2").checked =false;
                document.getElementById("chk3").checked = false;
                document.getElementById("chk4").checked =false;
                document.getElementById("chk5").checked =false;
                document.getElementById(id).checked = true;
            }
            
            function cancelbooking(bookingid) {





                    var ans = confirm('Are you sure you want to delete?');

                    if (ans)

                    {



                        var xml = new XMLHttpRequest();

                        xml.onreadystatechange = function ()

                        {

                            if (xml.readyState == 4 && xml.status == 200)

                            {

                                var res = xml.responseText.trim();

                                alert(res);

                                fetch();

                            }

                        };

                        xml.open("GET", "./DeleteBooking?bookingid=" + bookingid, true);

                        xml.send();

                    }





                }
        </script>
    </head>
    <body onload="fetch()" style="margin-top: 80px">
        <jsp:include page="customernavbar.jsp"></jsp:include>

        <div id="d1">
        </div>
        
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
                                <label class="control-label" id="merchantname"></label>
                                <!--<input type="email" placeholder="enter email" class="form-control" id="email" />-->
                            </div>

                            <div class="form-group">
                                <label class="control-label" id="servicename"></label>
                                <!--<input type="password" placeholder="enter password" class="form-control" id="password" />-->
                            </div>

                            <div class="form-group">
                                <label>Select Rating</label><br>
                                1.0&nbsp;<input type="checkbox" id="chk1" value="1.0" onchange="setchkvalue(this.value, 'chk1')" />&nbsp;&nbsp;
                                2.0&nbsp;<input type="checkbox" id="chk2" value="2.0" onchange="setchkvalue(this.value, 'chk2')" />&nbsp;&nbsp;
                                3.0&nbsp;<input type="checkbox" id="chk3" value="3.0" onchange="setchkvalue(this.value, 'chk3')" />&nbsp;&nbsp;
                                4.0&nbsp;<input type="checkbox" id="chk4" value="4.0" onchange="setchkvalue(this.value, 'chk4')" />&nbsp;&nbsp;
                                5.0&nbsp;<input type="checkbox" id="chk5" value="5.0" onchange="setchkvalue(this.value, 'chk5')" />&nbsp;&nbsp;
                                <div id="rating"></div>
                            </div> <br>
                            <div class="form-group">
                                <label>Comments</label>
                                <textarea id="comment" row="4" cols="50" name="description"></textarea>
                            </div> <br>

                            <input type="button" class="btn btn-success" onclick="sendRatingData()" value="Submit" /><br>
                            <br>



                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <script>
            $('#rating').rateYo({
                halfStar: true
            });
        </script>


    </body>
</html>
