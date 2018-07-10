<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    echo hostGetSpaceById($space_id);
    
 }

function hostGetSpaceById($id){
	global $connection;
	$sql = "SELECT * FROM spaces where space_id=$id";
	$rows= array();
	$result = $connection->query($sql);
	if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
		return json_encode($row);
				
	} 

	return "";
		
}

<<<<<<< HEAD
//echo hostGetSpaceById(2);
=======

>>>>>>> 8725eef47e7533a0ddb89db80b5f17d7f712822e
?>