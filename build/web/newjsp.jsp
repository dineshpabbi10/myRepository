
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>

            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                alert("File name: " + firstfile.name);
                alert("File size: " + firstfile.size);

                reader.onload = (function (f)
                {
                    return function read(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    };
                })(firstfile);

                reader.readAsDataURL(firstfile);
            }




            function addsub()
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
                    alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./SubCategoryUploader", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();

                            alert(res);
                        }
                    };

                    xhr.send(formdata);
                }
            }

            function go()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();
                        // document.getElementById("res").innerHTML = res;
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];
                        var ans3;
                        var ans = "";
                        ans += "<option  value='-1'>--Select--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];


                            ans += "<option  value='" + js["category_id"] + "'  >" + js["category_name"] + "</option>";
                            //ans3 = js["category_id"]
                        }
                        document.getElementById("s1").innerHTML = ans;
                        // document.getElementById("setname").innerHTML = ans3;

                    }
                };
                xml.open("GET", "./getCategory", true);
                xml.send();
            }

            function go1()
            {
                alert("fuction called");
                var category_id = document.getElementById("s1").value;
                document.getElementById("setid").innerHTML = category_id;
                document.getElementById("category_id").value = category_id;
                if (category_id == '-1')
                {
                    alert('Please select valid category');
                } else
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText.trim();
                            //document.getElementById("l2").innerHTML = res;

                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];

                            var ans = "";


                            var ans2 = "";
                            ans2 += "<table class='table table-hover'>";

                            ans2 += "<thead class='bg-primary'>";
                            ans2 += "<tr> <td>subcategory_id</td> <td>subcategory_name</td> <td>description</td> <td>category_id</td><td>icon</td><td></td><td></td></tr>";
                            ans2 += "</thead>";

                            ans2 += "<tbody>";


                            ans += "<option value='-1'>--Select--</option>";
                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<option value='" + js["subcategory_id"] + "'  >" + js["subcategory_name"] + "</option>";

                                ans2 += "<tr>";
                                ans2 += "<td>" + js["subcategory_id"] + "</td>";
                                ans2 += "<td>" + js["subcategory_name"] + "</td>";
                                ans2 += "<td>" + js["description"] + "</td>";
                                ans2 += "<td>" + js["category_id"] + "</td>";
                                ans2 += "<td><img src='" + js["icon"] + "' width='100' height='100' /></td>";
                                ans2 += "<td><input type='button' value='Edit' class='btn btn-success'data-toggle='modal' data-target='#myModal1' onclick='EditSubcategory(" + js["subcategory_id"] + ")' /></td>";
                                 ans2 += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='delsub(" + js["subcategory_id"] + ")'></td>";
                ans2 += "</tr>";


                            }

                            ans2 += "</tbody>";
                            ans2 += "</table>";

                            document.getElementById("d2").innerHTML = ans2;


                            document.getElementById("s2").innerHTML = ans;



                        }
                    };
                    xml.open("GET", "./getSubCategories?category_id=" + category_id, true);
                    xml.send();



                }



            }


            function delsub(subcategory_id)
            {

                var subcategory_id = subcategory_id;
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
                            go1();

                        }
                    };
                    xml.open("GET", "./deleteSubCategory?subcategory_id=" + subcategory_id, true);
                    xml.send();
                }
            }

            function EditSubcategory(subcategory_id)
            {
                alert("fuction called set");
                var esubcategory_id = subcategory_id;
                //document.getElementById("esetid").innerHTML = category_id;
                //document.getElementById("ecategory_id").value = category_id;
 
                if (category_id == '-1')
                {
                    alert('Please select valid category');
                } else
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
                            jsa = jsa[0];
                            document.getElementById("esubcategory_name").value = jsa["subcategory_name"];
                            document.getElementById("edescription").value = jsa["description"];
                            document.getElementById("esubcategory_id").value = jsa["subcategory_id"];
                            document.getElementById("setide").innerHTML = jsa["subcategory_id"];
                            document.getElementById("im2").src=jsa["icon"];
                        }
                    };
                    xml.open("GET", "./getSub?subcategory_id=" + subcategory_id, true);
                    xml.send();



                }


            }
          function  editdata()
            {
               
                var ans = "";

                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;

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
                    alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./EditSubcategory", true);
                   
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();

                            alert(res);
                        }
                    };

                    xhr.send(formdata);
                } 
                
                
            }

        </script>


    </head>
    <body>
        <button type="button" onclick="go()">Fetch Categories</button><br>


        <label>Select category </label>
        <select class="form-control" id="s1" onchange="go1()">

        </select>

        <hr>

        <label id="l2"></label>

        <label>Select subcategory you want to delete</label>
        <select class="form-control" id="s2" onchange="delsub()">

        </select>

        <div class="row">
            <div class="col-sm-12">



                <button type="button" class="btn btn-info btn-lg" data-toggle="modal"data-target="#myModal">Add sub category</button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add Sub categories</h4>
                            </div>
                            <div class="modal-body">

                                <form id="form1"  class="form-vertical"method="POST" enctype="multipart/form-data" >
                                    <div class="form-group">
                                        <label>Enter Sub Category Name</label>
                                        <input type="text" class="form-control" name="subcategory_name"/>
                                    </div>
                                    <div class="form-group">
                                        <label> Category id</label>

                                        <h3> <label id="setid"></label></h3>
                                        <input type="hidden" name="category_name" id="category_id"/>

                                    </div>
                                    <div class="form-group">
                                        <label>Enter Description</label>
                                        <textarea rows="10" cols="5" class="form-control "name="description" ></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label> Select Icon</label>
                                        <input type="file" class="form-control" name="icon" onchange="readandpreview(this, 'im1')"/>
                                    </div>
                                    <div class="form-group">
                                        <label>preview</label>
                                        <img src=""id="im1"style="width:100px;height:100px">
                                    </div>
                                </form>
                                <input type="button" class="btn btn-success" value="Add New Category "  onclick="addsub()" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div id="d2"></div>







        <div class="col-sm-12">


            <!-- Modal -->
            <div id="myModal1" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Sub categories</h4>
                        </div>
                        <div class="modal-body">

                            <form id="form2"  class="form-vertical"method="POST" enctype="multipart/form-data" >
                                <div class="form-group">
                                    <label>Enter Sub Category Name</label>
                                    <input type="text" class="form-control" name="subcategory_name" id="esubcategory_name"/>
                                </div>
                                <div class="form-group">
                                    <label> SubCategory id</label>

                                    <h3> <label id="setide"></label></h3>
                                    <input type="hidden" name="esubcategory_id" id="esubcategory_id"/>

                                </div>
                                <div class="form-group">
                                    <label>Enter Description</label>
                                    <textarea rows="10" cols="5" class="form-control "name="description" id="edescription"></textarea>
                                </div>
                                <div class="form-group">
                                    <label> Select Icon</label>
                                    <input type="file" class="form-control" name="icon" onchange="readandpreview(this, 'im2')"/>
                                </div>
                                <div class="form-group">
                                    <label>preview</label>
                                    <img src=""id="im2"style="width:100px;height:100px">
                                </div>
                            </form>
                            <input type="button" class="btn btn-success" value="Edit sub Category " onclick="editdata()" />
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
