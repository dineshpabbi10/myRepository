<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>

        <title>Select Services</title>
    </head>
    <script>
        var globaljsa;
        var globaljsasub;
        var selectedid;
        var selectedindex;
        var ans;
        var checkvalues = "";
        function check(value) {
            var v = value;
            if (event.target.checked) {
                if (checkvalues.indexOf(v) == -1) {
                    checkvalues += v + "~~";

                    document.getElementById("chkhidden").value = checkvalues;
                    //alert(checkvalues);
                }
            } else {
                if (checkvalues.indexOf(v) != -1) {
                    checkvalues = checkvalues.replace(v + "~~", "");
                    document.getElementById("chkhidden").value = checkvalues;
                    //alert(checkvalues);
                }
            }
        }
        function fetchcategories() {
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var ans1 = "";
                    var res = xml.responseText.trim();
                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    globaljsa = jsa;
                    ans1 += "<option>--Select Category--</option>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans1 += "<option value=\"" + js["category_id"] + "\">" + js["category_name"] + "</option>";
                    }
                    document.getElementById("maincat").innerHTML = ans1;
                }
            };
            xml.open("GET", "./GetCategories", true);
            xml.send();
        }
        function setselectedcategory(value)
        {
            selectedid = value;
            selectedindex = document.getElementById("maincat").selectedIndex - 1;
            var index = document.getElementById("maincat").selectedIndex;
            if (index == 0)
            {

                alert("Select any category");
            } else
            {
                fetchsubcategoriestable(value);
            }
        }
        function fetchsubcategoriestable(cid) {
//            alert(cid);
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    globaljsasub = jsa;
                    ans = "<div class=\"container\" >";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<div>";
                        var subcatid = js["subcategory_id"];
                        var subname = js["subcategory_name"];
                        getServiceForSubCat(subcatid, subname);
                        ans += "</div>";
                    }
                    ans += "</div>";
                }
            };
            xml.open("GET", "./getSubCategories?category_id=" + cid, false);
            xml.send();
        }
        function getServiceForSubCat(subcatid, subname) {
            var xmlsub = new XMLHttpRequest();
            xmlsub.onreadystatechange = function ()
            {
                if (xmlsub.readyState == 4 && xmlsub.status == 200)
                {
                    var ressub = xmlsub.responseText.trim();
                    var mainjsonsub = JSON.parse(ressub);
                    var jsasub = mainjsonsub["ans"];

                    ans += "<div style=\"margin-left:210px\"><h4 style=\"color: #000000\"><b>Services Under Sub-Category: </b><label style=\"color: #ff0033\">" + subname + "</label></h4></div>";
                    ans += "<div class=\"row\" style=\"margin-left:10px\">";
                    for (var isub = 0; isub < jsasub.length; isub++)
                    {
                        var jssub = jsasub[isub];
                        ans += "<div class=\"col-sm-4 col-sm-offset-2\">";
                        var st = jssub["status"];
                        if (st == "false") {
                            ans += "<input type=\"checkbox\" id=\"" + isub + "\"  name=\"" + isub + "\" value=" + jssub["service_id"] + " onchange=\"check(this.value)\"><label>&nbsp;" + jssub["service_name"] + "</label>";
                        } else if (st == "true") {
                            ans += "<input type=\"checkbox\" id=\"" + isub + "\" checked=\"true\" name=\"" + isub + "\" value=" + jssub["service_id"] + " onchange=\"check(this.value)\"><label>&nbsp;" + jssub["service_name"] + "</label>";
                            checkvalues += jssub["service_id"] + "~~";

                            document.getElementById("chkhidden").value = checkvalues;
                        }
                        ans += "</div>";
                    }
                    ans += "</div>";
                    document.getElementById("d1").innerHTML = ans;
                }
            };
            xmlsub.open("GET", "./showservicesformerchantselect?subcategory_id=" + subcatid, true);
            xmlsub.send();
        }

        function savedata() {
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();
                    alert(res);

                }
            };
            xml.open("GET", "./savemerchantservices?checkvalues=" + checkvalues, false);
            xml.send();
        }


    </script>



    <body onload="fetchcategories()" style="background-color:#00cdce;margin-top: 80px;height: 580px" >
          <jsp:include page="MerchantLogoutNavbar.jsp"/>
        <div class="container"><div class="page-header"><center><h1 style="color:#ff0033"><b>SELECT - SERVICES</b> </h1></center></div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">

                    <input type="hidden" id="chkhidden" />

                    <div class="form-group">
                        <label>Select Category</label><select class="form-control" id="maincat" name="maincat" onchange="setselectedcategory(this.value)">


                        </select>
                    </div>

                </div>
                <div id="d1" style="margin-top: 50px">

                </div>
            </div>
            <center><input type="button" value="Save " onclick="savedata()"  class="btn btn-success"/></center>
        </div>

    </body>
</html>
