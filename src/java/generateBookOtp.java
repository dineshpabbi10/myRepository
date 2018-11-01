
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
import java.text.SimpleDateFormat;

public class generateBookOtp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String opr = request.getParameter("opr");

            System.out.println("opr " + opr);

            if (opr.equals("sendotp")) {

                String bookingid = request.getParameter("bookingid");

                ResultSet rs = DBLoader.executeQuery("select * from booking where booking_id='" + bookingid + "'");

                if (rs.next()) {

                    java.util.Date olddate = rs.getDate("servicedate");

                    if (olddate.compareTo(new java.util.Date()) < 0) {

                        String mobile = rs.getString("customermobile");

                        int otp = (int) (1 + (99999 - 1) * Math.random());

                        String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message=otp for service completion confirmation is -" + otp + "&phone_numbers=" + mobile;

                        msg = msg.replace(" ", "%20");

                        URL url = new URL(msg);

                        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                        if (connection.getResponseCode() == 200) {

                            System.out.println("message sent");

                            rs.updateString("otp", otp + "");

                            rs.updateRow();

                            out.println("success");

                        }
                    } else {
                        out.println("fail");
                    }

                }

            } else if (opr.equals("verify")) {

                String cotp = request.getParameter("otp");

                String bookingid = request.getParameter("bookingid");

                ResultSet rs = DBLoader.executeQuery("select * from booking where booking_id='" + bookingid + "'");

                if (rs.next()) {

                    String otp = rs.getString("otp");

                    if (otp.equals(cotp)) {

                        out.println("verified");

                        rs.updateString("status", "complete");

                        rs.updateRow();

                    } else {

                        out.println("failed");

                    }

                }

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
