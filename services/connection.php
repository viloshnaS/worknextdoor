<?php
$servername = "aa1p9k6ystiyzrk.crxzahhqojwg.us-east-2.rds.amazonaws.com";
$port ="3306";
$username = "root";
$password = "wnd-team";
$db="innodb";

$conn= mysqli_connect($servername, $username, $password, $db, $port);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>