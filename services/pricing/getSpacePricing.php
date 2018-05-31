<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;
   
function getSpacePricing($id){
	global $connection;

	$sql = "SELECT pp.package_id, pp.description, sp.price 
	FROM space_pricing sp, pricing_package pp 
	where  pp.package_id = sp.price_package_id
	AND sp.space_id=$id";

	$result = $connection->query($sql);

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	    	
	        $rows[] = $row;


	    }
	} else {
	    echo "0 results";
	}
	return json_encode($rows);
}

?>