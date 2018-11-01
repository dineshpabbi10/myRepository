<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>



        <script>

            function fetch()

            {

                var js;

                var xml = new XMLHttpRequest();

                xml.onreadystatechange = function ()

                {

                    if (xml.readyState == 4 && xml.status == 200)

                    {

                        var res = xml.responseText.trim();





                        var mainjson = JSON.parse(res);



                        var jsa = mainjson["ans"];



                        var ans = "";

//                        ans += "<table class='table table-hover'>";
//
//
//
//                        ans += "<thead class='bg-primary'>";
//
//                        ans += "<tr > <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td></tr>";
//
//                        ans += "</thead>";
//
//
//
//                        ans += "<tbody>";



                        for (var i = 0; i < jsa.length; i++)

                        {

                            js = jsa[i];

                            ans += "<div class='col-sm-offset-2 col-sm-4'>";
                            ans += "<center>";
                            ans += "<img style='width:300px;height:400px' src='" + js["photo"] + "'>";
                            ans += "</center>";
                            ans += "</div>";

                            ans += "<div class='col-sm-4'>";
                            
                            ans += "<div class='row' style='margin-top:120px'>";
                            ans += "<div class='col-sm-6'>";
                            ans += "<center><label>Name:</label></center>";
                            ans += "</div><div class='col-sm-6'>";
                            ans += "<center><label>" + js["name"] + "</label></center>";
                            ans += "</div></div>";
                            
                            ans += "<div class='row' style='margin-top:10px'>";
                            ans += "<div class='col-sm-6'>";
                            ans += "<center><label>Phone No:</label></center>";
                            ans += "</div><div class='col-sm-6'>";
                            ans += "<center><label>" + js["phoneno"] + "</label></center>";
                            ans += "</div></div>";
                            
                            ans += "<div class='row' style='margin-top:10px'>";
                            ans += "<div class='col-sm-6'>";
                            ans += "<center><label>Email:</label></center>";
                            ans += "</div><div class='col-sm-6'>";
                            ans += "<center><label>" + js["email"] + "</label></center>";
                            ans += "</div></div>";
                            
                            ans += "<div class='row' style='margin-top:10px'>";
                            ans += "<div class='col-sm-6'>";
                            ans += "<center><label>Timings</label></center>";
                            ans += "</div><div class='col-sm-6'>";
                            ans += "<center><label>" + js["starttime"] + " - " + js["endtime"] + "</label></center>";
                            ans += "</div></div>";
                            
                            ans += "</div>";



//                            ans += "<tr>";
//
//                            ans += "<td>" + js["email"] + "</td>";
//
//                            ans += "<td>" + js["name"] + "</td>";
//
//                            ans += "<td>" + js["phoneno"] + "</td>";



//                            ans += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";
//
//                            ans += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";
//
//                            ans += "<td>" + js["starttime"] + "</td>";
//
//                            ans += "<td>" + js["endtime"] + "</td>";



                            //  ans += "<td><input type='button' value='Approve' class='btn btn-success' onclick='' /></td>";



//                            ans += "</tr>";





                        }

//                        ans += "</tbody>";
//
//                        ans += "</table>";
//
//





                        document.getElementById("d1").innerHTML = ans;



                    }

                };

                xml.open("GET", "./FetchSingleMerchant", true);

                xml.send();

            }

        </script>

    </head>

    <body onload="fetch()">

        <%

            String merchantemail = session.getAttribute("merchantemail").toString();

        %>



        <jsp:include page="MerchantLogoutNavbar.jsp"/>

        <div style="margin-top: 150px"></div>
        <div class="container">
            <div id="d1"></div>


        </div>
    </body>

</html>