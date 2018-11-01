<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script>



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
                        ans += " <h2>Good Performers</h2>";
                        ans += "<table class='table table-hover'>";
                        ans += "<thead class='bg-primary'>";
                        // ans += "<tr> <td>Name</td>  <td>Photo</td><td>Rating</td></tr>";
                        ans += "<tr> <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td><td>Ratings</td><td>manage</td></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        var ans1 = "";
                        ans1 += " <h2>Poor Performers</h2>";
                        ans1 += "<table class='table table-hover'>";
                        ans1 += "<thead class='bg-primary'>";
                        //ans1 += "<tr> <td>Name</td> <td>Photo</td><td>Rating</td></tr>";
                        ans1 += "<tr> <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td><td>Ratings</td><td>manage</td></tr>";
                        ans1 += "</thead>";
                        ans1 += "<tbody>";


                        var ans2 = "";
                        ans2 += " <h2>Very Poor Performers</h2>";
                        ans2 += "<table class='table table-hover'>";
                        ans2 += "<thead class='bg-primary'>";
                        //ans2 += "<tr> <td>Name</td> <td>Photo</td><td>Rating</td></tr>";
                        ans2 += "<tr> <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td><td>Ratings</td><td>manage</td></tr>";
                        ans2 += "</thead>";
                        ans2 += "<tbody>";
                        for (var i = 0; i < jsa.length; i++)
                        {

                            var js = jsa[i];



                            if (parseFloat(js["avgrating"]) > 3)

                            {

                                ans += "<tr>";

                                ans += "<td>" + js["email"] + "</td>";

                                ans += "<td>" + js["name"] + "</td>";

                                ans += "<td>" + js["phoneno"] + "</td>";



                                ans += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";

                                ans += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";

                                ans += "<td>" + js["starttime"] + "</td>";

                                ans += "<td>" + js["endtime"] + "</td>";

                                ans += "<td>" + js["avgrating"] + "</td>";

                             //   ans += "<td><input type='button' value='Praise' class='btn btn-success' onclick='changeStatus(" + js["mid"] + ",\"Approved\")' /></td>";



                                ans += "</tr>";

                            } else if (parseFloat(js["avgrating"]) <= 3 && parseFloat(js["avgrating"]) > (1.5))

                            {



                                ans1 += "<tr>";

                                ans1 += "<td>" + js["email"] + "</td>";

                                ans1 += "<td>" + js["name"] + "</td>";

                                ans1 += "<td>" + js["phoneno"] + "</td>";



                                ans1 += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";

                                ans1 += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";

                                ans1 += "<td>" + js["starttime"] + "</td>";

                                ans1 += "<td>" + js["endtime"] + "</td>";

                                ans1 += "<td>" + js["avgrating"] + "</td>";

                                ans1 += "<td><input type='button' value='Warning' class='btn btn-success' onclick='changeStatus(" + js["mid"] + ",\"Warning\")' /></td>";



                                ans1 += "</tr>";

                            } else if (parseFloat(js["avgrating"]) <= (1.5))

                            {



                                ans2 += "<tr>";

                                ans2 += "<td>" + js["email"] + "</td>";

                                ans2 += "<td>" + js["name"] + "</td>";

                                ans2 += "<td>" + js["phoneno"] + "</td>";



                                ans2 += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";

                                ans2 += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";

                                ans2 += "<td>" + js["starttime"] + "</td>";

                                ans2 += "<td>" + js["endtime"] + "</td>";

                                ans2 += "<td>" + js["avgrating"] + "</td>";

                                ans2 += "<td><input type='button' value='Block' class='btn btn-success' onclick='changeStatus(" + js["mid"] + ",\"BLOCK\")' /></td>";



                                ans2 += "</tr>";

                            }

                        }

                        ans += "</tbody>";

                        ans += "</table>";



                        ans1 += "</tbody>";

                        ans1 += "</table>";



                        ans2 += "</tbody>";

                        ans2 += "</table>";



                        document.getElementById("d1").innerHTML = ans;

                        document.getElementById("d2").innerHTML = ans1;

                        document.getElementById("d3").innerHTML = ans2;

                    }

                };

                xml.open("GET", "./FetchMerchantRating", true);

                xml.send();

            }


            function changeStatus(mid, status)
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()

                {

                    if (xml.readyState == 4 && xml.status == 200)

                    {

                        var res = xml.responseText.trim();
                      //  alert(res);
                        //  if (res === "success")

                        //{
                        //  fetch();
                        //}
                    }
                };

                xml.open("GET", "./AdminMerchantReview?mid=" + mid + "&status=" + status, true);

                xml.send();
            }

        </script>

        <title></title>

    </head>

    <body onload="fetch()">

         <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>
        <div id="d1" style="margin-top: 80px">


        </div>
        <div id="d2">


        </div>

        <div id="d3">




        </div>

    </body>

</html>