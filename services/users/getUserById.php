<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    getUserById($user_id);
    
 }

function getUserById($id){
	global $connection;
	$sql = "SELECT * FROM users u, profession_category p 
	where user_id=$id
	AND u.profession_id = p.profession_id";
	$result = $connection->query($sql);


	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $rows[][] = $row;
	    }
	} else {
	    echo "0 results";
	}
	print json_encode($rows);
}


?>