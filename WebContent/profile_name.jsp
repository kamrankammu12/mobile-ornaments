<?php
error_reporting( 0 );
session_start();
if ( isset( $_SESSION["name"] ) ) {
    echo $_SESSION["name"];

} else {
    echo "Login";
}
?>