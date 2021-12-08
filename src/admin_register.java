

import java.io.IOException;
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


@WebServlet("/admins/examples/admin_register")

public class admin_register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        long phn=0;
        String ph=request.getParameter("phone");
        if(ph != null)
        	phn=Long.parseLong(ph);
        String eml=request.getParameter("email");
        String pwd=request.getParameter("password");
    
           try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager  .getConnection("jdbc:mysql://localhost:3308/admin","root","sandeep123");  
            PreparedStatement pst=con.prepareStatement("insert into register(fname,lname,phone,email,password) values(?,?,?,?,?)");
                  pst.setString(1, fname);
                  pst.setString(2, lname);
                  pst.setLong(3, phn);
                  pst.setString(4, eml);
                  pst.setString(5, pwd);
                    
                  int res=pst.executeUpdate();
                  if(res>0){
                    response.sendRedirect(response.encodeURL("admin_login.jsp"));
                  }else{
                      HttpSession ses=request.getSession();
                      ses.setAttribute("errmsg", "Failed to register ...!");
                      response.sendRedirect(response.encodeURL("admin.jsp"));
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
