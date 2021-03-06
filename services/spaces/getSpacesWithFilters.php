<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
require('../distance.php');
$connection = $conn;


$space_rate=$_GET['space_rate'];
$space_type=$_GET['space_type'];
$guests=$_GET['capacity'];
$whiteboard=$_GET['whiteboard'];//'1'/false
$screen=$_GET['screen'];//'1'/false
$projector=$_GET['projector']; //'1'/false
$latitude=$_GET['latitude'];
$longitude=$_GET['longitude'];
$kitchen=$_GET['kitchen']; //'1'/false
$parking=$_GET['parking']; //'1' or false
$printer=$_GET['printer_scanner']; //'1' or false
$heater=$_GET['heater']; //'1'/false
$air_con=$_GET['air_con']; //'1' or false
$wifi=$_GET['wifi'];
$date_from=$_GET['date_from']; //'1' or false
$date_to=$_GET['date_to']; //'1'/false
$price_min=$_GET['price_min'];
$price_max=$_GET['price_max'];



echo getSpaces($latitude,$longitude,$space_rate,$space_type,$guests,$whiteboard,$screen,$projector,$kitchen,$parking,$printer,$heater,$air_con,$wifi, $date_from, $date_to);

function getSpaces($latitude,$longitude,$space_rate,$space_type,$guests,$whiteboard,$screen,$projector,$kitchen,$parking,$printer,$heater,$air_con,$wifi, $date_from, $date_to){
	global $connection;

	// number of guest is 1 by default

	$sql = "SELECT s.space_id, s.space_type_description,s.hub_id,s.name,
	s.latitude,s.longitude, sp.price,sp.price_package_id, s.thumbnail,
	pp.description AS price_rate,r.reviews_count,ROUND(r.average_rating) AS rating
	FROM (v_space s LEFT JOIN v_space_review r ON r.hub_id =s.hub_id) 
	INNER JOIN 
	(space_pricing sp INNER JOIN pricing_package pp ON sp.price_package_id = pp.package_id)
	ON s.space_id =sp.space_id
	where s.number_of_guests >=$guests
	AND $latitude BETWEEN s.latitude-0.2 AND s.latitude+0.2
	AND $longitude BETWEEN s.longitude-0.2 AND s.longitude+0.2
	"; 
	
	if($space_rate !=""){//default size is 0. meaning no filter on size
		$sql = $sql . " AND sp.price_package_id =$space_rate";
	}
	else{
		$sql = $sql . " AND sp.price =
		( SELECT MIN(price)
		FROM space_pricing sp1
		where sp1.space_id = s.space_id
		)";

	}
	if($date_from!=""){
		$sql = $sql. " AND NOT EXISTS

			(
			select *
			FROM booking b
			WHERE  b.space_id = s.space_id
			AND (STR_TO_DATE('$date_from', '%Y-%m-%d %T') BETWEEN b.booking_date_start AND b.booking_date_end
				OR STR_TO_DATE('$date_to', '%Y-%m-%d %T') BETWEEN b.booking_date_start AND b.booking_date_end
				OR b.booking_date_start between STR_TO_DATE('$date_from', '%Y-%m-%d %T') and STR_TO_DATE('$date_to', '%Y-%m-%d %T')
				OR b.booking_date_end between STR_TO_DATE('$date_from', '%Y-%m-%d %T') and STR_TO_DATE('$date_to', '%Y-%m-%d %T')
				)
			AND b.booking_status_type=3
			)
	";
	}

	// by default type is 0. It means user has not specified the type of room.
	//therefore no criteria  when type = 0
	if($space_type !=0 ){ 

		$sql = $sql . " AND s.space_type_id = $space_type";
	}

	if($whiteboard === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.whiteboard =1";
	}


	if($screen === '1'){ //add a condition when feature == '1'

			$sql = $sql . " AND s.screen =1";
		}

	if($projector === '1'){ //add a condition when feature == '1'

			$sql = $sql . " AND s.projector =1";
		}

	if($parking === '1'){ //add a condition when feature == '1'

			$sql = $sql . " AND s.parking =1";
		}

	if($kitchen === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.kitchen =1";
	}

	if($printer === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.printer_scanner =1";
	}

	if($heater === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.heater =1";
	}

	if($air_con === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.air_con =1";
	}

	if($wifi === '1'){ //add a condition when feature == '1'

		$sql = $sql . " AND s.wifi =1";
	}

	//echo $sql;
	$result = $connection->query($sql);

	$spaces_list=array();
	$distance_array=array();
	$space_distance=array();
	$coordinates_array = array();
	$sorted_array=array();

	if ($result->num_rows > 0) {
	    // output data of each 
	
	    while($row = $result->fetch_assoc()) {
	   		
	    	$coordinates_array[]=[$row['space_id'],$row['latitude'],$row['longitude']];
	    	$spaces_list[$row["space_id"]] = $row;
			
	    		
	    }

	   	$distance_array = getDistance($latitude,$longitude,$coordinates_array);

	   	$count =0;
	   	asort($distance_array);
	    
	    foreach ($distance_array as $key => $value) {
	    	$row=$spaces_list[$key];
	    	$json_string= json_encode($row);
	    	$json_string = substr($json_string,0,strlen($json_string)-1);
	 		$json_string= $json_string.",\"distance\":".$value. "}";	
	 		$sorted_array[]=json_decode($json_string); 
	 		
	 		
	    }
	    
	} 

	return json_encode($sorted_array);

}
?>


