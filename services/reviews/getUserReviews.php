<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    getUserReview($user_id);
    
 }


function getUserReview($id){

	global $connection;
	$sql = "SELECT u.*,r.* FROM users u,
			user_reviews r
			where r.host_id =u.user_id 
			AND r.user_id=$id 
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