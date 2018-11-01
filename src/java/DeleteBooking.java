import java.io.IOException;

import java.io.PrintWriter;

import java.sql.ResultSet;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import vmm.DBLoader;



public class DeleteBooking extends HttpServlet {



    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();



        int bookingid= Integer.parseInt(request.getParameter("bookingid"));



        try {



            ResultSet rs = DBLoader.executeQuery("select * from booking where booking_id=" + bookingid);

            if (rs.next()) {
                

                    rs.deleteRow();

                    out.println("booking canceled");

            } else {

                out.println("booking not found");

            }



        } catch (Exception e) {

            e.printStackTrace();

        }



    }



}