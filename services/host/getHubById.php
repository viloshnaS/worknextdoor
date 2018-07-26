<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
require('../pricing/getSpacePricing.php');
$connection = $conn;

if(isset($_GET['hub_id']) && !empty($_GET['hub_id'])) {
    $hub_id = $_GET['hub_id'];
    echo getHubById($hub_id);
    
 }

function getHubById($id){
	global $connection;
	$sql = "SELECT * FROM hubs where hub_id=$id";
	$rows= array();
	$result = $connection->query($sql);
	if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
		return json_encode($row);
				
	} 

	return "";
		
}

//echo getHubById(2);
?>