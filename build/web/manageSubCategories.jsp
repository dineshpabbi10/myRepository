<%-- 
    Document   : manageSubCategories
    Created on : Apr 11, 2018, 10:28:15 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

       


        <script>


            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

               // alert("File name: " + firstfile.name);
                      //alert("File size: " + firstfile.size);

                reader.onload = (function (f)
                {
                    return function read(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    };
                })(firstfile);

                reader.readAsDataURL(firstfile);
            }







            function go()
            {
                alert("called");
                //var category_id=document.getElementById("s1").value;
                //document.getElementById("l1").innerHTML=category_id;
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();
                        //document.getElementById("res").innerHTML = res;
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];

                        var ans = "";
                        ans += "<option  value='-1'>--Select--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<option  value='" + js["category_id"] + "'  >" + js["category_name"] + "</option>";
                        }
                        document.getElementById("s1").innerHTML = ans;

                    }
                };
                xml.open("GET", "./subcategoryManage", true);
                xml.send();
            }

            function go1()
            {
                alert("called");

                var category_id = document.getElementById("s1").value;
                //document.getElementById("l1").innerHTML = category_id;
                document.getElementById("category_id").value = category_id;

                var subcategory_id = document.getElementById("s1").value;


                if (subcategory_id == '-1')
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
                           // document.getElementById("l2").innerHTML = res;

                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];
//                            var ans1="";
//ans1+="<h1>Already Added Sub-Categories</h1>";

                            var ans = "";


                            ans += "<table class='table table-hover'>";

                            ans += "<thead class='bg-primary'>";
                            ans += "<tr> <td>Subcategory_id</td> <td>Subcategory_name</td> <td>Description</td><td>Category_id</td><td>Icon</td><td>Edit</td><td>Delete</td></tr>";
                            ans += "</thead>";

                            ans += "<tbody>";


                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<tr>";
                                ans += "<td>" + js["subcategory_id"] + "</td>";
                                ans += "<td>" + js["subcategory_name"] + "</td>";
                                ans += "<td>" + js["description"] + "</td>";
                                ans += "<td>" + js["category_id"] + "</td>";
                                //  ans += "<td>" + js["email"] + "</td>";
                                ans += "<td><img src='" + js["icon"] + "' width='100' height='100' /></td>";
                                 ans += "<td><input type='button' value='Edit' class='btn btn-success'data-toggle='modal' data-target='#myModal1' onclick='EditSubcategory(" + js["subcategory_id"] + ")' /></td>";
                                ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["subcategory_id"] + ")' /></td>";


                                ans += "</tr>";

                            }
                            ans += "</tbody>";
                            ans += "</table>";

                            document.getElementById("d1").innerHTML = ans;







                            ans += "<option value='-1'>--Select--</option>";
                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<option value='" + js["subcategory_id"] + "'  >" + js["subcategory_name"] + "</option>";
                            }


                            //document.getElementById("s2").innerHTML = ans;



                        }
                    };
                    xml.open("GET", "./fetchCategories?category_id=" + subcategory_id, true);
                    xml.send();



                }



            }



            function addSubCategory()
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
                    //alert(ans);
                    //alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./SubcategoryUploader", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                           // alert(xhr.responseText);


                        }
                    };
                    xhr.send(formdata);
                }
            }







            function del(subcategory_id)
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
                          //  alert(res);

                        }
                    };
                    xml.open("GET", "DeleteSubcategoryInfoServlet?subcategory_id=" + subcategory_id, true);
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

                            //alert(res);
                            go1();
                        }
                    };

                    xhr.send(formdata);
                } 
                
                
            }




        </script>





    </head>
    <body onload="go()">
         <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>

        <div class="container"style="margin-top: 80px">


            <!--<button type="button" onclick="go()"> fetch Categories </button>-->

            <label id="res" ></label> <br>

            <label>Select Categories </label>
            <select id="s1" onchange="go1()">

            </select>

            <hr>
            
            <h1>Already Added Subcategories</h1>

            <label id="l2"></label>

            <!--<label>Select Subcategories</label>-->
            <!--<select id="s2">-->

            <!--</select>-->

            <div id="d1"></div>




            <!-- <div class="jumbotron"> -->
            <!--<h1>Bootstrap Modal</h1> -->
        </div>

        <div class="row">
            <div class="col-sm-12">



                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add New Subcategory</button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">User Login</h4>
                            </div>
                            <div class="modal-body">
                                <form id ="form1" class="form-vertical" method="POST" enctype="multipart/form-data"> 
                                    <div class="form-group">
                                        <label>Enter Subcategory Name</label>
                                        <input id="subcategory" type="text" class="form-control" name="subcategory_name" />
                                    </div>
                                    <div class="form-group">
                                        <label>Enter Category id</label>
                                        <!--<input type="text" class="form-control" name="category_id"/>-->
                                        <label id="l1"></label>
                                        <input type="hidden" name="category_id" id="category_id"/>

                                    </div>

                                    <div class="form-group">
                                        <label>Enter Description</label>
                                        <textarea id="description" row="4" cols="50" name="description"></textarea>
                                    </div> <br>

                                    <div class="form-group">
                                        <label>Select Icon</label>


                                        <input id="photo" type="file" class="form-control" name="icon" onchange="readandpreview(this, 'im1')" /><br>
                                    </div>
                                    <div class="form-group">
                                        <label>preview</label>
                                        <img src=""id="im1"style="width:100px;height:100px">
                                    </div>


                                </form>

                                <input type="button" class="btn btn-success" onclick="addSubCategory()" value="Add" />

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
   <div id="d2"> </div>
   
   
   


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
                                    <input type="file" class="form-control" name="icon" style="width:200px;height:200px" onchange="readandpreview(this, 'im2')"/>
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
