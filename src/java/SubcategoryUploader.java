
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
public class SubcategoryUploader extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("subcategory_name");
        System.out.println(name);
        try {
            ResultSet rs = DBLoader.executeQuery("select * from subcategories where subcategory_name='" + name + "'");
            if (rs.next()) {
                out.println("already exists");
            } else {
                Part part = request.getPart("icon");
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/uploads");
                System.out.println(absolutepath);

                String newfilename = new Date().getTime() + ".jpg";
                 FileUploader.savefileonserver(part, absolutepath, newfilename);
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                String category_name = request.getParameter("subcategory_name");
                String description = request.getParameter("description");
                // int marks = Integer.parseInt(request.getParameter("marks"));
                System.out.println(category_id);
                rs.moveToInsertRow();

                rs.updateInt("category_id", category_id);
                rs.updateString("subcategory_name", name);
                rs.updateString("description", description);

                rs.updateString("icon", "uploads/" + newfilename);
                rs.insertRow();

                out.println("success");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
