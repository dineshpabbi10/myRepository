
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class EditSubcategoryInfoCategory extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int subcategory_id = Integer.parseInt(request.getParameter("subcategory_id"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));
            String subcategory_name =request.getParameter("subcategory_name");
            String description=request.getParameter("description");
            String icon= request.getParameter("icon");

        try {

            ResultSet rs = DBLoader.executeQuery("select * from subcategories where subcategory_id=" + subcategory_id);
            if (rs.next()) {
                    rs.updateString("subcategory_name",subcategory_name);
                rs.updateString("description",description);
                rs.updateInt("category_id", category_id);
                rs.updateString("icon", icon);
                rs.updateRow();
                //response.sendRedirect("FetchAllStudents.jsp");  
            } else {
                out.println("subcategory not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
