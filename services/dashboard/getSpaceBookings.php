<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


function getSpaceBookings($id){
	global $connection;

	$sql= "SELECT s.space_name as space_name, COUNT(*) as num_bookings
	FROM booking b, spaces s
	WHERE s.space_id = b.space_id
	and s.hub_id = $id";
	

/*	if ($interval=='week') {  
	$sql = $sql . "AND b.booking_date_start BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";

	}


	if ($interval=='month') {  
	$sql = $sql . "AND b.booking_date_start BETWEEN NOW() - INTERVAL 30 DAY AND NOW()";
	}


	if ($interval=='year') {  
	$sql = $sql . "AND b.booking_date_start BETWEEN NOW() - INTERVAL 365 DAY AND NOW()";
	}*/

	$sql = $sql . " GROUP BY s.space_name";


	$result = $connection->query($sql);

	$rows = array();


	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	    	
	        $rows[] = $row;


	    }
	} else {
	    echo "";
	}
	return json_encode($rows);
}

?>