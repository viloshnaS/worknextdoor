<?php
header("Access-Control-Allow-Origin: *");
require('../../connection.php');
$connection = $conn;


$name=$_POST['name'];
$description=$_POST['description'];
$user_id=$_POST['user_id'];
$latitude=$_POST['latitude'];
$longitude=$_POST['longitude'];
$address=$_POST['address'];
$parking=$_POST['parking'];
$kitchen=$_POST['kitchen'];
$printer_scanner=$_POST['printer_scanner']; 
$heater=$_POST['heater']; 
$aircon=$_POST['aircon']; 
$wifi=$_POST['wifi']; 
$weekends=$_POST['weekends']; 
$public_holidays=$_POST['public_holidays'];
$active=$_POST['active']; 



updateHub($id,$name,$description,$user_id,$latitude,$longitude,$address,$parking,$kitchen,$printer,$heater,$aircon,$wifi,$weekends,$public_holidays,$active);

/*
updateHub(10,'Regus','Solution de espace de travail coworking domiciliation entreprise, Businessworld',8,43.571514,1.425154,'8 esplanade Compans Caffarelli Immeuble Atria 31000 Toulouse',1,1,1,1,1,1,1,1,1);
*/

function updateHub($id,$name,$description,$user_id,$latitude,$longitude,$address,$parking,$kitchen,$printer,$heater,$aircon,$wifi,$weekends,$public_holidays,$active){
	global $connection;

	$sql = "UPDATE hubs 
			SET name='$name',
			description='$description',
			user_id='$user_id',
			latitude='$latitude',
			longitude='$longitude',
			address='$address',
			parking='$parking',
			kitchen='$kitchen',
			printer_scanner='$printer',
			heater='$heater',
			air_con='$aircon',
			wifi='$wifi',
			weekends='$weekends',
			public_holidays='$public_holidays',
			active='$active'
			where hub_id=$id";
	
	echo $sql;
	$result = $connection->query($sql);




}

?>