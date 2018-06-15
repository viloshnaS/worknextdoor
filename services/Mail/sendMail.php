
<?php

require_once('class.phpmailer.php');

function sendConfirmationMail($guest_address,$guest_name,$hub_name,$message){
		$mail             = new PHPMailer(); // defaults to using php "mail()"

		$mail->IsSMTP();
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = "tls";
		$mail->Host = "smtp.gmail.com";
		$mail->Port = 587;                                     // set mailer to use SMTP
		$mail->Username = "worknextdoorbooking@gmail.com";  // SMTP username
		$mail->Password = "miage2is"; // SMTP password



		$mail->AddReplyTo("wnd-noreply@gmail.com","Work Next Door");

		$mail->SetFrom('worknextdoorbooking@gmail.com', 'Work Next Door');


		$mail->AddAddress($guest_address, $guest_name);

		$mail->Subject    = "Your Booking is confirmed at ".$hub_name;


		$mail->MsgHTML($message);

		$mail->Send();
}

?>

