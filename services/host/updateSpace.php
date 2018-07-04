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



updateSpace($id,$hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector);

/*
updateSpace(12,10,2,4,1,30,1,1,1);
*/

function updateSpace($id,$hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector){
	global $connection;

	$sql = "UPDATE spaces 
			SET hub_id='$hub_id', 
			space_type='$space_type',
			number_of_guests='$number_of_guests',
			number_of_spaces='$number_of_spaces',
			size='$size',
			whiteboard='$whiteboard',
			screen='$screen',
			projector='$projector'
			where space_id=$id";
	
	echo $sql;
	$result = $connection->query($sql);

	

}

?>