<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

echo getListHub();
     

 
 
function getListHub(){
	global $connection;

	$sql = "SELECT * FROM hubs";
	
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
