<?php

function getDistance($lat1,$lng1,$destinations)
{
		$URL = 'http://maps.googleapis.com/maps/api/distancematrix/json';
		$query_string='origins='.$lat1.','.$lng1.'&destinations=';		

		foreach($destinations as $dest){ //specifying the destinations which are location of spaces
			$query_string = $query_string.$dest[1].','.$dest[2].'|';
		}

		$query_string = substr($query_string,0,-1);
		$query_string = $query_string.'&mode=driving&units=metric&sensor=false&key=AIzaSyCA3Gr_boIdwzOkw_uogkOby6-IwXApBpk';
		
		echo $query_string;

        $cURL=curl_init();
        curl_setopt($cURL,CURLOPT_URL,$URL.'?'.$query_string);
        curl_setopt($cURL,CURLOPT_RETURNTRANSFER, TRUE);
        $Response=trim(curl_exec($cURL));
        curl_close($cURL);
        $results=json_decode($Response);//converting JSON response to array

        $elements_arr =$results->rows[0]->elements;
        $space_distance = array();
        $count=0;

        if ($results->status=='OK'){ 
        	foreach($elements_arr as $element){//looping through response recevied from distance matrix api
        		$space_distance[$destinations[$count][0]]= (float)preg_replace('/[^\d\.]/','',$element->distance->text);
        		$count++;        		
        	}
        }
	
        return $space_distance;
}
 


