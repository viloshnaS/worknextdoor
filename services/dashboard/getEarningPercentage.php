<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    $year= $_GET['year'];
    echo getEarningPercentage($user_id, $year);
    
 }


function getEarningPercentage($id, $year){
	global $connection;

	$sql= "SELECT h.hub_id, h.name, 
	TRUNCATE((100 / temp.total) * (SUM((CASE 
	WHEN package_id = 1 THEN
		timestampdiff(hour, b.booking_date_start,b.booking_date_end)
	WHEN package_id = 2 THEN
		timestampdiff(day, b.booking_date_start,b.booking_date_end) + 1
	WHEN package_id = 3 THEN
		timestampdiff(month, b.booking_date_start,b.booking_date_end)
	END )*unit_price)) , 2) as percentage
	FROM booking b, hubs h, spaces s,
	
	(SELECT 
	SUM((CASE 
	WHEN package_id = 1 THEN
		timestampdiff(hour, b.booking_date_start,b.booking_date_end)
	WHEN package_id = 2 THEN
		timestampdiff(day, b.booking_date_start,b.booking_date_end) + 1
	WHEN package_id = 3 THEN
		timestampdiff(month, b.booking_date_start,b.booking_date_end)
	END )*unit_price) as total
	FROM booking b, hubs h, spaces s
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id
	AND YEAR(b.booking_date) = $year) temp
	
	WHERE h.hub_id = s.hub_id 
	AND s.space_id = b.space_id
	AND h.user_id = $id
	AND YEAR(b.booking_date) = $year
	GROUP BY h.hub_id, h.name";

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