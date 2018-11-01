
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.*;
import java.sql.*;
import java.util.Collection;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import vmm2.FileUploader;

@MultipartConfig
public class AdminAddService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String priceperhour = "";
            String dynamicprice = "";
            String fixedprice = "";
            String sid = request.getParameter("sid");
            String sertype = request.getParameter("sertype");
            String sername = request.getParameter("sername");
            String serdesc = request.getParameter("serdesc");
            priceperhour = request.getParameter("priceperhour");
            dynamicprice = request.getParameter("dynamicprice");
            fixedprice = request.getParameter("fixedprice");
        

            ResultSet rs = DBLoader.executeQuery("select * from services where  subcategory_id='" + sid + "' and service_name='" + sername + "' ");
            if (rs.next()) {
                out.println("failed");
            } else{
                Part part=request.getPart("icon");
               String absolutepath = request.getServletContext().getRealPath("/uploads");

               
                
                    String Filename = FileUploader.savefileonserver(part, absolutepath);

                    
                rs.moveToInsertRow();

                rs.updateString("service_name", sername);
                rs.updateString("servicedescription", serdesc);
                rs.updateString("servicetype", sertype);
                rs.updateString("priceperhour", priceperhour);
                rs.updateString("dynamicprice", dynamicprice);
                rs.updateString("fixedprice", fixedprice);
                rs.updateString("subcategory_id", sid);
rs.updateString("icon", "uploads/"+Filename);
                rs.insertRow();

                out.println("success");

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
