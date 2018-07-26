<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    echo GetSpacePricingById($space_id);
    
 }
//echo GetSpacePricingById(16);


function GetSpacePricingById($id){
	global $connection;
	$sql = "SELECT * FROM space_pricing where space_id=$id";
	
	$rows= array();

	$result = $connection->query($sql);

	if ($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				$rows[] = $row;
			}
		} 
	
		return json_encode($rows);
		
}

?>