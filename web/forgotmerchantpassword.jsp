<%-- 
    Document   : forgotpassword
    Created on : Apr 9, 2018, 12:45:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>
            function go2()
            {
                
                var email=document.getElementById("email").value;
                var mobilenumber=document.getElementById("mobilenumber").value;
                   
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            //if (res == "success")
                            //{
                                   

                              //  alert("password recover");
                            //}
                           // alert(res);
                        }
                           // else
                            //{
                              //  alert("invalid email or mobilenumber");
                            //}
                       

                    };
                    xmlhttp.open("GET", "./MerchantRecoverPass?email=" + email + "&mobilenumber=" + mobilenumber, true);
                    xmlhttp.send();
                } 

            
            
            
            </script>
        
        
        
        
    </head>
    <body style="background-color: #66ffff">
        <div class="container">
            <form class="form-group">
                <div>
                    
        <label style="color:red">Email</label><br>
        <input  type="text" class="form-control" id="email"/><br>
                </div>
                <div>
      
          <label style="color:red" >Mobile  Number</label><br>
        <input type="text" class="form-control" id="mobilenumber"/><br>
                </div>
       <!-- <input type="button" value="Recover Password" onclick="go2()"/> 
       -->
        <button type="button" class="btn btn-primary" onclick="go2()">Recover Password</button>
            </form>
        </div>
    </body>
</html>
