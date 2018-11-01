
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <script>


            function go()
            {
                var ans = "";
                //NEW CODE
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
                    } else    // for other input types  text,password,select
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        //formdata.append("rn",document.getElementById("rn").value);
                        //formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
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

                    xhr.open("POST", "./CategoryUploader", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            alert(xhr.responseText);
                            fetch();

                        }
                    };
                    xhr.send(formdata);
                }
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <td>Category_id</td> <td>category_name</td> <td>Description</td><td>Photo</td><td>Edit</td><td>Delete</td></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["category_id"] + "</td>";
                            ans += "<td>" + js["category_name"] + "</td>";
                            ans += "<td>" + js["description"] + "</td>";
                            //  ans += "<td>" + js["email"] + "</td>";
                            ans += "<td><img src='" + js["icon"] + "' width='100' height='100' /></td>";
                            ans += "<td><input type='button' value='Edit' class='btn btn-success'data-toggle='modal' data-target='#myModal1' onclick='Editcategory(" + js["category_id"] + ")' /></td>";
                            // ans += "<td><input type='button' value='Edit' class='btn btn-success' /></td>";
                            ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["category_id"] + ")' /></td>";
                            ans += "</tr>";


                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./AddCategoryServlet", true);
                xml.send();



            }


            function del(category_id)
            {
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
                    xml.open("GET", "DeleteCategoryInfoServlet?category_id=" + category_id, true);
                    xml.send();
                }
            }

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

            function Editcategory(category_id)

            {

                alert("fuction called set");





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

                            document.getElementById("ecategory_name").value = jsa["category_name"];

                            document.getElementById("edescription").value = jsa["description"];

                            document.getElementById("ecategory_id").value = jsa["category_id"];

                            document.getElementById("setide").innerHTML = jsa["category_id"];

                            document.getElementById("im2").src = jsa["icon"];

                        }

                    };

                    xml.open("GET", "./getCat?category_id=" + category_id, true);

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



                    xhr.open("POST", "./EditCategory", true);



                    xhr.onreadystatechange = function ()

                    {

                        if (xhr.readyState === 4 && xhr.status == 200)

                        {

                            var res = xhr.responseText.trim();



                            alert(res);
                            fetch();

                        }

                    };



                    xhr.send(formdata);

                }





            }



        </script>


    </head>
    <body onload="fetch()">
        <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>

        <div class="container" style="margin-top: 80px">

            <!-- <div class="jumbotron"> -->
            <!--<h1>Bootstrap Modal</h1> -->
        </div>

        <div class="row">
            <div class="col-sm-12">



                <centre><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add New Category</button></centre>
                <centre><h1>Already Added Categories</h1></centre>
                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add New Category</h4>
                            </div>
                            <div class="modal-body">
                                <form id ="form1" class="form-vertical" method="POST" enctype="multipart/form-data"> 

                                    <div class="form-group">
                                        <label>Enter Category Id</label>
                                        <input id="category_id" type="text" class="form-control" name="category_id" />
                                    </div>
                                    <div class="form-group">
                                        <label>Enter Category Name</label>
                                        <input id="category" type="text" class="form-control" name="category_name" />
                                    </div>

                                    <div class="form-group">
                                        <label>Enter Description</label>
                                        <textarea id="description" row="4" cols="50" name="description"></textarea>
                                    </div> <br>

                                    <div class="form-group">
                                        <label>Select Photo</label>
                                        <input id="photo" type="file" class="form-control" name="icon" /><br>
                                    </div>


                                </form>

                                <input type="button" class="btn btn-success" onclick="go()" value="Add" />

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div class="col-sm-12">





            <!-- Modal -->

            <div id="myModal1" class="modal fade" role="dialog">

                <div class="modal-dialog">



                    <!-- Modal content-->

                    <div class="modal-content">

                        <div class="modal-header">

                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">Edit  categories</h4>

                        </div>

                        <div class="modal-body">



                            <form id="form2"  class="form-vertical"method="POST" enctype="multipart/form-data" >

                                <div class="form-group">

                                    <label>Enter  Category Name</label>

                                    <input type="text" class="form-control" name="category_name" id="ecategory_name"/>

                                </div>

                                <div class="form-group">

                                    <label> Category id</label>



                                    <h3> <label id="setide"></label></h3>

                                    <input type="hidden" name="ecategory_id" id="ecategory_id"/>



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

                            <input type="button" class="btn btn-success" value="Edit  Category " onclick="editdata()" />

                        </div>

                        <div class="modal-footer">

                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </div>

                    </div>



                </div>

            </div>

        </div>




        <div id="d1"></div>




    </body>
</html>
