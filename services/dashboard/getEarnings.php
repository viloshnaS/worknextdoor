<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    $interval= $_GET['interval'];
    echo getEarnings($user_id, 	$interval);
    
 }

//echo getEarnings(2, 3);
 
function getEarnings($id, $interval){
	global $connection;


	$sql= "SELECT h.name as name,  
                sum((CASE 
                WHEN package_id = 1 THEN
                               timestampdiff(hour, b.booking_date_start,b.booking_date_end)
                WHEN package_id = 2 THEN
                               timestampdiff(day, b.booking_date_start,b.booking_date_end) + 1
                WHEN package_id = 3 THEN
                               timestampdiff(month, b.booking_date_start,b.booking_date_end)
                END)*unit_price )AS Total_Earning
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

	$sql = $sql . " GROUP BY h.name,h.hub_id";

	
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