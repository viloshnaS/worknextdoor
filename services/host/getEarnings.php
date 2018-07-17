<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    $interval= $_GET['interval'];
    echo getEarnings($user_id, 	$interval);
    
 }


 
function getEarnings($id, $interval){
	global $connection;

	$sql= "SELECT SUM(DATEDIFF(b.booking_date_end,b.booking_date_start) * unit_price) AS TOTAL_EARNINGS 
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

	echo $sql;
	$result = $connection->query($sql);

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