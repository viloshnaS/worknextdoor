<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$hub_id=$_POST['hub_id'];
$space_type=$_POST['space_type'];
$number_of_guests=$_POST['number_of_guests'];
$number_of_spaces=$_POST['number_of_spaces'];
$size=$_POST['size'];
$whiteboard=$_POST['whiteboard'];//true/false
$screen=$_POST['screen'];//true/false
$projector=$_POST['projector']; //true/false


createSpace($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector);

function createSpace($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector){
	global $connection;

	$sql = "INSERT INTO hubs(hub_id, space_type,number_of_guests,number_of_spaces,size,whiteboard,screen,projector)
	VALUES($hub_id,$space_type,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector)";
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