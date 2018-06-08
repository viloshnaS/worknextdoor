<?php

$to = "viloshna.sonoo@gmail.com";
         $subject = "Booking";
         
         $message = "<b>Tou have made a booking from Work Next Door.</b>";
         $message .= "<h1>Booking Number : SVFVS434</h1>";
         
         $header = "From:yogisawesome@gmail.com \r\n";
         //$header .= "Cc:afgh@somedomain.com \r\n";
         $header .= "MIME-Version: 1.0\r\n";
         $header .= "Content-type: text/html\r\n";

         mail ($to,$subject,$message,$header);


?>