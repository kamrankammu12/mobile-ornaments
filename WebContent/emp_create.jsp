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
                    <li ><a href="index.phpl">Home</a></li>
                    <li><a href="index.php">About</a></li>
                    <li><a href="index.php">Services</a></li>
                    <li><a href="index.php">Departments</a></li>
                    <li><a href="index.php">Doctors</a></li>
                    <li><a href="index.php">Contact</a></li>
                    <li class="drop-down active"><a href="login.php">Login</a>
                        <ul>
                            
                            <li ><a href="login.php">Login</a>
                            <li><a href="#">Cart</a></li>
                            <li><a href="orders.php">Orders</a></li>

                    </li>

                </ul>



                </ul>
            </nav><!-- .nav-menu -->

            <a href="index.phpl" class="appointment-btn scrollto">Make an Appointment</a>

        </div>
    </header><!-- End Header -->
<br>
<br>
<br>
<br>
<br>
 
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container">
        <div class="row">

            <div class="col-md-6">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="bg">
                    
                    
          <form class="form" action="<?php $_SERVER['PHP_SELF'];?>" method="post">

        <b><label>Name:</label></b>
        <input class="form-control" type="text" name="name1" placeholder="Required" required>
        <hr>
        <b><label>User ID:</label></b>
        <input class="form-control" type="text" name="user_name1" placeholder="example@gmail.com" required>
        <hr>
    
        <b><label class="lable">Password:</label></b>
        <input class="form-control" type="password" name="password1" placeholder="Required" required>
              <hr>
              <b><label class="lable">Phone:</label></b>
        <input class="form-control" type="tel" name="phone" placeholder="+91" required>
               <hr>
              <b><label class="lable">City:</label></b>
        <input class="form-control" type="Text" name="address" placeholder="Eg: Delhi" required><hr>
              <b><label class="lable">Department:</label></b>
        <input class="form-control" type="Text" name="department" placeholder="Eg: Medical" required>
        
</br>
</br>
        <input class="btn btn-primary" type="submit" name ="submit" value="Create">


    </form>
                    <br>
                    </div>
            </div>
            </div>   
            <br><br>
                <br>
                <br>
                <div class="col-md-6">
            <h1 class="text-primary"> visudh <span class="text-danger">Ajivam</span></h1>
            <h2>We Provide You High
                Quaility Services</h2>
                <a href="login.php" class="btn-get-started scrollto">Already have an account</a>
    </div>
        </div>
    </section><!-- End Hero -->

    
             <?php

error_reporting(0);
$name = $_POST['name1'];
$user_name = $_POST['user_name1'];
$password = $_POST['password1'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$department = $_POST['department'];

 if(isset( $_POST['submit'] )) {
#connecting to database
$conn = mysqli_connect( "localhost", "root", "", "Database" ) or die( "conn lost" );
$sql = "INSERT INTO employee(name, user_name, password, phone, address, department) VALUES('{$name}','{$user_name}','{$password}','{$phone}','{$address}', '{$department}')";
$result = mysqli_query( $conn, $sql ) or die( "db lost" );

 }

#$db = "SELECT* FROM table2";
#$check=mysqli_query($conn, $db) or die("lost check");
#while($table=mysqli_fetch_assoc($check)){
 #   if($user_name==$table['user_name'] || $phone==$table['phone']){
        #echo"<script> alert('welcome')</script>";
  #  }
    

?> 

         
         
 

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