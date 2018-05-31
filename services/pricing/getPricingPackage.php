<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

getPricingPackage();

function getPricingPackage(){
	global $connection;

	$sql = "SELECT pp.package_id, pp.description
	FROM pricing_package pp 
	";

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