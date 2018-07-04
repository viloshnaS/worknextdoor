<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


 
function getSpaces($id){
	global $connection;

	$sql = "SELECT * FROM spaces WHERE hub_id=$id";
	
	$rows= array();
	$result = $connection->query($sql);
	if ($result->num_rows > 0) {
			// output data of each row
			while($row = $result->fetch_assoc()) {
				$rows[] = $row;
			}
		} 
	
		return json_encode($rows);

}


?>