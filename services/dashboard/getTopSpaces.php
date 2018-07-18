<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

if(isset($_GET['hub_id']) && !empty($_GET['hub_id'])) {
    $hub_id = $_GET['hub_id'];
    $interval= $_GET['interval'];
    echo getSpaceBookingPercentage($hub_id, $interval);
    
 }


 
function getSpaceBookingPercentage($id, $interval){
	global $connection;

	$sql= "SELECT s.space_name, s.space_id, TRUNCATE((COUNT(*)/temp.total)*100, 2) AS percentage
	FROM booking b, spaces s,
    (select count(*) as total
     from booking b1, spaces s1
     WHERE b1.space_id = s1.space_id 
	 AND s1.hub_id = $id
     ) temp
	WHERE b.space_id = s.space_id 
	AND s.hub_id = $id";

	if ($interval=='1') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";

	}


	if ($interval=='2') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 30 DAY AND NOW()";
	}


	if ($interval=='3') {  
	$sql = $sql . " AND b.booking_date_start BETWEEN NOW() - INTERVAL 365 DAY AND NOW()";
	}

	$sql = $sql . " GROUP BY s.space_name,s.space_id
    ORDER BY percentage DESC";
	
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