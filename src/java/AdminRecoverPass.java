

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;


public class AdminRecoverPass extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String email=request.getParameter("email");
        String mobilenumber=request.getParameter("mobilenumber");
        
        try
        {
        ResultSet rs=DBLoader.executeQuery("select * from administrator where email='" + email + "' and mobilenumber= '" + mobilenumber + "'");
        
        if(rs.next())
        {
            String password=rs.getString("password");
            out.println(password);
            String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= your password is"+password+"&phone_numbers=" + mobilenumber;

                    msg = msg.replace(" ", "%20");

                    URL url = new URL(msg);

                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                  out.println("password sent");
            
        }
        else
        {
            out.println("fail");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
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
