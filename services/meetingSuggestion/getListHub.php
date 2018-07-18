<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
require('getSpaceList.php');
$connection = $conn;

echo getListHub();
     

 
 
function getHub(){
	global $connection;

	$sql = "SELECT * FROM hubs WHERE";
	
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
