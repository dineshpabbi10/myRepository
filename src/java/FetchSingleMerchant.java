import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import vmm.RDBMS_TO_JSON;



public class FetchSingleMerchant extends HttpServlet {



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        response.setContentType("text/html");

        

        PrintWriter out = response.getWriter();

        

       HttpSession session = request.getSession();

               int mid= (int)session.getAttribute("mid");

               System.out.println(mid);

       

        String mainjson = new RDBMS_TO_JSON().generateJSON("select * from merchant_info where mid="+ mid);

        

        out.println(mainjson);

        

        

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