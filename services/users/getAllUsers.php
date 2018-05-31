<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

getAllUsers();

function getAllUsers(){
	global $connection;
	$sql = "SELECT * FROM users";
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