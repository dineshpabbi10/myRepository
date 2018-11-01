<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     

        <title>Manage Services</title>
    </head>

    <script>
        var jsacat;
        var jsasubcat;
        var jsaservices;
        var selectedcid;
        var selectedsid;
        var selectedcatindex;
        var selectedsubcatindex;
        var typeofservice;


        function readandpreview(fileobj, imageid)
        {
            var firstfile = fileobj.files[0];

            var reader = new FileReader();

            alert("File name: " + firstfile.name);
            alert("File size: " + firstfile.size);

            reader.onload = (function (f)
            {
                return function read12(e)
                {
                    document.getElementById(imageid).src = e.target.result;
                };
            })(firstfile);


            reader.readAsDataURL(firstfile);
        }


        function showaddservicemodel() {

            var jscat = jsacat[selectedcatindex];
            document.getElementById("cid").value = jscat["category_id"];

            document.getElementById("cname").value = jscat["category_name"];
            var jssubcat = jsasubcat[selectedsubcatindex];
            document.getElementById("sid").value = jssubcat["subcategory_id"];

            document.getElementById("sname").value = jssubcat["subcategory_name"];
            $("#mymodaladdservice").modal('show');
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

                    jsacat = jsa;
                    ans1 += "<option>--Select Category--</option>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans1 += "<option value=\"" + js["category_id"] + "\">" + js["category_name"] + "</option>";
                    }
                    document.getElementById("maincat").innerHTML = ans1;
                }

            };

            xml.open("GET", "./FetchDetailsOfCategories", true);
            xml.send();
        }



        function setselectedcategory(value)
        {

            var index = document.getElementById("maincat").selectedIndex;


            if (index == 0)
            {

                alert("Select any category");
            } else
            {
                selectedcid = value;
                selectedcatindex = index - 1;
                fetchsubcategories(value);




            }
        }
        function setselectedsubcategory(value)
        {

            var index = document.getElementById("subcat").selectedIndex;


            if (index == 0)
            {

                alert("Select any Sub-category");
            } else
            {
                selectedsid = value;
                selectedsubcatindex = index - 1;
                fetchservicestable(value);




            }
        }
        function fetchsubcategories(category_id) {


            var ans1;
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    jsasubcat = jsa;

                    ans1 += "<option>--Select Sub-Category--</option>";
                     
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans1 += "<option value=\"" + js["subcategory_id"] + "\">" + js["subcategory_name"] + "</option>";
                    }
                    ans1 += "<h1>Already Added Services</h1>";
                    document.getElementById("subcat").innerHTML = ans1;
                }
            };

            xml.open("GET", "./getSubCategories?category_id=" + category_id, false);
            xml.send();
        }
        function fetchservicestable(subcategory_id) {


            var ans;
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    jsaservices = jsa;
                    //alert(jsa[0]["Movieid"]);

                    ans = "<table  class=\"table table-hover\" >";
                    ans += "<thead class=\"bg-primary\"><tr><td>Service Name</td><td>Service Type</td><td>Service Description</td><td>Price Per Hour</td><td>Fixed Price</td><td>Dynamic Price</td><td>Icon</td><td>Edit</td><td>Delete</td></tr></thead>";

                    ans += "<tbody>";

                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];

                        ans += "<tr>";

                        ans += "<td id='sername_" + i + "'>" + js["service_name"] + "</td>";
                        ans += "<td id=\"sertype_" + i + "\">" + js["servicetype"] + "</td>";
                        ans += "<td id=\"serdesc_" + i + "\">" + js["servicedescription"] + "</td>";
                        ans += "<td id=\"priceperhour_" + i + "\">" + js["priceperhour"] + "</td>";
                        ans += "<td id=\"fixedprice_" + i + "\">" + js["fixedprice"] + "</td>";
                        ans += "<td id=\"dynamicprice_" + i + "\">" + js["dynamicprice"] + "</td>";
                        ans += "<td><img id='icon" + i + "' src='" + js["icon"] + "' width='100' height='100' /></td>";

                        ans += "<td><input type=\"button\" value=\"Edit\" class=\"btn btn-success\" onclick=\"showeditservicemodel(" + i + ")\"/></td>";
                        ans += "<td><input type=\"button\" value=\"Delete\" class=\"btn btn-danger\" onclick=\"delservice(" + i + ")\"/></td>";
                        ans += "</tr>";

                    }

                    ans += "</tbody>";
                    ans += "</table>";

                    document.getElementById("d1").innerHTML = ans;
                }
            };

            xml.open("GET", "./getServices?subcategory_id=" + subcategory_id, false);
            xml.send();
        }
        function settype(value) {
            typeofservice = value;

            if (typeofservice == "Fixed Price Service") {
                document.getElementById("pph").style.display = 'none';
                document.getElementById("dp").style.display = 'none';
                document.getElementById("fp").style.display = 'block';
            } else if (typeofservice == "Price per Hour Service") {
                document.getElementById("fp").style.display = 'none';
                document.getElementById("dp").style.display = 'none';
                document.getElementById("pph").style.display = 'block';
            } else if (typeofservice == "Dynamic Price Service") {
                document.getElementById("fp").style.display = 'none';
                document.getElementById("pph").style.display = 'none';
                document.getElementById("dp").style.display = 'block';
            } else {
                document.getElementById("pph").style.display = 'none';
                document.getElementById("dp").style.display = 'none';
                document.getElementById("fp").style.display = 'none';
            }
        }
        function settypeedit(value) {
            typeofservice = value;
            if (typeofservice == "Fixed Price Service") {
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("fpedit").style.display = 'block';
            } else if (typeofservice == "Price per Hour Service") {
                document.getElementById("fpedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("pphedit").style.display = 'block';
            } else if (typeofservice == "Dynamic Price Service") {
                document.getElementById("fpedit").style.display = 'none';
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'block';
            } else {
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("fpedit").style.display = 'none';
            }
        }
        function delservice(index)
        {
            var js = jsaservices[index];
            var serviceid = js["service_id"];
            var ans = confirm("Are you sure you want to delete service:");
            if (ans === true) {

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        if (res === "success") {
                            alert(" successfully deleted");
//                            refresh by coding

                            setselectedsubcategory(selectedsid);
                            //end
                        } else
                            alert("error in deletion");
                    }
                };
            }
            ;
            xmlhttp.open("GET", "./deleteService?service_id=" + serviceid, true);

            xmlhttp.send();
        }



        function showeditservicemodel(index) {

            var jscat = jsacat[selectedcatindex];
            var cid = jscat["category_id"];
            document.getElementById("cidedit").value = cid;
            document.getElementById("cnameedit").value = jscat["category_name"];
            var jssubcat = jsasubcat[selectedsubcatindex];
            document.getElementById("snameedit").value = jssubcat["subcategory_name"];
            document.getElementById("sidedit").value = jssubcat["subcategory_id"];
            var jsservice = jsaservices[index];
            document.getElementById("sernameedit").value = jsservice["service_name"];
            document.getElementById("serviceidedit").value = jsservice["service_id"];
            document.getElementById("serdescedit").value = jsservice["servicedescription"];
            document.getElementById("sertypeedit").value = jsservice["servicetype"];
            document.getElementById("icon2").value="";
            document.getElementById("im3").src=jsservice["icon"];

            if (jsservice["servicetype"] == "Fixed Price Service") {
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("fpedit").style.display = 'block';
                document.getElementById("fixedpriceedit").value = jsservice["fixedprice"];
            } else if (jsservice["servicetype"] == "Price per Hour Service") {
                document.getElementById("fpedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("pphedit").style.display = 'block';
                document.getElementById("priceperhouredit").value = jsservice["priceperhour"];
            } else if (jsservice["servicetype"] == "Dynamic Price Service") {
                document.getElementById("fpedit").style.display = 'none';
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'block';
                document.getElementById("dynamicpriceedit").value = jsservice["dynamicprice"];
            } else {
                document.getElementById("pphedit").style.display = 'none';
                document.getElementById("dpedit").style.display = 'none';
                document.getElementById("fpedit").style.display = 'none';
            }

            $("#mymodaleditservice").modal('show');
        }

        function addservice()
        {

            var sername = document.getElementById("sname").value;
            var serdesc = document.getElementById("serdesc").value;
            var sertypeindex = document.getElementById("sertype").selectedIndex;
            var sertypevalue = document.getElementById("sertype").selectedIndex;


            if (sername == "")
            {
                alert("Please Enter Service Name");
            } else if (sertypeindex == 0)
            {
                alert("Please Select Service Type");
            } else if (sertypevalue == "Fixed Price Service")
            {
                var fp = document.getElementById("fixedprice").value;
                if (fp == "") {
                    alert("enter fixed price value");
                }
            } else if (sertypevalue == "Price per Hour Service")
            {
                var pph = document.getElementById("priceperhour").value;
                if (pph == "") {
                    alert("enter  price per hour value");
                }
            } else if (sertypevalue == "Dynamic Price Service")
            {
                var dp = document.getElementById("dynamicprice").value;
                if (dp == "") {
                    alert("enter dynamic price value");
                }
            } else if (serdesc == "")
            {
                alert("Please Enter Service Description");
            } else {

                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                alert("found " + controls.length + " controls in form");

                var ans = "";
                //NEW CODE

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
                        } 
                        else
                        {
                            flag = 2;
                        }
                    } else
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }

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

                    var xhr = new XMLHttpRequest;


                    xhr.open("POST", "./AdminAddService", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status === 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res === "success")
                            {
                                alert("Service Added Successfully");
                                $("#mymodaladdservice").modal('hide');
                                document.getElementById("dynamicprice").value = "";
                                document.getElementById("priceperhour").value = "";
                                document.getElementById("fixedprice").value = "";
                                document.getElementById("sertype").selectedIndex = 0;
                                document.getElementById("serdesc").value = "";
                                document.getElementById("sername").value = "";
                                settype("--select service--");

                                setselectedsubcategory(selectedsid);



                            } else
                            {
                                alert("This Service Already Exist under this Sub-Category");
                            }

                        }
                    };


                    xhr.send(formdata);

                }
            }
        }
        function editservice()
        {

            var sername = document.getElementById("sernameedit").value;
            var serdesc = document.getElementById("serdescedit").value;
            var sertypeindex = document.getElementById("sertypeedit").selectedIndex;
            var sertypevalue = document.getElementById("sertypeedit").selectedIndex;


            if (sername == "")
            {
                alert("Please Enter Service Name");
            } else if (sertypeindex == 0)
            {
                alert("Please Select Service Type");
            } else if (sertypevalue == "Fixed Price Service")
            {
                var fp = document.getElementById("fixedpriceedit").value;
                if (fp == "") {
                    alert("enter fixed price value");
                }
            } else if (sertypevalue == "Price per Hour Service")
            {
                var pph = document.getElementById("priceperhouredit").value;
                if (pph == "") {
                    alert("enter  price per hour value");
                }
            } else if (sertypevalue == "Dynamic Price Service")
            {
                var dp = document.getElementById("dynamicpriceedit").value;
                if (dp == "") {
                    alert("enter dynamic price value");
                }
            } else if (serdesc == "")
            {
                alert("Please Enter Service Description");
            } else {
                alert("ok");
                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;

                alert("found " + controls.length + " controls in form");

                var ans = "";
                //NEW CODE

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
                        }
                        //else
                        //{
                          //  flag = 2;
                        //}
                    } else
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }

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

                    var xhr = new XMLHttpRequest;


                    xhr.open("POST", "./EditService", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status === 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res === "success")
                            {
                                alert("Service Updated Successfully");
                                $("#mymodaleditservice").modal('hide');
                                document.getElementById("dynamicpriceedit").value = "";
                                document.getElementById("priceperhouredit").value = "";
                                document.getElementById("fixedpriceedit").value = "";
                                document.getElementById("sertypeedit").selectedIndex = 0;
                                document.getElementById("serdescedit").value = "";
                                document.getElementById("sernameedit").value = "";
                                document.getElementById("icon2").value="";
            document.getElementById("im3").src="";

                                settypeedit("--select service--");
                                setselectedsubcategory(selectedsid);



                            } else
                            {
                                alert("Service Update Failed");
                            }

                        }
                    };


                    xhr.send(formdata);

                }
            }
        }

    </script>



    <body onload="fetchcategories()" style="background: url('images/background2.jpg');height: 1300px">
        
         <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>
         <br>
         <br>
         <br>
         
        <div class="container" style="margin-top:80px">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">



                    <div class="form-group">
                        <label>Select Category</label><select class="form-control" id="maincat" name="maincat" onchange="setselectedcategory(this.value)">


                        </select>
                    </div>
                    <div class="form-group">
                        <label>Select Sub-Category</label><select class="form-control" id="subcat" name="subcat" onchange="setselectedsubcategory(this.value)">


                        </select>
                    </div>
                    <div class="page-header">
                        <center> <input type="button" value="Add Service" class="btn btn-success " style="margin-right: 200px;" onclick="showaddservicemodel()" /> </center>

                    </div>
                     <!--<centre><h1>Already Added Services</h1></centre>-->
                </div>
                <div id="d1">

                </div>
            </div>


            <!-- Modal add new category-->
            <div id="mymodaladdservice" class="modal fade" role="dialog" style="background-color: #cccccc;">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="background-color: #999999;" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Service</h4>
                        </div>
                        <div class="modal-body">



                            <form id="form1" action="#" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>under category</label>
                                    <input type="text" id="cname" name="cname" class="form-control" placeholder="Category name"  readonly>
                                    <input type="hidden" id="cid" name="cid" >
                                </div>
                                <div class="form-group">
                                    <label>under sub-category</label>
                                    <input type="text" id="sname" name="sname" class="form-control" placeholder="Sub-Category name"  readonly>
                                    <input type="hidden" id="sid" name="sid" >
                                </div>
                                <div class="form-control">
                                    <label>Select Service type</label>
                                    <select  id="sertype" name="sertype" onchange="settype(this.value)" >
                                        <option value="--select service type--">--select service type--</option>
                                        <option value="Fixed Price Service">Fixed Price Service</option>
                                        <option value="Price per Hour Service">Price per Hour Service</option>
                                        <option value="Dynamic Price Service">Dynamic Price Service</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label> Service Name</label>
                                    <input type="text" id="sername" name="sername" class="form-control" placeholder="Service name">
                                </div>


                                <div class="form-group">
                                    <label> Service Description</label>
                                    <textarea  rows="10" cols="5" id="serdesc" name="serdesc" class="form-control" placeholder="Service Description"></textarea>
                                </div>
                                <div class="form-group" id="pph">
                                    <label> Price Per Hour</label>
                                    <input type="text" id="priceperhour" name="priceperhour" class="form-control" placeholder="enter price per hour">
                                </div>
                                <div class="form-group" id="fp">
                                    <label> Fixed Price</label>
                                    <input type="text" id="fixedprice" name="fixedprice" class="form-control" placeholder="enter fixed price">
                                </div>
                                <div class="form-group" id="dp">
                                    <label> Dynamic Price</label>
                                    <input type="text" id="dynamicprice" name="dynamicprice" class="form-control" placeholder="enter dynamic price">
                                </div>

                                <div class="form-group">
                                    <label>Select Icon</label>
                                    <input type="file"  class="form-control" name="icon "  onchange="readandpreview(this, 'im2')"/>

                                </div>
                                <div class="form-group">

                                    <label>preview</label>
                                    <img src="" id="im2" style="height:100px;width:100px"/>
                                </div>

                                <input type="button" name="bt" value="Add Service" class="btn btn-default " style="margin-left: 195px;" onclick="addservice()" />
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Modal add edit category-->
            <div id="mymodaleditservice" class="modal fade" role="dialog" style="background-color: #cccccc;">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="background-color: #999999;" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Service</h4>
                        </div>
                        <div class="modal-body">



                            <form id="form2" action="#" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>under category</label>
                                    <input type="text" id="cnameedit" name="cnameedit" class="form-control" placeholder="Category name"  readonly>
                                    <input type="hidden" id="cidedit" name="cidedit" >
                                </div>
                                <div class="form-group">
                                    <label>under sub-category</label>
                                    <input type="text" id="snameedit" name="snameedit" class="form-control" placeholder="Sub-Category name"  readonly>
                                    <input type="hidden" id="sidedit" name="sidedit" >
                                </div>
                                <div class="form-control">
                                    <label>Select Service type</label>
                                    <select  id="sertypeedit" name="sertypeedit" onchange="settypeedit(this.value)" >
                                        <option value="--select service type--">--select service type--</option>
                                        <option value="Fixed Price Service">Fixed Price Service</option>
                                        <option value="Price per Hour Service">Price per Hour Service</option>
                                        <option value="Dynamic Price Service">Dynamic Price Service</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label> Service Name</label>
                                    <input type="text" id="sernameedit" name="sernameedit" class="form-control" placeholder="Service name">
                                    <input type="hidden" id="serviceidedit" name="serviceidedit" >
                                </div>


                                <div class="form-group">
                                    <label> Service Description</label>
                                    <textarea  rows="10" cols="5" id="serdescedit" name="serdescedit" class="form-control" placeholder="Service Description"></textarea>
                                </div>
                                <div class="form-group" id="pphedit">
                                    <label> Price Per Hour</label>
                                    <input type="text" id="priceperhouredit" name="priceperhouredit" class="form-control" placeholder="enter price per hour">
                                </div>
                                <div class="form-group" id="fpedit">
                                    <label> Fixed Price</label>
                                    <input type="text" id="fixedpriceedit" name="fixedpriceedit" class="form-control" placeholder="enter fixed price">
                                </div>
                                <div class="form-group" id="dpedit">
                                    <label> Dynamic Price</label>
                                    <input type="text" id="dynamicpriceedit" name="dynamicpriceedit" class="form-control" placeholder="enter dynamic price">
                                </div>

                                <div class="form-group">
                                    <label>Select Icon</label>
                                    <input type="file" id="icon2" class="form-control" name="icon2 "  onchange="readandpreview(this, 'im3')"/>

                                </div>
                                <div class="form-group">

                                    <label>preview</label>
                                    <img src="" id="im3" style="height:100px;width:100px"/>
                                </div>


                                <input type="button" name="btedit" value="Update Service" class="btn btn-default " style="margin-left: 195px;" onclick="editservice()" />
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
