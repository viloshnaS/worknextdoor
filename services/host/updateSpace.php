<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;

$space_id=$_POST['space_id'];
$space_type=$_POST['space_type'];
$space_name=$_POST['space_name'];
$number_of_guests=$_POST['number_of_guests'];
$number_of_spaces=$_POST['number_of_spaces'];
$size=$_POST['size'];
$whiteboard=$_POST['whiteboard'];
$screen=$_POST['screen'];
$projector=$_POST['projector']; 

$thumbnail_picture=$_POST['thumbnail_picture'];
$active=$_POST['active'];
$price_list=$_POST['pricing'];
 



echo updateSpace($space_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$thumbnail_picture,$active,$price_list);

/*
updateSpace(12,10,2,'big room',4,1,30,1,1,1,1);
*/

function updateSpace($space_id,$space_type,$space_name,$number_of_guests,$number_of_spaces,$size,$whiteboard,$screen,$projector,$thumbnail_picture,$active,$price_list){
	global $connection;

	$sql = "UPDATE spaces 
			SET  
			space_type=$space_type,
			space_name='$space_name',
			number_of_guests=$number_of_guests,
			number_of_spaces=$number_of_spaces,
			size=$size,
			whiteboard=$whiteboard,
			screen=$screen,
			projector=$projector,
			thumbnail_picture='$thumbnail_picture',
			active=$active
			where space_id=$space_id";
	
	//echo $sql;
	$result = $connection->query($sql);

	if ($result == TRUE) {
	    
	    if($price_list !=""){
	    	$price_array= json_decode($price_list,true);

			foreach($price_array AS $price){
				$price_array= json_decode($price_list,true);

		   		 $sql = "UPDATE space_pricing SET price=".$price['price']." where space_id=$space_id and price_package_id=".$price['rate'];

		
				$result = $connection->query($sql);
				
				if ($result != TRUE) {
				
	 			return -1;
				}


			}

			if ($result == TRUE) {
				
	 			return 1;
			}

	
		}

	 }
	 else{
	 	return -1;
	}

}

?>
