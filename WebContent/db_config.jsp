<html>
<body>
	<center> 
		<h2> Form </h2>
	</center>

	<form  action="<?php $_SERVER['PHP_SELF'];?>" method="post">
         <label> name </label>
         <input type="text" name="name">
         <label> email </label>
         <input type="text" name="mail">
         <label> father name </label>
         <input type="text" name="father">
         <input type="submit" name="submit">



	</form>
</body>


	<?php
  // connect to database
   error_reporting(0);
  
$servername = "localhost";
$username = "root";
$password = "sandeep123";
$database ="sandeep";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

  if(isset( $_POST['submit'] ))
{
	 $name=$_POST['name'];
     $mail=$_POST['mail'];
     $father=$_POST['father'];


    $sql="insert into register(name,mail,father) values ('$name','$mail','$father')";
    $run = mysqli_query( $conn, $sql ) or die( " error :" . mysqli_error() );
    if($run)
    {
    	echo "form submitted";
    }else{
    	echo "form not submitted";
    }
}
  ?>