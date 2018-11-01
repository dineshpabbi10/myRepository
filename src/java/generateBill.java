
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

public class generateBill extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String value = request.getParameter("opr");
            System.out.println(value);

            String bookingid = request.getParameter("bookingid");

            ResultSet rs = DBLoader.executeQuery("select * from booking where booking_id='" + bookingid + "'");
            if (rs.next()) {
                rs.updateString("totalprice", value);

                rs.updateString("status", "billed");
                rs.updateRow();
            }
            String mobile = rs.getString("customermobile");

            String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message=you total bill is" + value + "&phone_numbers=" + mobile;
            msg = msg.replace(" ", "%20");
            URL url = new URL(msg);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            if(connection.getResponseCode()==200)
            {
                System.out.println("message sent");
                out.println("success");

        }
    }

    catch (Exception ex)

    
         {
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
