<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

if(isset($_GET['hub_id']) && !empty($_GET['hub_id'])) {
    $hub_id = $_GET['hub_id'];
    getHubReviews($hub_id);
    
 }


function getHubReviews($id){

	global $connection;
	$sql = "SELECT u.*,r.* FROM users u,
			hub_reviews r
			where r.user_id =u.user_id 
			AND r.hub_id=$id 
			order by r.date_posted desc";
	$result = $connection->query($sql);


	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $rows[] = $row;
	    }
	} else {
	    echo "0 results";
	}
	print json_encode($rows);
}




?>
