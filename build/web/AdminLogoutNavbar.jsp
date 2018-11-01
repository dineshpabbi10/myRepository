<%
    if(session.getAttribute("adminemail")==null)
    {
        %>
        <script>
            window.location.href="LoginHomeAdmin.jsp";
            </script>
        <%
    }
    
    %>

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


<div class="header-w3layouts"  > 
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
                <li><a class="page-scroll" href="adminhome.jsp">Home</a></li>
                <li class="dropdown">

                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage<span class="caret"></span></a>
                    <ul class="dropdown-menu">

                        <li><a href="addServiceCategories.jsp" class="" style="color:#000033" >Manage Categories<span class="glyphicon glyphicon-briefcase"></span></a></li>
                        <li><a href="manageSubCategories.jsp" class="" style="color:#000033" >Manage SubCategories<span class="glyphicon glyphicon-briefcase"></span></a></li>
                        <li><a href="manageservices.jsp" class="" style="color:#000033" >Manage Services<span class="glyphicon glyphicon-briefcase"></span></a></li>

                    </ul>
                </li>
                <li class="dropdown">

                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Merchant Options <span class="caret"></span></a>
                    <ul class="dropdown-menu">

                        <li><a href="AdminApproveMerchant.jsp" class="" style="color:#000033" >Merchant Approve<span class="glyphicon glyphicon-user"></span></a></li>
                        <li><a href="ReviewMerchants.jsp" class="" style="color:#000033" >Merchant Review<span class="glyphicon glyphicon-user"></span></a></li>


                    </ul>
                </li>
                <li><a class="page-scroll scroll" href="ChangePassword.jsp">Change Password</a></li>
                <li><a class="page-scroll scroll" href="./AdminLogout">Logout</a></li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>  
</div>	
<!-- //header -->