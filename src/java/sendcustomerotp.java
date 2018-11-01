
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.*;
import java.sql.*;

public class sendcustomerotp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String opr = request.getParameter("opr");
            System.out.println("opr " + opr);

            if (opr.equals("sendotp")) {
                String mobile = request.getParameter("mobile");
                System.out.println("mobile " + mobile);
                int otp = (int) (1 + (99999 - 1) * Math.random());
                URL url = new URL("http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message=" + otp + "&phone_numbers=" + mobile);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                if (connection.getResponseCode() == 200) {
                    ResultSet rs = DBLoader.executeQuery("select * from customers where mobile='" + mobile + "'");
                    if (rs.next()) {

                        rs.updateString("otp", otp + "");
                        rs.updateRow();
                        out.println("alreadyexist");
                        System.out.println(otp);
                    } else {

                        HttpSession session = request.getSession();
                        session.setAttribute("cotp", otp);
                        out.println("notexist");
                    }
                }
            } else if (opr.equals("verify")) {
                String alreadyexist = request.getParameter("alreadyexist");
                String cotp = request.getParameter("otp");
                String mobile = request.getParameter("mobile");
                System.out.println("ax " + alreadyexist + " cotp " + cotp + " mobile " + mobile);
                if (alreadyexist.equals("true")) {
                    System.out.println("ture enterd");
                    ResultSet rs = DBLoader.executeQuery("select * from customers where mobile='" + mobile + "'");
                    if (rs.next()) {
                        String otp = rs.getString("otp");
                        if (otp.equals(cotp)) {

                            HttpSession session = request.getSession();
                            session.setAttribute("useremail", rs.getString("email"));
                            session.setAttribute("usermobile", mobile);
                            session.setAttribute("username", rs.getString("name"));
                            out.println("verified");
                        } else {
                            out.println("failed");
                        }
                    }
                } else if (alreadyexist.equals("false")) {
                    HttpSession session = request.getSession();
                    String otpsent = session.getAttribute("cotp").toString();
                    if (otpsent.equals(cotp)) {
                        out.println("verified");
                    } else {
                        out.println("failed");
                    }
                }

            } else if (opr.equals("signup")) {
                String customeremail = request.getParameter("email");
                String name = request.getParameter("name");
                String mobile = request.getParameter("mobile");
                String password = request.getParameter("password");

                ResultSet rs = DBLoader.executeQuery("select * from customers where email='" + customeremail + "'");
                if (!rs.next()) {
                    rs.moveToInsertRow();
                    rs.updateString("name", name);
                    rs.updateString("email", customeremail);
                    rs.updateString("mobile", mobile);
                    rs.updateString("password", password);
                    rs.insertRow();

                    HttpSession session = request.getSession();
                    session.setAttribute("useremail", customeremail);
                    session.setAttribute("usermobile", mobile);
                    session.setAttribute("username", name);

                    out.println(name);
                } else {
                    out.println("failed");
                }
            } else if (opr.equals("loginusingpassword")) {
                String mobile = request.getParameter("mobile");
                String password = request.getParameter("password");
                ResultSet rs = DBLoader.executeQuery("select * from customers where mobile='" + mobile + "' and password='" + password + "'");

                if (rs.next()) {

                    String customeremail = rs.getString("email");
                    String name = rs.getString("name");
                    HttpSession session = request.getSession();
                    session.setAttribute("useremail", customeremail);
                    session.setAttribute("usermobile", mobile);
                    session.setAttribute("username", name);

                    out.println(name);
                } else {
                    out.println("failed");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
