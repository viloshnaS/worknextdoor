<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;


$name=$_POST['name'];
$active=$_POST['active']; 

disableHub($id,$active);

/*
disableHub(10,0);
*/

function disableHub($id,$active){
	global $connection;

	$sql = "UPDATE hubs 
			SET active='$active'
			where hub_id=$id";
	
	echo $sql;
	$result = $connection->query($sql);




}

?>