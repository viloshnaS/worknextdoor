<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

$user_id = $_GET['user_id'];
$interval= $_GET['interval'];
echo getBookings($user_id,$interval);

function getBookings($id, $interval){
	global $connection;

	$sql= "SELECT h.name as name, COUNT(*) as y, h.hub_id, 
	(CASE 
    WHEN b.booking_date_start <= CURDATE()
    THEN 0
    ELSE 1
    END) as flag
	FROM booking b, hubs h, spaces s
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id";

	if ($interval=='1') {  
	$sql = $sql . " AND b.booking_date BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";

	}


	if ($interval=='2') {  
	$sql = $sql . " AND b.booking_date BETWEEN NOW() - INTERVAL 30 DAY AND NOW()";
	}


	if ($interval=='3') {  
	$sql = $sql . " AND b.booking_date BETWEEN NOW() - INTERVAL 365 DAY AND NOW()";
	}

	$sql = $sql . " GROUP BY name, hub_id, flag";


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