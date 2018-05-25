<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;
$id=$_GET['user_id'];
$host=$_GET['host'];

enableHost($id,$host);

function enableHost($id,$host){
	global $connection;

	$sql = "UPDATE users
	set host=1
	WHERE user_id=$id";
	$result = $connection->query($sql);


	if ($connection->query($sql) === TRUE) {
	    // output data of each row
	    echo "User updated successfully";
	} else {
	    echo "Error";
	}
	print json_encode($rows);


}



?>