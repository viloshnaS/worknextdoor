<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


$hub_id=$_POST['hub_id'];
$space_type=$_POST['space_type'];
$space_name=$_POST['space_name'];
$number_of_guests=$_POST['number_of_guests'];
$number_of_spaces=$_POST['number_of_spaces'];
$size=$_POST['size'];
$whiteboard=$_POST['whiteboard'];
$screen=$_POST['screen'];
$projector=$_POST['projector']; 
$thumbnail_picture=$_POST['thumbnail_picture']; 



 echo createSpace($hub_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$thumbnail_picture);



function createSpace($hub_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$thumbnail_picture){
	global $connection;

	$sql = "INSERT INTO spaces(hub_id, space_type,space_name,number_of_guests,number_of_spaces,size,whiteboard,screen,projector,thumbnail_picture)
	VALUES($hub_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$thumbnail_picture)";
	
	$result = $connection->query($sql);

	$space_id = -1;

	if ($result == TRUE) {
	    // output data of each row


	    $sql1 ="SELECT LAST_INSERT_ID() as space_id";
	    $id = $connection->query($sql1);
	    $row = $id->fetch_assoc();
	    $space_id=$row["space_id"];

	  }


	  return $space_id;

	

}

?>
