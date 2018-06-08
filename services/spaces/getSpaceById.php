<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('../pricing/getSpacePricing.php');
$connection = $conn;

if(isset($_GET['space_id']) && !empty($_GET['space_id'])) {
    $space_id = $_GET['space_id'];
    echo getSpaceById($space_id);
    
 }

function getSpaceById($id){
	global $connection;
	$sql = "SELECT s.*,r.reviews_count,ROUND(r.average_rating) AS rating
	FROM v_space s LEFT JOIN v_space_review r ON s.hub_id = r.hub_id
	where s.space_id=$id";
	$result = $connection->query($sql);

	$json_string = "";

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        $json_string = json_encode($row);
	        $pricing_list = getSpacePricing($id);
			$json_string = substr($json_string,0,strlen($json_string)-1);
	 		$json_string= $json_string.",\"pricing\":".$pricing_list. "}";
	    }
	} else {
	    echo "0 results";
	}
	
	return $json_string;
}


?>