<?php
$id = $_GET['id'];
$conn = mysqli_connect( "localhost", "root", "", "Database" ) or die( "conn lost" );
$sql2 ="DELETE FROM table2 WHERE id = {$id}";
$sql3 ="DELETE FROM employee WHERE id = {$id}";
$sql4 ="DELETE FROM employee WHERE id = {$id}";
$result = mysqli_query( $conn, $sql2 ) or die( "db lost" );
$result1 = mysqli_query( $conn, $sql3 ) or die( "db lost" );
$result2 = mysqli_query( $conn, $sql4 ) or die( "db lost" );
header("location:http://localhost/visudh/admins/examples/User-data.php");
?>