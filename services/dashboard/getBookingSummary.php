<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

$user_id = $_GET['user_id'];
$interval= $_GET['interval'];

$myObj = {};

$myObj->total = getTotalBookings($user_id, $interval);
$myObj->percentage = getPercentageChange($user_id, $interval);


echo json_encode($myObj);



 
function getTotalBookings($id, $interval){
	global $connection;

	$sql= "SELECT COUNT(*) as total
	FROM booking b, hubs h, spaces s
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id";

	if ($interval=='1') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";

	}


	if ($interval=='2') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 30 DAY AND NOW()";
	}


	if ($interval=='3') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 365 DAY AND NOW()";
	}

	$result = $connection->query($sql);

	$total = 0;

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	    	
	        $total = $row['total'];


	    }
	} else {
	    echo "";
	}

	return $total;
}


function getPercentageChange($id, $interval){
	global $connection;

	$sql1= "SELECT COUNT(*) as total
	FROM booking b, hubs h, spaces s
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id";


	$sql2= "SELECT COUNT(*) as total
	FROM booking b, hubs h, spaces s
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id";

	if ($interval=='1') {  
	$sql1 = $sql1 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";
	$sql2 = $sql2 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 14 DAY AND NOW() - INTERVAL 7 DAY";

	}


	if ($interval=='2') {  
	$sql1 = $sql1 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 1 MONTH AND NOW()";
	$sql2= $sql2 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 2 MONTH AND NOW() - INTERVAL 1 MONTH ";
	}


	if ($interval=='3') {  
	$sql1 = $sql1 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 1 YEAR AND NOW()";
	$sql2 = $sql2 . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 2 YEAR AND NOW() - INTERVAL 1 YEAR";
	}

	$result1 = $connection->query($sql1);
	$result2 = $connection->query($sql2);

	$total = 0;

	if ($result1->num_rows > 0 && $result2->num_rows ) {
	   $row1 = $result1->fetch_assoc();
	   $row2 = $result2->fetch_assoc();
	echo $row1['total'];
	echo $row2['total'];

	} else {
	    echo "";
	}

}

?>