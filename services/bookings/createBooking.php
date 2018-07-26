<?php
header("Access-Control-Allow-Origin: *");
require('../connection.php');
require('../Mail/sendMail.php');
$connection = $conn;

$date_from=$_POST['date_from'];
$date_to=$_POST['date_to'];
$space_id=$_POST['space_id'];
$user_id=$_POST['user_id']; 
$space_rate=$_POST['space_rate'];
$duration=$_POST['duration'];
$unit_price=$_POST['unit_price'];
$name=$_POST['hub_name'];

 echo createBooking($space_id,$user_id,$date_from,$date_to, $duration,$space_rate,$unit_price,$name);

function createBooking($space_id,$user_id,$date_from,$date_to, $duration,$space_rate,$unit_price,$hub_name){
	global $connection;

	$u_price = (float)$unit_price;
	$length = (int)$duration;
	$total = $u_price*$length;


	$sql = "INSERT INTO booking(user_id,space_id, booking_date_start,booking_date_end, package_id, unit_price,booking_status_type)
	VALUES($user_id,$space_id,STR_TO_DATE('$date_from', '%Y-%m-%d %T'),STR_TO_DATE('$date_to', '%Y-%m-%d %T'),$space_rate,$unit_price,3)";

	 $booking_id = -1;
	
	$result = $connection->query($sql);


	if ($result == TRUE) {
	    // output data of each row


	    $sql1 ="SELECT LAST_INSERT_ID() as booking_id";
	    $id = $connection->query($sql1);
	    $row = $id->fetch_assoc();
	    $booking_id="WND000".$row["booking_id"];

	    $sql2 = "SELECT * FROM users u where user_id=$user_id";
	    $users = $connection->query($sql2);

	   
	   	$row = $users->fetch_assoc();
	    $user_firstname= $row['firstname'];
	    $user_lastname = $row['lastname'];
	    $user_address=$row['email'];

	    $sql3 = "SELECT u.*,s.address AS hub_address FROM users u, v_space s
	    where u.user_id=s.user_id
	    and s.space_id=$space_id";
	    $hosts = $connection->query($sql3);
	    $row = $hosts->fetch_assoc();
	    $host_firstname= $row['firstname'];
	    $host_lastname = $row['lastname'];
	    $host_email=$row['email'];
	    $host_phone=$row['phone'];
	    $host_address=$row['hub_address'];


	    $message = "<p><b>Thanks $user_firstname,</b></p>";
	    $message =$message."<p> Your space has been reserved at $hub_name";
	    $message =$message."Please connect with your host to find out where to pick your keys and where to check in.</p>";

	    $message =$message."<table>";
	    $message =$message."<tr>";
	    $message =$message."<td colspan='2'>Booking Details</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Time In</td>";
	    $message =$message."<td>$date_from</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Time out</td>";
	    $message =$message."<td>$date_to</td>";
	    $message =$message."</tr>";
	    $message =$message."<td>Duration</td>";
	    if($space_rate==1){
	    	$message =$message."<td>$duration Hour(s)</td>";
	    }
	    else if($space_rate==2){
	    	$message =$message."<td>$duration Day(s)</td>";
	    }
	    else if($space_rate==3){
	    	$message =$message."<td>$duration Month(s)</td>";
	    }
	    
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Booking Number</td>";
	    $message =$message."<td>".$booking_id."</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Host</td>";
	    $message =$message."<td>$host_firstname $host_lastname</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Address</td>";
	    $message =$message."<td>$host_address</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Phone Number</td>";
	    $message =$message."<td>$host_phone</td>";
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Email</td>";
	    $message =$message."<td>$host_email</td>";
	    $message =$message."</tr>"; 
	    $message =$message."</tr>";
	    $message =$message."<tr>";
	    $message =$message."<td>Total Payment</td>";
	    $message =$message."<td>$total Euros</td>";
	    $message =$message."</tr>";
	    $message =$message."</table>";



	    
	   sendConfirmationMail($user_address, $user_firstname." ".$user_lastname,$hub_name,$message);

	    
	} else {
	    echo "Error";
	}

	return $booking_id;

}

?>