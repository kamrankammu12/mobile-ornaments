<?php
    include('db_config.php');
   $name1=$user_name1=$password=$phone=$address="";
   $errors=array("name1"=> "","user_name1"=>"","password"=>"","phone"=>"","address"=>"");
   if(isset($_POST['submit']))
   {     
       if(empty($_POST["name1"]))
       {
        $errors["name1"]="name is required.";
       }else{
         $name=$_POST["name1"];
         if(!preg_match('/^[a-zA-A\s]+$/', $name1)){
            $errors["name1"]="name must be in letters and spaces only";
         }
       }

       if(empty($_POST["user_name1"]))
       {
        $errors["user_name1"]="email is required.";
       }else{
         $user_name1=$_POST["user_name1"];
         if(!filter_var($user_name1, FILTER_VALIDATE_EMAIL)){
            $errors["user_name1"]="email must be a valid email address";
         }
       }
       if(empty($_POST["password"]))
       {
        $errors["password"]="password required";
       }else{
         $password=$_POST["password"];
         if (strlen($password) == '8') {
           $errors["password"] = "Your Password Must Contain At Least 8 Characters!";
        }
        elseif(!preg_match("#[0-9]+#",$password)) {
           $errors["password"] = "Your Password Must Contain At Least 1 Number!";
        }
        elseif(!preg_match("#[A-Z]+#",$password)) {
           $errors["password"]= "Your Password Must Contain At Least 1 Capital Letter!";
        }
        elseif(!preg_match("#[a-z]+#",$password)) {
            $errors["password"] = "Your Password Must Contain At Least 1 Lowercase Letter!";
        }
        }
        if(empty(htmlspecialchars($_POST["phone"])))
       {
        $errors["phone"]="number is required.";
       }else{
         $phone=htmlspecialchars($_POST["phone"]);
         if(strlen($phone)!=10){
            $errors["phone"]="number must be 10 digits";
         }
       }

       if(!preg_match("/[A-Za-z0-9\-\\,.]+/", $address)){
        $errors["address"] = 'Street address must be valid';
         }  
   }
  if(array_filter($errors))
  {
  }else{
    
  }
?>
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
                            <li><a href="cart.php">Cart</a></li>
                            <li><a href="orders.php">Orders</a></li>

                    </li>

                </ul>



                </ul>
            </nav><!-- .nav-menu -->

            <a href="index.phpl" class="appointment-btn scrollto">Make an Appointment</a>

        </div>
    </header><!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center ">
        <div class="container mt-50">
        <div class="row">

            <div class="col-md-6 mt-10">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="bg">
                   
          <form class="form" action="create.php" method="POST">

        <b><label>Name:</label></b>
        <input class="form-control" type="text" name="name1" value="<?php echo $name1 ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["name1"]; ?> </div>
        
        <hr>
        <b><label>User ID:</label></b>
        <input class="form-control" type="user_name1" name="user_name1" value="<?php echo $user_name1 ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["user_name1"]; ?> </div>
        <hr>
    
        <b><label class="lable">Password:</label></b>
        <input class="form-control" type="password" name="password" value="<?php echo $password ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["password"]; ?> </div>
              <hr>
              <b><label class="lable">Phone:</label></b>
        <input class="form-control" type="tel" name="phone" value="<?php echo $phone ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["phone"]; ?> </div>
               <hr>
              <b><label class="lable">City:</label></b>
        <input class="form-control" type="Text" name="address" value="<?php echo $address ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["address"]; ?> </div>
          <hr>
              <b><label class="lable">City:</label></b>
        <input class="form-control" type="Text" name="address" value="<?php echo $address ?>" placeholder="Required" required>
         <div class="text-danger"> <?php echo $errors["address"]; ?> </div>
</br>
</br>
        <input class="btn btn-primary" type="submit" name ="submit" value="Create">
    </form>
      <br>
  </div>
</div>
</div>   
            <br>
            <h1 class="text-primary"> visudh <span class="text-danger">Ajivam</span></h1>
            <h2>We Provide You High
                Quaility Services</h2>
                <a href="login.php" class="btn-get-started scrollto">Already have an account</a>
        </div>
    </section><!-- End Hero -->

    
            


         
         
 

   

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