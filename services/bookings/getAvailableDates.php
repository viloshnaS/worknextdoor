<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
require('../pricing/getSpacePricing.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    echo getAvailableDates($space_id);
    
 }

function getAvailableDates($id){
	global $connection;
	$sql = "SELECT date(booking_date_start) AS date_start,
	date(booking_date_end) as date_end, package_id
	FROM booking b
	WHERE b.space_id = $id
	AND b.booking_status_type = 3
	AND (b.booking_date_start> curdate()
	OR b.booking_date_end> curdate()
	)";
	$result = $connection->query($sql);

	$result_list = array();

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $result_list = array_merge($result_list,date_range($row['date_start'],$row['date_end']));
	    }
	        
	}
	
	return json_encode($result_list);
}

function date_range($first, $last, $step = '+1 day', $output_format = 'Y-m-d' ) {

    $dates = array();
    $current = strtotime($first);
    $last = strtotime($last);

    while( $current <= $last ) {

        $dates[] = date($output_format, $current);
        $current = strtotime($step, $current);
    }

    return $dates;
}


?>