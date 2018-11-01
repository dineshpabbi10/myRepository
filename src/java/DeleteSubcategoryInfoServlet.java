
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class DeleteSubcategoryInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int subcategory_id = Integer.parseInt(request.getParameter("subcategory_id"));

        try {

            ResultSet rs = DBLoader.executeQuery("select * from subcategories where subcategory_id=" + subcategory_id);
            if (rs.next()) {
                    rs.deleteRow();
                    out.println("subcategory deleted successfully");
            } else {
                out.println("subcategory not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
