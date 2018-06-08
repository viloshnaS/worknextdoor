<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

$date_from=$_POST['date_from'];
$date_to=$_POST['date_to'];
$space_id=$_POST['space_id'];
$user_id=$_POST['user_id']; 
$space_rate=$_POST['space_rate'];
$duration=$_POST['duration'];
$unit_price=$_POST['unit_price'];

createBooking($space_id,$user_id,$date_from,$date_to, $duration,$space_rate,$unit_price);

function createBooking($space_id,$user_id,$date_from,$date_to, $duration,$space_rate,$unit_price){
	global $connection;

	$sql = "INSERT INTO booking(user_id,space_id, booking_date_start,booking_date_end, duration, rate, unit_price,booking_status_type)
	VALUES($space_id,$user_id,STR_TO_DATE('$date_from', '%Y-%m-%d %T'),STR_TO_DATE('$date_to', '%Y-%m-%d %T'),$duration,$space_rate,$unit_price,3)";
	echo $sql;
	$result = $connection->query($sql);


	if ($connection->query($sql) === TRUE) {
	    // output data of each row
	    echo "New record created successfully";
	} else {
	    echo "Error";
	}

}

?>