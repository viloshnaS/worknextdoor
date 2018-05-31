<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$space_id=$_POST['space_id'];
$package_id=$_POST['package_id'];
$price=$_POST['price'];


createSpace($space_id, $package_id,$price);


function createPricing($space_id, $package_id,$price){
	global $connection;

	$sql = "INSERT INTO space_pricing(space_id, price_package_id, price)
	VALUES($space_id, $package_id,$price)";
	$result = $connection->query($sql);


	if ($connection->query($sql) === TRUE) {
	    // output data of each row
	    echo "New record created successfully";
	} else {
	    echo "Error";
	}
	print json_encode($rows);


}
?>