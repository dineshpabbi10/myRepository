
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

public class AdminMerchantReview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String status = request.getParameter("status");

            String mid = request.getParameter("mid");

            ResultSet rs;

            rs = DBLoader.executeQuery("select * from merchant_info where mid=" + mid);

            if (rs.next()) {

                if (status.equals("Warning")) {

                    String mobile = rs.getString("phoneno");

                    String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= Improve your service ratings  &phone_numbers=" + mobile;

                    msg = msg.replace(" ", "%20");

                    URL url = new URL(msg);

                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                    if (connection.getResponseCode() == 200) {

                        System.out.println("message sent");

                    }

                    out.println("success");

                } else if (status.equals("BLOCK")) {

                    String mobile = rs.getString("phoneno");

                    String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= You are no longer eligible to provide services on our platform due to consistent bad performance  &phone_numbers=" + mobile;

                    msg = msg.replace(" ", "%20");

                    URL url = new URL(msg);

                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                    if (connection.getResponseCode() == 200) {

                        System.out.println("message sent");

                    }

                }

                rs.updateString("status", status);

                rs.updateRow();

                //out.println("successfully blocked");

            } else {

                out.println("fail");

            }

        } catch (Exception ex) {

            ex.printStackTrace();

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

}
