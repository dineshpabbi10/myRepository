
import java.io.IOException;

import java.io.PrintWriter;

import java.sql.ResultSet;

import java.sql.ResultSetMetaData;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import org.json.simple.JSONObject;

import vmm.DBLoader;

import vmm.RDBMS_TO_JSON;

public class FetchMerchantRating extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();

            ResultSet rs = DBLoader.executeQuery("select * from merchant_info");

            JSONArray jsonArray = new JSONArray();

            while (rs.next()) {

                int mid = rs.getInt("mid");

                ResultSet rs2 = DBLoader.executeQuery("SELECT avg(rating) as avgrating,merchant_info.* from rating,merchant_info where merchant_info.mid=rating.mid and rating.mid=" + mid);

                ResultSetMetaData rsmd = rs2.getMetaData();

                int n = rsmd.getColumnCount();

                if (rs2.next()) {

                    //Create object for single row 
                    JSONObject singlerow = new JSONObject();

                    for (int j = 1; j <= n; j++) {

                        String clname = rsmd.getColumnLabel(j);

                        //System.out.println(clname);
                        //Fill data in Single Row Object
                        singlerow.put(clname, rs2.getString(clname));

                    }

                    //Add single object in array
                    jsonArray.add(singlerow);

                } else {

                    ResultSetMetaData rsmd2 = rs.getMetaData();

                    int n2 = rsmd2.getColumnCount();

                    //Create object for single row 
                    JSONObject singlerow = new JSONObject();

                    for (int j = 1; j <= n2; j++) {

                        String clname = rsmd2.getColumnLabel(j);

                        //System.out.println(clname);
                        //Fill data in Single Row Object
                        singlerow.put(clname, rs.getString(clname));

                    }

                    singlerow.put("avgrating", "0");

                    //Add single object in array
                    jsonArray.add(singlerow);

                }

            }

            JSONObject mainjson = new JSONObject();

            mainjson.put("ans", jsonArray);

            System.out.println(mainjson);

            out.println(mainjson);

        } catch (Exception ex) {

            Logger.getLogger(FetchMerchantRating.class.getName()).log(Level.SEVERE, null, ex);

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
