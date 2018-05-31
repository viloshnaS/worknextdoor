<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('../pricing/getSpacePricing.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    getSpaceById($space_id);
    
 }

function getSpaceById($id){
	global $connection;
	$sql = "SELECT * FROM v_space s
	where s.space_id=$id";
	$result = $connection->query($sql);

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $json_string = json_encode($row);
	    }
	} else {
	    echo "0 results";
	}
	$pricing_list = getSpacePricing(1);
	 $json_string = substr($json_string,0,strlen($json_string)-1);
	 $json_string= $json_string.",\"pricing\":".$pricing_list. "}";
	return $json_string;
}


?>