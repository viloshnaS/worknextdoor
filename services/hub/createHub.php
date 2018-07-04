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
//$picture=$_POST['picture']; 
//$date_posted=$_POST['date_posted'];
//$last_booked =$_POST['last_booked'];
$weekends=$_POST['weekends']; 
$public_holidays=$_POST['public_holidays'];
$active=$_POST['active']; 
 



createHub($name,$description,$user_id,$latitude,$longitude,$address,$parking,$kitchen,$printer,$heater,$aircon,$wifi,$weekends,$public_holidays,$active);

/*
createHub('La Kooloc','La KOOLOC n’est pas un simple lieu de travail, c’est un lieu de coworking d’échanges et de partage pour travailler autrement',12,43.606861,1.396750,'7 Rue Georges Vedel, 31300 Toulouse',1,1,1,1,1,1,1,1,1);
*/

function createHub($name,$description,$user_id,$latitude,$longitude,$address,$parking,$kitchen,$printer,$heater,$aircon,$wifi,$weekends,$public_holidays,$active){
	global $connection;

	$sql = "INSERT INTO hubs(name, description,user_id,latitude,longitude,address,parking,kitchen,printer_scanner,heater,air_con,wifi,weekends,public_holidays,active)
	VALUES('$name','$description',$user_id,$latitude,$longitude,'$address',$parking,$kitchen,$printer,$heater,$aircon,$wifi,$weekends,$public_holidays,$active)";
	
	echo $sql;
	$result = $connection->query($sql);




}

?>