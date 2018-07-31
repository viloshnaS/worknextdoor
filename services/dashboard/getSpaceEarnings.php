<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['hub_id']) && !empty($_GET['hub_id'])) {
    $hub_id = $_GET['hub_id'];
    $year= $_GET['year'];
    echo getEarnings($hub_id, $year);
    
 }


function getEarnings($id, $year){
	global $connection;

	$sql= "SELECT b.space_id, s.space_name, MONTH(b.booking_date) as month, 
	SUM((CASE 
	WHEN package_id = 1 THEN
		timestampdiff(hour, b.booking_date_start,b.booking_date_end)
	WHEN package_id = 2 THEN
		timestampdiff(day, b.booking_date_start,b.booking_date_end) + 1
	WHEN package_id = 3 THEN
		timestampdiff(month, b.booking_date_start,b.booking_date_end)
	END )*unit_price) as amount
	FROM booking b, spaces s
	WHERE s.hub_id = $id
	AND s.space_id = b.space_id
	AND YEAR(b.booking_date) = $year
	GROUP BY b.space_id, s.space_name, MONTH(b.booking_date)
	ORDER BY b.space_id, MONTH(b.booking_date) ASC";


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