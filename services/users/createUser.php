<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$firstname=$_POST['firstname'];
$lastname=$_POST['firstname'];
$email=$_POST['email'];
$gender=$_POST['gender']; //F or M
$zipcode=$_POST['zipcode'];
$city=$_POST['city'];
$country=$_POST['country'];
$profession=$_POST['profession']; //profession_id from profession_category
$host=$_POST['host']; //true or false


createUser($firstname,$lastname,$email,$gender,$zipcode,$city,$country,$profession,$host);

function createUser($firstname,$lastname,$email,$gender,$zipcode,$city,$country,$profession,$host){
	global $connection;

	$sql = "INSERT INTO users(firstname,lastname,gender,email,zipcode,city,country,profession,host)
	VALUES('$firstname','$lastname','$gender','$email',$zipcode,'$city','$country','$profession',$host)";
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
