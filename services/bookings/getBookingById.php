<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('../pricing/getPricing.php');
$connection = $conn;



$booking_id=$_GET['booking_id'];


getBookingById($booking_id);

function getBookingById($id){
	global $connection;

	// number of guest is 1 by default

	$sql = "SELECT * from v_booking
	WHERE booking_id= $booking_id";
	
	$result = $connection->query($sql);

	$result_string="";


	if ($result->num_rows > 0) {
	    // output data of each 
	
	    while($row = $result->fetch_assoc()) {
	    	$result_string = json_encode($row);
	    }

	} else {
	    echo "0 results";
	}

	return $result_string;

}
?>


