<?php
$id = $_GET['id'];
$conn = mysqli_connect( "localhost", "root", "", "Database" ) or die( "conn lost" );
 
$sql4 ="DELETE FROM aproval WHERE id = {$id}";
 
$result2 = mysqli_query( $conn, $sql4 ) or die( "db lost" );
header("location:http://localhost/visudh/admins/examples/aproval.php");
?>