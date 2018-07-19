<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    $interval= $_GET['interval'];
    echo getBookings($user_id, $interval);
    
 }


//echo getAverageRating(1, 3);

function getAverageRating($user_id, $interval){
	global $connection;

	$sql = "SELECT h.name as name, count(*) AS reviews_count, avg(r.rating) AS average_rating 
	from hub_reviews r, hubs h
	where r.hub_id = h.hub_id
	and h.user_id = $user_id";

	
	if ($interval=='1') {  
	$sql = $sql . " AND r.date_posted BETWEEN NOW() - INTERVAL 7 DAY AND NOW()";

	}


	if ($interval=='2') {  
	$sql = $sql . " AND r.date_posted BETWEEN NOW() - INTERVAL 30 DAY AND NOW()";
	}


	if ($interval=='3') {  
	$sql = $sql . " AND r.date_posted BETWEEN NOW() - INTERVAL 365 DAY AND NOW()";
	}

	$sql = $sql . " GROUP BY  h.name,h.hub_id";
	echo $sql;
	 $rows=array();
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