/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

/**
 *
 * @author DELL
 */
public class GiveRating extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String bookingid = request.getParameter("bookingid");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        try {
            String customermobile;
            String mid;
            String serviceid;

//            ResultSet rs1 = DBLoader.executeQuery("select * from booking where booking_id='" + bookingid+"'");
            ResultSet rs1 = DBLoader.executeQuery("select * from booking where booking_id=" + bookingid);
            if (rs1.next()) {
                customermobile = rs1.getString("customermobile");
                serviceid = rs1.getString("serviceid");
                mid = rs1.getString("mid");
                System.out.println("bid " + bookingid + "   rt " + rating + " cm " + comment + "  cmob " + customermobile + " sid " + serviceid + "mid " + mid);
                ResultSet rs = DBLoader.executeQuery("select * from rating where bookingid='" + bookingid + "' and customermobile='" + customermobile + "'");

                if (rs.next()) {
                    rs.updateString("bookingid", bookingid);
                    rs.updateString("rating", rating);
                    rs.updateString("comment", comment);
                    rs.updateString("customermobile", customermobile);
                    rs.updateString("serviceid", serviceid);
                    rs.updateString("mid", mid);
                    rs.updateRow();
                    out.println("success");
                } else {
                    rs.moveToInsertRow();
                    rs.updateString("bookingid", bookingid);
                    rs.updateString("rating", rating);
                    rs.updateString("comment", comment);
                    rs.updateString("customermobile", customermobile);
                    rs.updateString("serviceid", serviceid);
                    rs.updateString("mid", mid);
                    rs.insertRow();
                    out.println("success");
                }

            } else {
                out.println("fail");
            }

        } catch (Exception e) {
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
