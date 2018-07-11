<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
$connection = $conn;


$hub_id=$_POST['hub_id'];
$date_list=$_POST['selectedDates'];



echo insertDates($hub_id,$date_list);

function insertDates($hub_id, $date_list ){

	global $connection;
	$date_array= json_decode($date_list,true);

	$sql_delete = "DELETE FROM hub_availability WHERE hub_id=$hub_id";

	$connection->query($sql_delete);


	$sql_insert = "INSERT INTO hub_availability(hub_id,startdate,enddate)
	VALUES";



	foreach($date_array AS $date){
		$sql_insert = $sql_insert . " ($hub_id,STR_TO_DATE('".$date["date_start"]."', '%m/%d/%Y'),STR_TO_DATE('".$date["date_end"]."', '%m/%d/%Y')),";


	}	

	$sql_insert =  substr($sql_insert,0,-1);


	$result = $connection->query($sql_insert);


	if ($result == TRUE) {

		echo 1;
	}
	else{
		echo -1;
	}
}

?>