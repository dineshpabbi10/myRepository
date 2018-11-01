<%-- 
    Document   : adminhome
    Created on : Apr 8, 2018, 11:08:32 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body>
        <%
            
        String customeremail=session.getAttribute("useremail").toString();
        %>
    
        
        <div>
        <nav class="navbar navbar-inverse">

            <div class="container-fluid" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                                                
                    </button>
                    <a  class="navbar-brand" href="#" style="color: white">Welcome <%=customeremail%> </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li class="dropdown">
                           <!-- <a class="dropdown-toggle" data-toggle="dropdown" href="#">Settings <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                
                                <li><a href="welcome.jsp">   My Profile</a></li>
                                <li><a href="#">Logout</a></li>
                            </ul>-->
                        </li>
                        
                       <!-- <li><input type="search" placeholder=" search here " padding="10px"/></li>
                        <li><input type="button" value=" search "/></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li> <a href="#" class="btn btn-primary " style="color:white">Change Password<span class="glyphicon glyphicon-user"></span> </a></li>
                            <li> <a href="customerBookingsHistory.jsp" class="btn btn-primary " style="color:white">View My Services<span class="glyphicon glyphicon-user"></span> </a></li>
                     <!--   <li> <a href="addServiceCategories.jsp" class="btn btn-primary" style="color:white">Manage Category<span class="glyphicon glyphicon-briefcase"></span></a></li>
                     -->

                    </ul>
                </div>
            </div>
        </nav>
        </div>
        
        
        
        
    </body>
</html>
