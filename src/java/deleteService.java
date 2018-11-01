
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import java.sql.ResultSet;

public class deleteService extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        try (PrintWriter out = response.getWriter()) {
             
            String service_id=request.getParameter("service_id");
                  
                   
                   
              ResultSet rs= DBLoader.executeQuery("select * from services where service_id='" + service_id + "'  ");
                    
                   if(rs.next())
                   {
                     rs.deleteRow();
                     out.println("success");
                     
                   }
                   
                   else
                   {
                    out.println("category not found");
                   }
                    
                } catch (Exception e) 
                {
                    e.printStackTrace();
                    
                }
        
        
        
        
           }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
}
