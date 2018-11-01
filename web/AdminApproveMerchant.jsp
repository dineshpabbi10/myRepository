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
                        ans += "<table class='table table-hover'>";
                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td><td>Status</td><td>manage</td></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        var ans1 = "";
                        ans1 += "<table class='table table-hover'>";
                        ans1 += "<thead class='bg-primary'>";
                        ans1 += "<tr> <td>Email</td> <td>Name</td> <td>Contact Number</td> <td>Photo</td><td>ID</td><td>Start Time</td><td>End Time</td><td>Status</td><td>manage</td></tr>";
                        ans1 += "</thead>";
                        ans1 += "<tbody>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            if (js["status"] === "pending") {
                                ans += "<tr>";
                                ans += "<td>" + js["email"] + "</td>";
                                ans += "<td>" + js["name"] + "</td>";
                                ans += "<td>" + js["phoneno"] + "</td>";
                                ans += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";
                                ans += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";
                                ans += "<td>" + js["starttime"] + "</td>";
                                ans += "<td>" + js["endtime"] + "</td>";
                                ans += "<td>" + js["status"] + "</td>";
                                ans += "<td><input type='button' value='Approve' class='btn btn-success' onclick='changeStatus(" + js["mid"] + ",\"Approved\")' /></td>";
                                ans += "</tr>";
                            } else if(js["status"]==="Approved")
                            {
                                ans1 += "<tr>";
                                ans1 += "<td>" + js["email"] + "</td>";
                                ans1 += "<td>" + js["name"] + "</td>";
                                ans1 += "<td>" + js["phoneno"] + "</td>";
                                ans1 += "<td><img src='" + js["photo"] + "' width='100' height='100' /></td>";
                                ans1 += "<td><img src='" + js["proof"] + "' width='100' height='100' /></td>";
                                ans1 += "<td>" + js["starttime"] + "</td>";
                                ans1 += "<td>" + js["endtime"] + "</td>";
                                ans1 += "<td>" + js["status"] + "</td>";
                                ans1 += "<td><input type='button' value='Block' class='btn btn-success' onclick='changeStatus(" + js["mid"] + ",\"pending\")' /></td>";
                                ans1 += "</tr>";
                            }
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        ans1 += "</tbody>";
                        ans1 += "</table>";
                        document.getElementById("d1").innerHTML = ans;
                        document.getElementById("d2").innerHTML = ans1;
                    }
                };
                xml.open("GET", "./FetchMerchantInfo", true);
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
                        if (res === "success")
                        {
                            fetch();
                        }
                    }
                };

                xml.open("GET", "./ChangeMerchantStatus?mid=" + mid + "&status=" + status, true);

                xml.send();
            }

        </script>

        <title></title>

    </head>

    <body onload="fetch()">
        
         <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>

         <h1 style="margin-top: 80px">Blocked Merchants</h1>
        <div id="d1"></div>
         <h1 >Approved Merchants</h1>
        <div id="d2"></div>

    </body>

</html>