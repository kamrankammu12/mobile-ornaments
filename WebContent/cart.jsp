<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Mobile Ornaments</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
   
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

    <!--  CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

   
</head>

<body>
 
    <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
        <div class="container d-flex">
            <div class="contact-info mr-auto">

            </div>
            <div class="social-links">

            </div>
        </div>
    </div>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
        <div class="container d-flex align-items-center">

            <h1 class="logo mr-auto"><a href="index.jsp"><span class="text-primary">Mobile</span> <span class="text-danger">Ornaments</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            <h2 class="text-primary"> Cart</h2>
            

        </div>
    </header><!-- End Header -->
     <br><br><br><br><br>
    <!-- ====== cart ====== -->

     <div class="container">
  
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th class="align-items-center">PRODUCT NAME</th>
        <th class="align-items-center">COST</th>
        <th class="align-items-center">QUANTITY</th>
        <th class="align-items-center">TOTAL</th>
        <th class="align-items-center"> ACTION</th>
        <th class="align-items-center"> CHECK OUT </th>
      </tr>
    </thead>
    <%
                     int pid1=0;
                     String p=request.getParameter("pid");
                     //session.setAttribute("pids", p)
                     if(p!= null)
                   	 pid1=Integer.parseInt(p);
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/admin","root","sandeep123");  
                            PreparedStatement stmt=con.prepareStatement("select * from products where product_id=?");
                            stmt.setInt(1,pid1);
                            ResultSet rs=stmt.executeQuery();
                            rs.next();
                            out.println("<form action='Update' role='form' method='post' enctype='multipart/form-data'>");
    out.println("<tbody>");
    out.println("<tr>");
        
    out.println("<td class='align-items-center'>" + rs.getString(2)+"</td>");
    out.println("<td class='align-items-center'>" + rs.getInt(5)+"</td>");
    out.println("<td class='align-items-center'><input type='number' value='"+rs.getInt(4)+"'></td>");
    out.println("<td class='align-items-center'>" + "500" + "</td>");
    out.println("<td class='align-items-center'> <a href='#' class='appointment-btn scrollto text-center'>DELETE</a></td>");
    out.println("<td class='align-items-center'> <a href='#' class='appointment-btn scrollto text-center'>CHECK OUT</a></td>");
    out.println("</tr>");
    out.println("<tr >");
    
    out.println("</tbody>");
                        
                    }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                %>
  </table>
  </div>
     
     </div>
   
     <!--   
        <td class="align-items-center ">Samsung</td>
        <td class="align-items-center">23,999/-</td>
        <td class="align-items-center"><input type="number"></td>
        <td class="align-items-center">23,999/-</td>
        <td class="align-items-center"> <a href="#" class="appointment-btn scrollto text-center">DELETE</a></td>
        <td class="align-items-center"> <a href="#" class="appointment-btn scrollto text-center">CHECK OUT</a></td>
      </tr>
      <tr >
        
        <td class="align-items-center ">Samsung</td>
        <td class="align-items-center">23,999/-</td>
        <td class="align-items-center"><input type="number"></td>
        <td class="align-items-center">23,999/-</td>
        <td class="align-items-center"> <a href="#" class="appointment-btn scrollto text-center">DELETE</a></td>
        <td class="align-items-center"> <a href="#" class="appointment-btn scrollto text-center">CHECK OUT</a></td>
      </tr>
     -->
      

  

        <div class="container d-md-flex py-4">

            <div class="mr-md-auto text-center text-md-left">
                <div class="copyright">
                    &copy; Copyright <strong><span class="text-primary">Mobile</span><span class="text-danger">Ornaments</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="https://bootstrapmade.com/">G.Sandeep Kumar and Team</a>
                </div>
            </div>
            <div class="social-links text-center text-md-right pt-3 pt-md-0">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
        </div>
    </footer class="mt-50"><!-- End Footer -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/venobox/venobox.min.js"></script>
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counterup/counterup.min.js"></script>
    <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>


    <script src="assets/js/main.js"></script>

</body>

</html>