 <!--booststrap-->
 <%
    if(session.getAttribute("merchantemail")==null)
    {
        %>
        <script>
            window.location.href=""LoginHomeMerchant.jsp"";
            </script>
        <%
    }
    
    %>
 
 
 
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
                        <!--<li><a class="page-scroll" href="HomePage.jsp">Home</a></li>-->
                        <li><a class="page-scroll scroll" href="merchantHome.jsp">Home</a></li>
                        <li><a class="page-scroll scroll" href="MerchantServiceSelect.jsp">Select Services</a></li>
                        <li><a class="page-scroll scroll" href="merchantBookings.jsp">My Bookings</a></li>
                        <li><a class="page-scroll scroll" href="MerchantEdit.jsp">Edit Profile</a></li>
                        <li><a class="page-scroll scroll" href="ChangeMerchantPassword.jsp">Change Password</a></li>
                         <li><a class="page-scroll scroll" href="./MerchantLogout">Logout</a></li>
                     
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>  
        </div>	
        <!-- //header -->