<?php 
$conn = mysqli_connect("localhost", "root", "", "Database") or die("connection lost");
error_reporting(0);
$id = $_GET['id'];
$sql = "SELECT * FROM employee WHERE id = {$id}";
$res = mysqli_query($conn,$sql)or die("sql lost");
while($table=mysqli_fetch_assoc($res)){
    if(mysqli_num_rows($res)>0){
         
     
$id = $table['id'];
$name = $table['name'];
$user_name = $table['user_name'];
$password = $table['password'];
$address = $table['address'];
$phone = $table['phone'];
$status = $table['status'];
#connecting to database
$conn = mysqli_connect( "localhost", "root", "", "Database" ) or die( "conn lost" );
$sql2 = "INSERT INTO aproval(id, name, user_name, password,phone, address, status) VALUES('{$id}','{$name}','{$user_name}','{$password}','{$phone}','{$address}','{$status}')";
$result = mysqli_query( $conn, $sql2 ) or die( "Already Aproved" );

    }
    header("Location:employee.php");
}

?>