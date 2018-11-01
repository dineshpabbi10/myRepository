/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class MerchantSignupServlet2 extends HttpServlet {

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
            Part part1 = request.getPart("photo");

            Part part2 = request.getPart("proof");
            String ans = "";
            String absolutepath = request.getServletContext().getRealPath("/uploads");
            System.out.println(absolutepath);

            String newfilename_photo = new Date().getTime() + ".jpg";

            FileUploader.savefileonserver(part1, absolutepath, newfilename_photo);

            String newfilename_proof = new Date().getTime() + ".jpg";

            FileUploader.savefileonserver(part2, absolutepath, newfilename_proof);

            String phoneno = request.getParameter("phoneNo");
            String starttime = request.getParameter("starttime");
            String endtime = request.getParameter("endtime");

            HttpSession session = request.getSession();
            String merchantemail = (String) session.getAttribute("merchantemail");
            ResultSet rs = DBLoader.executeQuery("select * from merchant_info where email='" + merchantemail + "'");
            if (rs.next()) {
                session.setAttribute("mid", rs.getInt("mid"));
                rs.updateString("phoneno", phoneno);
                rs.updateString("starttime", starttime);
                rs.updateString("endtime", endtime);

                rs.updateString("photo", "uploads/" + newfilename_photo);
                rs.updateString("proof", "uploads/" + newfilename_proof);
                rs.updateString("signup", "complete");
                rs.updateRow();
                out.println("success");
            }
        } catch (Exception ex) {
            Logger.getLogger(MerchantSignupServlet2.class.getName()).log(Level.SEVERE, null, ex);
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
