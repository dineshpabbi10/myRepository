
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class DeleteCategoryInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int category_id = Integer.parseInt(request.getParameter("category_id"));

        try {

            ResultSet rs = DBLoader.executeQuery("select * from categories where category_id=" + category_id);
            if (rs.next()) {
                    rs.deleteRow();
                    out.println("category deleted successfully");
            } else {
                out.println("category not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
