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



public class billpay extends HttpServlet {



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

           

           

                String bookingid = request.getParameter("bookingid");

                ResultSet rs = DBLoader.executeQuery("select * from booking where booking_id='" + bookingid + "'");

                if (rs.next()) {

                    

                    rs.updateString("status", "paid");

                      rs.updateRow();

                    String mobile = rs.getString("customermobile");

                    

                    String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= your bill for services is  paid succesfully&phone_numbers=" + mobile;

                    msg = msg.replace(" ", "%20");

                    URL url = new URL(msg);

                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();



                    if (connection.getResponseCode() == 200) {

                        System.out.println("message sent");

                       

                       

                        out.println("success");

                    }

                }

            

        }

             catch (Exception ex) {

            

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