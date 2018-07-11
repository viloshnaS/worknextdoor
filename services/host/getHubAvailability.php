<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;


$hub_id=$_GET['hub_id'];



echo get_dates($hub_id);

function get_dates($hub_id){

	global $connection;


	$sql = "SELECT * FROM hub_availability where hub_id=$hub_id";



	$result = $connection->query($sql);

	$result_list = array();

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $result_list[] = $row;
	    }

	    return json_encode($result_list);
	        
	}

	else{
		return "";
	}

	
}

?>