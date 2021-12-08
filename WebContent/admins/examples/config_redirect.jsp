<?php 
session_start();

if(!isset($_SESSION["name"]))
   {
header("Location:http://localhost:/visudh/login.php");
}
?>