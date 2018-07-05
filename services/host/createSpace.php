<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


$hub_id=$_POST['hub_id'];
$space_type=$_POST['space_type'];
$number_of_guests=$_POST['number_of_guests'];
$number_of_spaces=$_POST['number_of_spaces'];
$size=$_POST['size'];
$whiteboard=$_POST['whiteboard'];
$screen=$_POST['screen'];
$projector=$_POST['projector']; 
//$thumbnail_picture=$_POST['thumbnail_picture']; 



createSpace($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector);

/*
createSpace(5,1,1,1,27,1,1,1);
*/

function createSpace($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector){
	global $connection;

	$sql = "INSERT INTO spaces(hub_id, space_type,number_of_guests,number_of_spaces,size,whiteboard,screen,projector)
	VALUES($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector)";
	
	echo $sql;
	$result = $connection->query($sql);

	

}

?>
