 <!--booststrap-->

 
 
 
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" >
        <!--//booststrap end-->

        <!-- font-awesome icons -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />

        <!-- //font-awesome icons -->
        <!--stylesheets-->
        <link href="css/style_1.css" rel='stylesheet' type='text/css' media="all">
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" /><!-- //pop-ups-->
        <!--<link href="css/lsb.css" rel="stylesheet" type="text/css"> gallery lsb-->

        <link href="//fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">
        <!--//style sheet end here-->
                <script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
                
        <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>	


<div class="header-w3layouts" > 
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-fixed-top top-nav-collapse">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="index.html">Easy<span>Help</span>
                        </a></h1>
                </div> 
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden"><a class="page-scroll" href="#page-top"></a>	</li>
                        <li><a class="page-scroll" href="HomePage.jsp">Home</a></li>
                        <li><a class="page-scroll scroll" href="HomePage.jsp#about">About</a></li>
                        <li><a class="page-scroll scroll" href="HomePage.jsp#features">Features</a></li>
                        <li><a class="page-scroll scroll" href="HomePage.jsp#categories">Categories</a></li>
                        <!--<li><a class="page-scroll scroll" href="HomePage.jsp#merchants">Merchants</a></li>-->
                        <li><a class="page-scroll scroll" href="HomePage.jsp#contact">Contact</a></li>
                            <% if (session.getAttribute("useremail") != null) {
                            %>
                        <!--<li><a class="page-scroll scroll" href="#"></a></li>-->
                        <li class="dropdown">

                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=session.getAttribute("username")%><span class="caret"></span></a>
                            <ul class="dropdown-menu">

                                <li><a href="./CustomerLogout"  >Logout<span class="glyphicon glyphicon-briefcase"></span></a></li>
                                <li><a href="CustomerChangePassword.jsp" >Change Password<span class="glyphicon glyphicon-user"></span></a></li>
                                <li><a href="customerBookingsHistory.jsp" >My Bookings<span class="glyphicon glyphicon-user"></span></a></li>


                            </ul>
                        </li>


                        <%
                        } else {
                        %>


                        <li id="logincheck"><a class="page-scroll scroll" data-toggle="modal" data-target="#myModal">LogIn</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>  
        </div>	
        <!-- //header -->