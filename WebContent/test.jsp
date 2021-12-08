<?php
$conn = mysqli_connect( "localhost", "root", "", "Database" ) or die( "conn lost" );
       
$sql2 = "SELECT * FROM table2";
$result = mysqli_query( $conn, $sql2 ) or die( "db lost" );
        
     echo mysqli_num_rows($result);
?>