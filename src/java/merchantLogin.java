
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vmm.DBLoader;

public class merchantLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String merchantemail = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println(merchantemail);
        System.out.println(password);

        try {

            ResultSet rs = DBLoader.executeQuery("select * from merchant_info where email='" + merchantemail + "' and password = '" + password + "'");

            if (rs.next()) {
                if (rs.getString("signup").equals("pending")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("merchantemail", merchantemail);
                    session.setAttribute("mid", rs.getInt("mid"));
                    out.println("signup");
                } else {
                    if (rs.getString("status").equals("Pending")) {
                        out.println("Pending");
                    } else if (rs.getString("status").equals("BLOCK")) {
                        out.println("block");
                    } else {
                        out.println("success");
                        HttpSession session = request.getSession();
                        session.setAttribute("merchantemail", merchantemail);
                        session.setAttribute("mid", rs.getInt("mid"));
                    }
                }
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
