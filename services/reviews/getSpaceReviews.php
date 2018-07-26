<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    echo getHubReviews($space_id);
    
 }


function getHubReviews($id){

	global $connection;
	//building the query
	$sql = "SELECT u.firstname,u.lastname,u.gender, u.picture,
			ROUND(r.rating) AS rating, r.comment, r.date_posted
			FROM users u,
			hub_reviews r, spaces s
			where r.user_id =u.user_id 
			AND s.hub_id =r.hub_id
			AND s.space_id=$id 
			order by r.date_posted desc";

	$result = $connection->query($sql);
	$rows = array();

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $rows[] = $row;
	    }
	} 
	print json_encode($rows);
}




?>