
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

@MultipartConfig
public class MerchantSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String myemail = request.getParameter("email");

        try {
            ResultSet rs = DBLoader.executeQuery("select * from merchant_info where email='" + myemail + "'");
            if (rs.next()) {
                out.println("already exists");
            } else {
                
                String merchantemail = request.getParameter("email");

                String password = request.getParameter("password");
                String name = request.getParameter("name");
                
                // int marks = Integer.parseInt(request.getParameter("marks"));
                rs.moveToInsertRow();

                rs.updateString("email", merchantemail);
                rs.updateString("password", password);
                rs.updateString("name", name);
                 HttpSession session = request.getSession();
                        session.setAttribute("merchantemail", merchantemail);
                rs.insertRow();

                out.println("success");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
