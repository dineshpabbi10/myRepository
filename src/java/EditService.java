
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
public class EditService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String priceperhour = "";
            String dynamicprice = "";
            String fixedprice = "";
            int service_id = Integer.parseInt(request.getParameter("serviceidedit"));
           
            String sertype = request.getParameter("sertypeedit");
            String sername = request.getParameter("sernameedit");
            String serdesc = request.getParameter("serdescedit");
            priceperhour = request.getParameter("priceperhouredit");
            dynamicprice = request.getParameter("dynamicpriceedit");
            fixedprice = request.getParameter("fixedpriceedit");
            if(sertype.equals("Fixed Price Service")){
                dynamicprice="";
                priceperhour="";
            }
            else if(sertype.equals("Price per Hour Service")){
                dynamicprice="";
                fixedprice="";
            }
            else if(sertype.equals("Dynamic Price Service")){
                fixedprice="";
                priceperhour="";
            }

            ResultSet rs = DBLoader.executeQuery("select * from services where service_id='" + service_id + "'  ");
            if (rs.next()) {
                
                  Part part=request.getPart("icon2");
                  if(part!=null)
                  {
               String absolutepath = request.getServletContext().getRealPath("/uploads");

               
                
                    String Filename = FileUploader.savefileonserver(part, absolutepath);
                     rs.updateString("icon", "uploads/"+Filename);
                  }
                rs.updateString("service_name", sername);
                rs.updateString("servicedescription", serdesc);
                rs.updateString("servicetype", sertype);
                rs.updateString("priceperhour", priceperhour);
                rs.updateString("dynamicprice", dynamicprice);
                rs.updateString("fixedprice", fixedprice);
             

                rs.updateRow();

                out.println("success");
            
            } else {
    out.println("failed");

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
