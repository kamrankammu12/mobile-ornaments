
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/admins/examples/Update")
@MultipartConfig 
public class Update extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses=request.getSession();
       int pid=Integer.parseInt(request.getParameter("pid"));
       String prodnm=request.getParameter("pname");
       String prodcat=request.getParameter("cat");
       int quantity=Integer.parseInt(request.getParameter("qty"));
       float price=Float.parseFloat(request.getParameter("price"));
       
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/admin","root","sandeep123"); 
           PreparedStatement pst=con.prepareStatement("update products set product_name=?, product_category=?, quantity=?, price=? where product_id=?");
           
           
           pst.setString(1,prodnm);
           pst.setString(2, prodcat);
           pst.setInt(3, quantity);
           pst.setFloat(4, price);
           pst.setInt(5, pid);
          
           
           int rs=pst.executeUpdate();
           if(rs>0){
               ses.setAttribute("prod_up_msg","Product updated successfully...!");
               response.sendRedirect(response.encodeRedirectURL("stock.jsp"));
           }
           else{
                ses.setAttribute("prod_up_msg", quantity);
               
                response.sendRedirect(response.encodeRedirectURL("product.jsp"));
           }
       }catch(Exception e){
           e.printStackTrace();
       }
       }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
