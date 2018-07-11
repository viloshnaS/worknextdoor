<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;



$active=$_POST['active'];



updateSpace($id,$active);

/* 
updateSpace(12,0);
*/

function updateSpace($id,$active){
	global $connection;

	$sql = "UPDATE spaces 
			SET active='$active'
			where space_id=$id";
	
	echo $sql;
	$result = $connection->query($sql);

	

}

?>
