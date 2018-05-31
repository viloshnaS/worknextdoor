<?php
header("Access-Control-Allow-Origin: *");
require('connection.php');
$connection = $conn;

$id=$_POST['user_id'];
$firstname=$_POST['firstname'];
$lastname=$_POST['firstname'];
$email=$_POST['email'];
$gender=$_POST['gender']; //F or M
$zipcode=$_POST['zipcode'];
$city=$_POST['city'];
$country=$_POST['country'];
$profession=$_POST['profession']; //profession_id from profession_category
$host=$_POST['host']; //true or false

updateUser($id,$firstname,$lastname,$email,$gender,$zipcode,$city,$country,$profession,$host);

function updateUser($id,$firstname,$lastname,$email,$gender,$zipcode,$city,$country,$profession,$host){

	global $connection;

	$sql = "UPDATE users
	set firstname='$firstname',
	lastname='$lastname',
	email='$email',
	gender='$gender',
	zipcode=$zipcode,
	city='$city',
	country='$country',
	profession=$profession,
	host=$host
	WHERE user_id=$id";

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