<%-- 
    Document   : MerchantSignup2
    Created on : May 18, 2018, 4:05:56 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
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

                    xhr.open("POST", "./MerchantSignupServlet2", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status === 200)
                        {
                            alert(xhr.responseText);
                            if(xhr.responseText.trim()==="success")
                            {
                                alert("your application is under process, once you are verified you will get a message");
                                window.location.href="LoginHomeMerchant.jsp";
                            }

                        }
                    };
                    xhr.send(formdata);
                }
            }

            

            
            </script>
        
    </head>
    <body style="background: url('images/Background13.jpg');height: 580px">
        <div class="container">
            <div class="page-header">
                 <h1>Complete your signup</h1>
                 
                 
        </div>
            <form class="form-horizontal" id="form1">
                <div class="form-group">
                <label class="col-sm-4">Mobile-No</label>
                <div class="col-sm-8"><input type="text" class="form-control" name="phoneNo"/>                
                </div>
                </div>
                
                 <div class="form-group">
                <label class="col-sm-4">Enter Start-Time</label>
                <div class="col-sm-8"><input type="time" class="form-control" name="starttime"/>                
                </div>
                </div>
                
                 <div class="form-group">
                <label class="col-sm-4">Enter End-Time</label>
                <div class="col-sm-8"><input type="time" class="form-control" name="endtime"/>                
                </div>
                </div>
                
                 <div class="form-group">
                <label class="col-sm-4">Photo</label>
                <div class="col-sm-8"><input type="file" class="form-control" name="photo"/>                
                </div>
                </div>
                
                 <div class="form-group">
                <label class="col-sm-4">ID-Proof</label>
                <div class="col-sm-8"><input type="file" class="form-control" name="proof"/>                
                </div>
                </div>
                
            </form>
            
              <div class="form-group">
               
                  <div class="col-sm-offset-4 col-sm-2"><input type="button" value="Submit" class="form-control btn btn-default" onclick="go()"></div>
                </div>
        </div>
        
    </body>
</html>
