import java.io.FileOutputStream;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/admins/examples/cart_update")
@MultipartConfig 
public class cart_update extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses=request.getSession();
       int pid=Integer.parseInt(request.getParameter("pid"));
       String prodnm=request.getParameter("pname");
       String prodcat=request.getParameter("cat");
       int quantity=Integer.parseInt(request.getParameter("qty"));
       float price=Float.parseFloat(request.getParameter("price"));
       Part file = request.getPart("img");
       
       String img_file_name = file.getSubmittedFileName();
       String upload_path= "E:/Desk top/centum learnings/eclipse practice/mobile-ornaments/WebContent/assets/" + img_file_name;
       
       try 
       {
       FileOutputStream fos =new  FileOutputStream(upload_path);
       InputStream is = file.getInputStream();
       
       byte[] data = new byte[is.available()];
       is.read(data);
       fos.write(data);
       fos.close();
       } 
       catch(Exception g)
       {
       	g.printStackTrace();
       }
       
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/admin","root","sandeep123"); 
           PreparedStatement pst=con.prepareStatement("update products set product_name=?, product_category=?, quantity=?, price=?, images=? where product_id=?");
           
           
           pst.setString(1,prodnm);
           pst.setString(2, prodcat);
           pst.setInt(3, quantity);
           pst.setFloat(4, price);
           pst.setString(5, img_file_name);
           pst.setInt(6, pid);
          
           
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
