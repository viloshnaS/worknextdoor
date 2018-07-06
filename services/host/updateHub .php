<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


$name=$_POST['name'];
$description=$_POST['description'];
$hub_id=$_POST['hub_id'];
$parking=$_POST['parking'];
$kitchen=$_POST['kitchen'];
$printer_scanner=$_POST['printer_scanner']; 
$heater=$_POST['heater']; 
$aircon=$_POST['aircon']; 
$wifi=$_POST['wifi']; 
$picture=""; 
$weekends=$_POST['weekends']; 
$public_holidays=$_POST['public_holidays'];
$active=$_POST['active']; 



echo updateHub($hub_id,$name,$description,$parking,$kitchen,$printer_scanner,$heater,$aircon,$wifi,$picture,$weekends,$public_holidays,$active);

/*
updateHub(10,'Regus','Solution de espace de travail coworking domiciliation entreprise, Businessworld',8,43.571514,1.425154,'8 esplanade Compans Caffarelli Immeuble Atria 31000 Toulouse',1,1,1,1,1,1,1,1,1);
*/

function updateHub($hub_id,$name,$description,$parking,$kitchen,$printer,$heater,$aircon,$wifi,$picture,$weekends,$public_holidays,$active){
	global $connection;

	$sql = "UPDATE hubs 
			SET name='$name',
			description='$description',
			parking='$parking',
			kitchen='$kitchen',
			printer_scanner='$printer',
			heater='$heater',
			air_con='$aircon',
			wifi='$wifi',
			weekends='$weekends',
			public_holidays='$public_holidays',
			active='$active'
			where hub_id=$hub_id";
	

	$result = $connection->query($sql);

	if ($result == TRUE) {
	    return 1;

	 }
	 else{
	 	return -1;
	 }




}

?>
