<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('../pricing/getPricing.php');
$connection = $conn;



$user_id=$_GET['user_id'];


getBookingById($booking_id);

function getBookingByUser($id){
	global $connection;

	// number of guest is 1 by default

	$sql = "SELECT * from v_booking
	WHERE user_id= $id
	ORDER BY booking_date DESC";
	
	$result = $connection->query($sql);

	$rows=array();


	if ($result->num_rows > 0) {
	    // output data of each 
	
	    while($row = $result->fetch_assoc()) {
	    	$rows[] = $row;
	    }

	} else {
	    echo "0 results";
	}

	return json_encode($rows);

}
?>


