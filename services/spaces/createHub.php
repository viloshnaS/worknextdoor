<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$name=$_POST['name'];
$description=$_POST['description'];
$user_id=$_POST['user_id'];
$latitude=$_POST['latitude'];
$longitude=$_POST['longitude'];
$address=$_POST['address'];
$category=$_POST['category'];//category most suited for
$kitchen=$_POST['kitchen']; //true/false
$printer_scanner=$_POST['printer_scanner']; //true or false
$heater=$_POST['heater']; //true/false
$aircon=$_POST['aircon']; //true or false
$wifi=$_POST['wifi']; //true/false
$parking=$_POST['parking']; //true/false



createHub($name,$description,$user_id,$latitude,$longitude,$address,$category,$kitchen,$printer,$heater,$aircon,$wifi);

function createHub($name,$description,$user_id,$latitude,$longitude,$address,$category,$kitchen,$printer,$heater,$aircon,$wifi,$parking){
	global $connection;

	$sql = "INSERT INTO hubs(name, description,user_id,latitude,longitude,address,category,kitchen,printer_scanner,heater,air_con,wifi,parking)
	VALUES('$name','$description',$user_id,$latitude,$longitude,'$address',$category,$kitchen,$printer,$heater,$aircon,$wifi,$parking)";
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