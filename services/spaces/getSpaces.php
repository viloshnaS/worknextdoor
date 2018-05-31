<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
require('../pricing/getSpacePricing.php');
$connection = $conn;



$space_type=$_GET['space_type'];
$guests=$_GET['number_of_guests'];
$size=$_GET['size'];
$whiteboard=$_GET['whiteboard'];//true/false
$screen=$_GET['screen'];//true/false
$projector=$_GET['projector']; //true/false
$latitude=$_GET['latitude'];
$longitude=$_GET['longitude'];
$kitchen=$_GET['kitchen']; //true/false
$parking=$_GET['parking']; //true or false
$printer=$_GET['printer_scanner']; //true or false
$heater=$_GET['heater']; //true/false
$air_con=$_GET['aircon']; //true or false
$wifi=$_GET['wifi']; //true/false
$date_from=$_GET['date_from']; //true or false
$date_to=$_GET['date_to']; //true/false

getSpaces($latitude,$longitude,$size,$space_type,$guests,$whiteboard,$screen,$projector,$kitchen,$parking,$printer,$heater,$air_con,$wifi, $date_from, $date_to);

function getSpaces($latitude,$longitude,$size,$space_type,$guests,$whiteboard,$screen,$projector,$kitchen,$parking,$printer,$heater,$air_con,$wifi, $date_from, $date_to){
	global $connection;

	// number of guest is 1 by default

	$sql = "SELECT * FROM v_space s
	where s.number_of_spaces > (
	select count(*) 
	FROM booking b
	WHERE  b.space_id = s.space_id
	AND STR_TO_DATE('$date_from', '%d/%m/%Y %T') BETWEEN b.booking_date_start AND b.booking_date_end
	AND STR_TO_DATE('$date_to', '%d/%m/%Y %T') BETWEEN b.booking_date_start AND b.booking_date_end
	AND b.booking_status_type=4
	)
	AND s.number_of_guests >=$guests 
	AND $latitude BETWEEN s.latitude-0.2 AND s.latitude+0.2
	AND $longitude BETWEEN s.longitude-0.2 AND s.longitude+0.2"; 
	
	if($size > 0){//default size is 0. meaning no filter on size
		$sql = $sql . " AND s.size >=$size";
	}

	// by default type is 0. It means user has not specified the type of room.
	//therefore no criteria  when type = 0
	if($space_type !=0 ){ 

		$sql = $sql . " AND s.space_type_id = $space_type";
	}

	if($whiteboard == true){ //add a condition when feature == true

		$sql = $sql . " AND s.whiteboard =1";
	}


	if($screen == true){ //add a condition when feature == true

			$sql = $sql . "AND s.screen =1";
		}

	if($projector == true){ //add a condition when feature == true

			$sql = $sql . " AND s.projector =1";
		}

	if($parking == true){ //add a condition when feature == true

			$sql = $sql . " AND s.parking =1";
		}

	if($kitchen == true){ //add a condition when feature == true

		$sql = $sql . " AND s.kitchen =1";
	}

	if($printer == true){ //add a condition when feature == true

		$sql = $sql . " AND s.printer_scanner =1";
	}

	if($heater == true){ //add a condition when feature == true

		$sql = $sql . " AND s.heater =1";
	}

	if($air_con == true){ //add a condition when feature == true

		$sql = $sql . " AND s.air_con =1";
	}

	if($wifi == true){ //add a condition when feature == true

		$sql = $sql . " AND s.wifi =1";
	}

	echo $sql;
	$result = $connection->query($sql);

	$spaces_list="";


	if ($result->num_rows > 0) {
	    // output data of each 
	    $spaces_list = "[";
	    while($row = $result->fetch_assoc()) {
	    	$space_id = $row["space_id"];
	    	$pricing_list = getSpacePricing($space_id);
	        $json_string = json_encode($row);
	        $json_string = substr($json_string,0,strlen($json_string)-1);
	 		$json_string= $json_string.",\"pricing\":".$pricing_list. "}";
	 		$spaces_list = $spaces_list.$json_string.",";
	    }

	    $spaces_list = substr($spaces_list,0,strlen($spaces_list)-1);
	    $spaces_list = $spaces_list."]";
	} else {
	    echo "0 results";
	}

	return $spaces_list;

}
?>


