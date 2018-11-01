
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;

public class bookservice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Date bdate = new java.sql.Date(System.currentTimeMillis());

            String serviceid = request.getParameter("serviceid");
            String customermobileno = request.getParameter("customermobileno");
            String address = request.getParameter("address");
            String servicedate = request.getParameter("servicedate");
            String time = request.getParameter("time");
            class merchantcount {

                int mid, count;

                merchantcount(int mid, int count) {
                    this.mid = mid;
                    this.count = count;
                }
            }
            ArrayList<merchantcount> al = new ArrayList<merchantcount>();
            ResultSet rs1 = DBLoader.executeQuery("select * from merchantservices where serviceid=" + serviceid);

            while (rs1.next()) {
                int mid = rs1.getInt("mid");
                ResultSet rs2;
                rs2 = DBLoader.executeQuery("select count(mid) from booking where serviceid=" + serviceid);
                if (rs2.next()) {
                    int count = rs2.getInt(1);
                    al.add(new merchantcount(mid, count));
                }
            }
            if (al.size() == 0) {
                out.println("no merchant");
            } else {
                int mid = al.get(0).mid;
                int mincount = al.get(0).count;
                for (merchantcount al1 : al) {
                    if (al1.count < mincount) {
                        mid = al1.mid;
                        mincount = al1.count;
                    }
                }
                ResultSet rs = DBLoader.executeQuery("select * from booking where customermobile='" + customermobileno + "'and serviceid='" + serviceid + "' order by booking_id desc");
                if (rs.next()) {
                    java.util.Date olddate = rs.getDate("servicedate");
                    System.out.println("date diff: " + olddate.compareTo(new SimpleDateFormat("yyyy-MM-dd").parse(servicedate)));

                    if (olddate.compareTo(new SimpleDateFormat("yyyy-MM-dd").parse(servicedate)) >= 0) {
                        out.println("fail");
                        return;
                    }
                }

                rs.moveToInsertRow();
                rs.updateString("customermobile", customermobileno);
                rs.updateString("address", address);
                rs.updateString("serviceid", serviceid);
                rs.updateString("time", time);
                rs.updateDate("bookingdate", bdate);
                rs.updateString("servicedate", servicedate);
                rs.updateInt("mid", mid);
                rs.updateString("status", "confirm");
                rs.insertRow();
                // out.println("success");

                ResultSet customerdetails = DBLoader.executeQuery("select * from customers where mobile=" + customermobileno);

                customerdetails.next();
                String custName = customerdetails.getString("name");

                ResultSet merchantdetails = DBLoader.executeQuery("select * from merchant_info where mid=" + mid);

                merchantdetails.next();
                String merchantContact = merchantdetails.getString("phoneno");
                String merchantName = merchantdetails.getString("name");
                String merchantEmail = merchantdetails.getString("email");

                String msg = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= You have a booking with following customer:" + custName + " on " + servicedate + " at time " + time + " address " + address + " contact :" + customermobileno + "&phone_numbers=" + merchantContact;
                msg = msg.replace(" ", "%20");
                System.out.println(msg);
                URL url = new URL(msg);

                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                if (connection.getResponseCode() == 200) {
                    System.out.println("msg sent to merchant");
                    //ResultSet rs4 = DBLoader.executeQuery("select * from customers where mobile='" + mobile + "'");
                } else {

                }

                String msg1 = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender?username=kirat&password=Y40VYIXH&message= Your booking has been confirmed and your helper details are :" + merchantName + "Email : " + merchantEmail + "contact : " + merchantContact + "&phone_numbers=" + customermobileno;
                msg1 = msg1.replace(" ", "%20");
                URL url2 = new URL(msg1);
                HttpURLConnection connection2 = (HttpURLConnection) url2.openConnection();

                if (connection2.getResponseCode() == 200) {
                    System.out.println("msg sent to customer");
                    //ResultSet rs4 = DBLoader.executeQuery("select * from customers where mobile='" + mobile + "'");
                } else {

                }

                String ans = new RDBMS_TO_JSON().generateJSON("select * from merchant_info where mid=" + mid);
                System.out.println(ans);
                out.println(ans);
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
