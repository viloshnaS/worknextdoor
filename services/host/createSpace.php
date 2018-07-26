<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
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
$price_list=$_POST['price_list']; 
$thumbnail_picture=$_POST['thumbnail_picture']; 



 echo createSpace($hub_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$price_list,$thumbnail_picture);



function createSpace($hub_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$price_list,$thumbnail_picture){
	global $connection;

	$sql = "INSERT INTO spaces(hub_id, space_type,space_name,number_of_guests,number_of_spaces,size,whiteboard,screen,projector,thumbnail_picture)
	VALUES($hub_id,$space_type,'$space_name',$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,'$thumbnail_picture')";
	
	$result = $connection->query($sql);

	$space_id = -1;

	if ($result == TRUE) {
	    // output data of each row


	    $sql1 ="SELECT LAST_INSERT_ID() as space_id";
	    $id = $connection->query($sql1);
	    $row = $id->fetch_assoc();
	    $space_id=$row["space_id"];


	    if($price_list !=""){
	    
		    $price_array= json_decode($price_list,true);
			$sql = "INSERT INTO space_pricing(space_id,price_package_id,price) VALUES";



			foreach($price_array AS $price){
				$sql = $sql . " ($space_id,". $price["rate"] .",". $price["price"] ."),";


			}

			$sql =  substr($sql,0,-1);


			$result = $connection->query($sql);
	
		}

	  }


	  return $space_id;

	

}

?>
