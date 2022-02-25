

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


@WebServlet("/admins/examples/add_product")
@MultipartConfig 
public class add_product extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            Connection con=DriverManager  .getConnection("jdbc:mysql://localhost:3308/admin","root","sandeep123");  
            PreparedStatement pst=con.prepareStatement("insert into products(product_id,product_name,product_category,quantity,price,images) values(?,?,?,?,?,?)");
                  
                  pst.setInt(1, pid);
                  pst.setString(2, prodnm);
                  pst.setString(3, prodcat);
                  pst.setInt(4, quantity);
                  pst.setFloat(5, price);
                  pst.setString(6, img_file_name);
                  
                    
                  int res=pst.executeUpdate();
                  if(res>0){
                    response.sendRedirect(response.encodeURL("stock.jsp"));
                  }else{
                      HttpSession ses=request.getSession();
                      ses.setAttribute("errmsg", "Failed to add the product ...!");
                      response.sendRedirect(response.encodeURL("add_product.jsp"));
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
