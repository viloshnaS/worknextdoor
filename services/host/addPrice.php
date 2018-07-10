<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;


$space_id=$_POST['space_id'];
$price_list=$_POST['price_list'];



echo inserPrices($space_id,$price_list);

function inserPrices($space_id, $price_list ){

	global $connection;
	 $price_array= json_decode($price_list,true);


	$sql = "INSERT INTO space_pricing(space_id,price_package_id,price) VALUES";



	foreach($price_array AS $price){
		$sql = $sql . " ($space_id,". $price["rate"] .",". $price["price"] ."),";


	}	

	echo $sql;

	$sql =  substr($sql,0,-1);


	$result = $connection->query($sql);


	if ($result == TRUE) {

		echo 1;
	}
	else{
		echo -1;
	}
}

?>