
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.RDBMS_TO_JSON;

public class getServices extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String subcategory_id = request.getParameter("subcategory_id");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from services where subcategory_id='" + subcategory_id + "'");

        out.println(ans);

    }

}
