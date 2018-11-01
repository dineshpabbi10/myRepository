<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int rollno = Integer.parseInt(request.getParameter("rollno"));
            String name =request.getParameter("name");
            String email=request.getParameter("email");
            int marks= Integer.parseInt(request.getParameter("marks"));
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/university", "root", "system");
            System.out.println("connection created successfully");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created successfully");
            ResultSet rs = stmt.executeQuery("select * from students where rollno="+rollno);
            System.out.println("resultset created");
            if(rs.next())
            {
                rs.updateString("name",name);
                rs.updateString("email",email);
                rs.updateInt("marks", marks);
                rs.updateRow();
                response.sendRedirect("FetchAllStudents.jsp");                
            }
            
            %>
    </body>
</html>
