
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vmm.DBLoader;

public class adminLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String adminemail = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println(adminemail);
        System.out.println(password);
        
        try {

            ResultSet rs = DBLoader.executeQuery("select * from administrator where email='" + adminemail + "' and password = '" + password + "'");
            if (rs.next()) 
            {
                out.println("success");
                HttpSession session=request.getSession();
                session.setAttribute("adminemail", adminemail);
                
                
            } else {
                out.println("failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
