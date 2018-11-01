<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>

        <script>

            function go()

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



                    xhr.open("POST", "./MerchantEditData", true);

                    //for response receiving

                    xhr.onreadystatechange = function ()

                    {

                        if (xhr.readyState === 4 && xhr.status == 200)

                        {

                            var res = xhr.responseText.trim();

                            alert(res);

                            //if (res == 'success')

                            //  {

                            // alert('category Added Successfully');



                            if (res === "success")

                            {

                               alert("done");
                               window.location.href="merchantHome.jsp";

                            }



                            //   } else

                            // {

                            //alert("name already exists");

                            //    }



                        }

                    };



                    xhr.send(formdata);

                }





            }

        </script>

    </head>

    <body>
 <jsp:include page="MerchantLogoutNavbar.jsp"/>
        <div class="container">

            <div class="page-header">

                <h1>Edit  Your profile</h1>

            </div>



            <form class="form-horizontal" id="form1">

                <div class="form-group">

                    <label class="col-sm-4">Enter Mobile Number</label>

                    <div class="col-sm-8"><input type="text" class="form-control"name="mobileno" placeholder="Mobile Number"></div>

                </div>

                <div class="form-group">

                    <label class="col-sm-4">Enter Start Time</label>

                    <div class="col-sm-8"><input type="time" class="form-control" name="starttime"></div>

                </div>

                <div class="form-group">

                    <label class="col-sm-4">Enter End Time</label>

                    <div class="col-sm-8"><input type="time" class="form-control" name="endtime"></div>

                </div>

                <div class="form-group">

                    <label class="col-sm-4">Upload photo</label>

                    <div class="col-sm-8"><input type="file" class="form-control" name="photo"></div>

                </div>

              



            </form>

            <div class="form-group">

                <div class="col-sm-offset-4 col-sm-2"><input type="button" value="Submit" onclick="go()" class="form-control btn btn-success"></div>

            </div>

        </div>

    </body>

</html>