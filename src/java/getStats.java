/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.DBLoader;

/**
 *
 * @author DELL
 */
public class getStats extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int clientcount = 0, merchantcount = 0, servoffer = 0, servcomp = 0;

            ResultSet rs = DBLoader.executeQuery("select count(name) as clients from customers");
            if (rs.next()) {
                clientcount = rs.getInt("clients");
            }

            rs = DBLoader.executeQuery("select count(email) as merchants from merchant_info");
            if (rs.next()) {
                merchantcount = rs.getInt("merchants");
            }

            rs = DBLoader.executeQuery("select count(service_id) as serv from services");
            if (rs.next()) {
                servoffer = rs.getInt("serv");
            }

            rs = DBLoader.executeQuery("select count(booking_id) as book from booking where status='billed' or status='paid'");
            if (rs.next()) {
                servcomp = rs.getInt("book");
            }

            JSONObject obj = new JSONObject();

            obj.put("clients", clientcount);
            obj.put("merchants", merchantcount);
            obj.put("servicesoffered", servoffer);
            obj.put("servicescomp", servcomp);

            JSONArray jsa = new JSONArray();
            jsa.add(obj);

            JSONObject mainjson = new JSONObject();
            mainjson.put("ans", jsa);

            out.println(mainjson);
        } catch (Exception ex) {
            Logger.getLogger(getStats.class.getName()).log(Level.SEVERE, null, ex);
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
