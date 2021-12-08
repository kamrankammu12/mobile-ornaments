

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admins/examples/login")

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
       response.setContentType("text/html;charset=UTF-8");
       String em=request.getParameter("user_name");
       String pw=request.getParameter("password");
       
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/user","root","sandeep123");
           PreparedStatement pst=con.prepareStatement("select password from register where email=?");
           pst.setString(1, em);
           ResultSet rs=pst.executeQuery();
           if(!rs.next()){
               ses.setAttribute("valerrmsg","Email does not exists...!...Try again....");
               response.sendRedirect(response.encodeRedirectURL("user_login.jsp"));
           }
           else{
               if(rs.getString("password").equals(pw)){
                 ses.setAttribute("user_name",em);
                 response.sendRedirect(response.encodeRedirectURL("/mobile-ornaments/orders.jsp"));  
               }
               else{
                  ses.setAttribute("valerrmsg","Invalid password.....!Try again.....");
                  response.sendRedirect(response.encodeRedirectURL("user_login.jsp"));  
               }
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
