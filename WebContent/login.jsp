<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Visudh Ajivam</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/icon.png" rel="icon">
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

            <h1 class="logo mr-auto"><a href="index.php"><span class="text-primary">Visudh</span> <span class="text-danger">Ajivam</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.phpl" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

            <nav class="nav-menu d-none d-lg-block">
                <ul>
                    <li ><a href="index.php">Home</a></li>
                    <li><a href="index.php">About</a></li>
                    <li><a href="index.php">Services</a></li>
                    <li><a href="index.php">Departments</a></li>
                    <li><a href="index.php">Doctors</a></li>
                    <li><a href="index.php">Contact</a></li>
                    <li class="drop-down active"><a href="login.php">Login</a>
                        <ul>
                             
                            <li><a href="create.php">Sign up</a></li>
                            <li><a href="#">Cart</a></li>
                            <li><a href="orders.php">Orders</a></li>

                    </li>

                </ul>



                </ul>
            </nav><!-- .nav-menu -->

            <a href="index.php" class="appointment-btn scrollto">Make an Appointment</a>

        </div>
    </header><!-- End Header -->
    <br>
    <br>
    <br>
    <br>
    <br>
    
<?php
    if(isset($_POST['submit'])){
#connecting to database-----------------------------------------#
        
$conn = mysqli_connect( "localhost", "root", "sandeep123", "Database" ) or die( "conn lost" );
       error_reporting(0);
        #taking values from the inputs--------------------------------------------------------#
$name1 = $_POST['user_name'];
$pass = $_POST['password'];
$phone = $_POST['user_name'];
        #-------------------user query here----------------------------#
$sql2 = "SELECT id, name, user_name,address,phone   FROM table2 WHERE user_name = '{$name1}' AND password = '{$pass}' OR phone = '{$phone}' And password = '{$pass}'";
$result = mysqli_query( $conn, $sql2 ) or die( "db lost" );
        
     if(mysqli_num_rows($result) > 0){
     while ( $table = mysqli_fetch_assoc( $result ) )  {
         #session starts here-----------------------------#
    session_start();
         $_SESSION["name"] = $table['name'];
         $_SESSION["user_name"] = $table['user_name'];
         $_SESSION["id"] = $table['id'];  
         $_SESSION["phone"] = $table['phone'];  
         $_SESSION["address"] = $table['address'];  
         
 header("Location:Orders.php");# redirictibg to orders page for a normal users------------#
    } 
     
}else{
         #-------------------for Admin Dtabase only-----------------------------------------
         
        $sql_emp = "SELECT id, name, user_name, phone, address, department  FROM employee WHERE user_name = '{$name1}' AND password = '{$pass}' OR phone = '{$phone}' And password = '{$pass}'";
        $employee  = mysqli_query( $conn, $sql_emp ) or die( "db lost" );
        
    if(mysqli_num_rows($employee) > 0 )
    {
    while ( $emp_table = mysqli_fetch_assoc( $employee ) ){
               session_start();
         $_SESSION["name"] = $emp_table['name'];
         $_SESSION["id"] = $emp_table['id'];
         $_SESSION["user_name"] = $emp_table['user_name'];
         $_SESSION["address"] = $emp_table['address'];
         $_SESSION["phone"] = $emp_table['phone'];
         $_SESSION["department"] = $emp_table['department'];
         
      header("Location:admins/examples/dashboard.php");
    }
   }
    else{
        echo '<p class=" text-center alert alert-danger text-danger">Check the login details</p>';
    
 
    }
    }
  }
?>
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="bg">


                        <form class="form" action="<?php $_SERVER['PHP_SELF'];?>" method="post">

                            <b><label>User ID:</label></b>
                            <input class="form-control" type="text" name="user_name" placeholder="Email or phone" required>
                            <hr>

                            <b><label class="lable">Password:</label></b>
                            <input class="form-control" type="password" name="password" placeholder="Required" required>
                            </br>
                            </br>
                            <input class="btn btn-primary" type="submit" name="submit" value="Login">
    

                        </form>
  
                        <br>
                    </div>
                </div>
            </div>
            <br>
            <h1 class="text-light"> visudh <span class="text-danger">Ajivam</span></h1>
            <h2 class="text-light">We Provide You High
                Quaility Services</h2>
            <a href="create.php" class="btn-get-started scrollto">Create an account</a>
        </div>
    </section><!-- End Hero -->


    <!-- ======= Footer ======= -->
    <footer id="footer">

        <div class="footer-top">
            <div class="container">

            </div>
        </div>

        <div class="container d-md-flex py-4">

            <div class="mr-md-auto text-center text-md-left">
                <div class="copyright">
                    &copy; Copyright <strong><span class="text-primary">Visudh</span><span class="text-danger">Ajivam</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="https://bootstrapmade.com/">N.Abishek</a>
                </div>
            </div>

        </div>
    </footer><!-- End Footer -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


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