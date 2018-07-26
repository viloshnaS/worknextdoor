<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['list_hub_id']) && !empty($_GET['list_hub_id'])) {
    $list_hub_id = $_GET['list_hub_id'];
    echo hostGetSpaceById($list_hub_id);
    
 }

function hostGetSpaceById($list_hub_id){
	global $connection;
	$listRow = array();
	foreach ($list_hub_id as $hub_id) {
		$sql = "SELECT * FROM spaces where hub_id = $hub_id and space_type = 2";
		$result = $connection->query($sql);
		if ($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				$listRow[] = $row;
			}
		}
	}

	return json_encode($listRow);
	 
		
}


?>
