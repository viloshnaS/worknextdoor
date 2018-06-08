<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$booking_id=$_GET['booking_id'];


cancelBooking($booking_id);

function createSpace($id){
	global $connection;

	$sql = "UPDATE booking 
	SET booking_status_type = 2
	WHERE booking_id=$id";
	$result = $connection->query($sql);


	if ($connection->query($sql) === TRUE) {
	    // output data of each row
	    echo "Booking Cancelled";
	} else {
	    echo "Error";
	}


}

?>