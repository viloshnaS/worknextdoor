<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

if(isset($_GET['hub_id']) && !empty($_GET['hub_id'])) {
    $user_id = $_GET['hub_id'];
    getSpaces($hub_id);
    
 }
 
function getSpaces($id){
	global $connection;

	$sql = "SELECT * FROM spaces WHERE hub_id=$id";
	
	echo $sql;
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
//getSpaces(2);

?>