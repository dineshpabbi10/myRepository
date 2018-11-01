<%-- 
    Document   : EditStudent
    Created on : Mar 21, 2018, 1:36:21 PM
    Author     : Dell
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<a href="EditStudent.jsp"></a>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            int rollno = Integer.parseInt(request.getParameter("rollno"));
            
            String email="";
            int category_id;
            int marks=0;
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rishab_bookmyhelper_db", "root", "system");
            System.out.println("connection created successfully");
            Statement stmt = conn.createStatement();
            System.out.println("statement created successfully");
            ResultSet rs = stmt.executeQuery("select * from categories where category_id="+category_id);
            System.out.println("resultset created");
            if(rs.next())
            {
                 category_name= rs.getString("name");
                 email= rs.getString("email");
                 marks =rs.getInt("marks");
            }

        %>
        
        <form action="EditStudentLogic.jsp">
            
            <label>Rollno</label>
            <input type="text" value="<%= rollno %>" readonly name="rollno" /><br>
            
            <label>Name</label>
            <input type="text" value="<%= name %>" name="name" /><br>
            
            <label>Email</label>
            <input type="text" value="<%= email %>" name="email" /><br>
            
            <label>Marks</label>
            <input type="text" value="<%= marks %>" name="marks" /><br>
            
            <input type="submit" value="Save" class="btn btn-success" />
            <a href="FetchAllStudents.jsp" class="btn btn-danger"> Discard</a>
                
            
        </form>
        
        
        
        
    </body>
</html>
