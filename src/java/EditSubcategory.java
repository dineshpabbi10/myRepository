
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

@MultipartConfig
public class EditSubcategory extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
        PrintWriter out = response.getWriter();
        int subcategory_id = Integer.parseInt(request.getParameter("esubcategory_id"));
        

        
            ResultSet rs = DBLoader.executeQuery("select * from subcategories where subcategory_id=" + subcategory_id);
            if (rs.next()) {
                Part part = request.getPart("icon");

                String absolutepath = request.getServletContext().getRealPath("/uploads");

                String subcategory_name = request.getParameter("subcategory_name");
                String description = request.getParameter("description");

                String photoname = FileUploader.savefileonserver(part, absolutepath);

                rs.updateString("subcategory_name", subcategory_name);
                rs.updateString("description", description);

                rs.updateString("icon", "uploads/" + photoname);
                rs.updateRow();

                out.println("success");

            } else {

                out.println("failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
