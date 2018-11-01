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
    </head>
    <body style="background: url('images/back10.jpg');height: 580px">
       
        <jsp:include page="AdminLogoutNavbar.jsp"></jsp:include>
        
          <%
              HttpSession session2=request.getSession();
          
          String adminemail=session2.getAttribute("adminemail").toString();
          
          %>
    <centre> <h1 style="margin-top: 80px;margin-left: 200px;color:red"><b>Welcome Admin:<u> <%= adminemail%></u></b></h1></centre>
          
    <br>
    <br>
    <br>
    
    <h2 style="color:#ff3333;margin-left: 200px;color:red"><b>What do you want to do ?</b></h2>
          <br>
          <br>
          <br>
          <br>
          
          <h2 style="margin-left: 480px;color:red"><b>1..Merchant Options :</b></h2>
         
           <a href="AdminApproveMerchant.jsp" class="btn btn-primary" style="margin-left: 920px;padding-right: 40px;text-align: center" >Merchant Approve<span class="glyphicon glyphicon-user"></span></a>
           <br>
           <br> 
           <a href="ReviewMerchants.jsp" class="btn btn-primary" style="margin-left: 920px;padding-right: 50px;text-align: center" >Merchant Review<span class="glyphicon glyphicon-user"></span></a>   
              

           <br>
           <br>

           <h2 style="margin-left: 490px;color:red"><b>2..Manage Options :</b></h2>
        
            
              <a href="addServiceCategories.jsp" class="btn btn-primary" style="margin-left: 920px;padding-right: 40px;text-align:center" >Manage Categories<span class="glyphicon glyphicon-briefcase"></span></a>
              <br>
              <br>
            <a href="manageSubCategories.jsp" class="btn btn-primary" style="margin-left: 920px;text-align: center" >Manage SubCategories<span class="glyphicon glyphicon-briefcase"></span></a>
            
            <br>
              <br>
            <a href="manageservices.jsp" class="btn btn-primary" style="margin-left: 920px;padding-right: 60px;text-align: center" >Manage Services<span class="glyphicon glyphicon-briefcase"></span></a>

            <div class="container" >
          
            <!--<img src="images/back9.jpg" style="height:100%;width:100%" background-size:cover/>-->
            
<!--            <a class="page-scroll scroll btn btn-default" href="ChangeMerchantPassword.jsp">Change Password</a>
            <a class="page-scroll scroll btn btn-default" href="./AdminLogout">Logout</a></li>

        <a href="AdminApproveMerchant.jsp" class="btn btn-warning" style="color:#333333" >Merchant Approve<span class="glyphicon glyphicon-user"></span></a>
            <a href="ReviewMerchants.jsp" class="btn btn-primary" style="color:#000033" >Merchant Review<span class="glyphicon glyphicon-user"></span></a>


            <a href="addServiceCategories.jsp" class="btn btn-primary" style="color:#333333" >Manage Categories<span class="glyphicon glyphicon-briefcase"></span></a>
            <a href="manageSubCategories.jsp" class="btn btn-danger" style="color:#000033" >Manage SubCategories<span class="glyphicon glyphicon-briefcase"></span></a>
            <a href="manageservices.jsp" class="btn btn-warning" style="color:#000033" >Manage Services<span class="glyphicon glyphicon-briefcase"></span></a>-->



        </div>




    </body>
</html>
