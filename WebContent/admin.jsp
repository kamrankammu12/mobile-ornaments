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
            <!-- <a href="index.php" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

            <nav class="nav-menu d-none d-lg-block">
                <ul>
                    <li class="active"><a href="index.php">Home</a></li>
                    <li><a href="index.php">About</a></li>
                    <li><a href="index.php">Services</a></li>
                    <li><a href="index.php">Departments</a></li>
                    <li><a href="index.php">Doctors</a></li>
                    <li><a href="index.php">Contact</a></li>
                    <li class="drop-down"><a href="login.php">Login</a>
                        <ul>
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
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container">
        
            <br>
            <h1 class="text-primary">Admin panel visudh <span class="text-danger">Ajivam</span></h1>
 
                <a href="create.html" class="btn-get-started scrollto">go to home</a>
        </div>
    </section><!-- End Hero -->

    <!-- php starts here-->
         <!-- creating the view table-->
        <?php
$conn = mysqli_connect("localhost", "root", "", "Database") or die("connection lost");
$sql = "SELECT * FROM table2";
$res = mysqli_query($conn,$sql);
 


?>

         
         
 <div class="container">
    <div class="row">
            <div class="col-md-12">
                <div class="bg">
                    
                    
        <form >
            <div class="form-group">
                 <h2 class="text-center text-primary"><i class="fas fa-user-circle" style="font-size: 1em; color:blueviolet"></i>  Admin </h2>
                
                               <br>
                <table>
                <thead>
                    <th>Sl</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                    <?php   while($result=mysqli_fetch_assoc($res)){ ?>
                    <tbody>
                    <td><?php echo $result['id'];?></td>
                    <td><?php echo $result['user_name'];?></td>
                    <td><?php echo $result['name'];?></td>
                    <td><?php echo $result['password'];?></td>
                        <td><a href="#">Edit</a></td>
                        <td><a href="#">Delete</a></td>
                    </tbody>
                    <?php }?>
                </table>
            </div>
                </form>
                    <br>
                    </div>
            </div>
            </div>   
    </div>

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