<%-- 
    Document   : MerchantSignup
    Created on : Apr 12, 2018, 10:07:52 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>

        <script>
            function login() {
                $("#myModal").modal('show');
            }


            function go()
            {
                var password=document.getElementById("password").value;
                   var confirmpassword=document.getElementById("confirmpassword").value;
                   if(password=="")
                   {
                       alert("enter password");
                   }
                   else if(confirmpassword=="")
                   {
                       alert("enter confirm password");
                   }
                   else if(confirmpassword!=password)
                   {
                       alert("password and confirmpassword do not match");
                   }
                   else
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

                    xhr.open("POST", "./MerchantSignupServlet", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            alert(xhr.responseText);
                            //fetch();

                        }
                    };
                    xhr.send(formdata);
                }
            }

            }




        </script>


    </head>
    <body>

        <div class="container">



            <div class="row">
                <div class="col-sm-12">



                    <button type="button" class="btn btn-info btn-lg" onclick="login()" >Click Here To Sign-up</button>

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
                                    <form id="form1">
                                        <div class="form-group">
                                            <label>Enter Email</label>
                                            <input type="email" placeholder="enter email" class="form-control" name="email" id="email" />
                                        </div>

                                        <div class="form-group">
                                            <label>Enter Password</label>
                                            <input type="password" placeholder="enter password" class="form-control" name="password" id="password" />
                                        </div>

                                        <div class="form-group">
                                            <label> Confirm Password</label>
                                            <input type="password" placeholder="Confirm password" class="form-control" name="confirmpassword" id="confirmpassword" />
                                        </div>
                                        

                                        <div class="form-group">
                                            <label>Enter Name</label>
                                            <input type="text" placeholder="enter name" class="form-control" name="name" id="name" />
                                        </div>


                                        <div class="form-group">
                                            <label>Enter PhoneNo</label>
                                            <input type="text" placeholder="enter phoneNo" class="form-control" name="phoneNo" id="phoneNo" />
                                        </div>



                                        <div class="form-group">
                                            <label>Select Photo</label>
                                            <input id="photo" type="file" class="form-control" name="photo" /><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Select Id-Proof</label>
                                            <input id="proof" type="file" class="form-control" name="proof" /><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Enter Start-Time</label>
                                            <input type="time" placeholder="enter start-time" class="form-control" name="starttime" id="startTime" />
                                        </div>



                                        <div class="form-group">
                                            <label>Enter End-Time</label>
                                            <input type="time" placeholder="enter end-time" class="form-control" name="endtime" id="endTime" />
                                        </div>


                                        <br>

                                        <!-- <div class="form-group" > 
                                              <a href="forgotpassword.jsp" class="form-control btn btn-success">forgot password</a>
                                          </div>-->

                                    </form>

                                    <input type="button" class="btn btn-success" onclick="go()"value="Submit" /><br>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>





            </div>

    </body>
</html>
