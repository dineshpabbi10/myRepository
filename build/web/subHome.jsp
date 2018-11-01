
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
   
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
                        
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                              ans += "<td><input type='button' value=\""+js['category_name']+"\""+ " class='btn btn-success' onclick='viewsub(" + js["category_id"] + ")' /></td>";
                            
                          

                          
                           
                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./FetchDetailsOfCategories", true);
                xml.send();



            }
            
   function viewsub(category_id)
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
                        
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                      
                            ans += "<td>" + js["subcategory_name"] + "</td>";
                          

                          
                           
                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d2").innerHTML = ans;
                        }
                    };
                    xml.open("GET", "./getSubCategories?category_id=" + category_id, true);
                    xml.send();
                



            }

        </script>
    </head>
    
    <body onload="fetch()" background="pics/56.jpg" >
        <div >
            <div id="d1" class="col-sm-4"></div>
            <div id="d2"class="col-sm-8"></div>
            
        </div>
        <h1 ></h1>
    </body>
</html>
