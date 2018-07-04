<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('getSpaceList.php');
$connection = $conn;

if(isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    getHub($user_id);
    
 }
 
 //echo getHub(1);
 
 
function getHub($id){
	global $connection;

	$sql = "SELECT * FROM hubs WHERE user_id=$id";
	
	$rows= array();
	$result = $connection->query($sql);
	if ($result->num_rows > 0) {
			// output data of each row
			while($row = $result->fetch_assoc()) {
				
				$json_string = json_encode($row);
				$space_list = getSpaces($row['hub_id']);
				$json_string = substr($json_string,0,strlen($json_string)-1);
				
				$json_string= $json_string.",\"spaces\":".$space_list. "}";
				$rows[] = json_decode($json_string);
				
			}
		} 
		return json_encode($rows);

}


?>
