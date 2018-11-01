
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.RDBMS_TO_JSON;
import java.sql.*;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

public class showservicesformerchantselect extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String sid = request.getParameter("subcategory_id");
            HttpSession session=request.getSession();
             String merchantemail= session.getAttribute("merchantemail").toString();
     ResultSet rs=DBLoader.executeQuery("select * from merchant_info where email='"+merchantemail+"'");
     String mid="";
     if(rs.next()){
         mid=rs.getString("mid");
     }
            JSONObject ansobject = new JSONObject();

            JSONArray jsonArray = new JSONArray();

            ansobject.put("ans", jsonArray);

            ResultSet rs1 = DBLoader.executeQuery("select * from services where subcategory_id='" + sid + "'");
            while(rs1.next()){
                String serviceid=rs1.getString("service_id");
                String sername=rs1.getString("service_name");
                String status="false";
                ResultSet rs2=DBLoader.executeQuery("select * from merchantservices where serviceid='"+serviceid+"' and mid='"+mid+"'");
                if(rs2.next()){
                    status="true";
                }
                 JSONObject singlerow = new JSONObject();
                 singlerow.put("service_id", serviceid);
                 singlerow.put("service_name", sername);
                 singlerow.put("status", status);
                  jsonArray.add(singlerow);
            }
            out.println(ansobject.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
