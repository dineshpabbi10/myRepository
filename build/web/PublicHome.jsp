

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        
        
        
        
        <title>JSP Page</title>
    </head>
    <body>
        <div>
        <nav class="navbar navbar-inverse">

            <div class="container-fluid" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                                                
                    </button>
                    <a  class="navbar-brand" href="#"> bahadur Chand Electronics </a>
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
                        
                        <li><input type="search" placeholder=" search here " padding="10px"/></li>
                        <li><input type="button" value=" search "/></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Sign Up<span class="glyphicon glyphicon-user"></span> </a></li>
                        <li><a href="adminLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        </div>
        <!-- Data Area -->
        <div class="container" style="background-image: url(designpics/carp1.jpg); ">
            <div class="row"><h2>Electronics</h2></div>
            <div class="row">
                
                
                <div class="col-sm-3"> <img src="designpics/carp1.jpg" alt="" style="width: 150px;height: 150px"/> </div>

                 <div class="col-sm-3">  <img src="designpics/carp1.jpg" alt=""style="width: 150px;height: 150px"/></div>
        
                  <div class="col-sm-3">  <img src="designpics/carp1.jpg" alt=""style="width: 150px;height: 150px"/></div>
                   <div class="col-sm-3"> <img src="designpics/carp1.jpg" alt=""style="width: 150px;height: 150px"/> </div>
            </div>
              <div class="row"><h2>Repairs</h2></div>
            <div class="row">
                
                
                <div class="col-sm-3">      <img src="designpics/carp1.jpg" alt="" style="width: 150px;height: 150px"/></div>
         
                 <div class="col-sm-3">       <img src="designpics/elect1.jpg" alt="" style="width: 150px;height: 150px"/></div>
                  <div class="col-sm-3">        <img src="designpics/plum1.jpg" alt="" style="width: 150px;height: 150px"/>  </div>
           
                   <div class="col-sm-3">      <img src="designpics/mob1.jpg" alt="" style="width: 150px;height: 150px"/>  </div>
                   
              
            </div>
                <div class="row"><h2>Home Furnishing and Interiors</h2></div>
            <div class="row">
                
                
                <div class="col-sm-3">           <img src="designpics/arch1.jpg" alt="" style="width: 150px;height: 150px"/>  </div>
        
                 <div class="col-sm-3">            <img src="designpics/int1.jpg" alt="" style="width: 150px;height: 150px"/> </div>
                
               
                 <div class="col-sm-3">  <img src="designpics/paint1.jpg" alt=""style="width: 150px;height: 150px"/></div>
                   
           
                 <div class="col-sm-3">      <img src="designpics/cons1.jpg" alt=""style="width: 150px;height: 150px"/></div>
            </div>
        </div> 
        <div class=""></div>
    </body>
</html>
