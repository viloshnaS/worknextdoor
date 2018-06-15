<?php

//echo getDistance(43.5647,1.59421,43.6447,1.54421);
function getDistance($lat1,$lng1,$lat2,$lng2)
{

		$sURL = 'http://maps.googleapis.com/maps/api/distancematrix/json';
		$sQueryString='origins='.$lat1.','.$lng1.'&destinations='.$lat2.'%2C'.$lng2.'&mode=driving&units=metric&sensor=false';
	
        $cURL=curl_init();
        curl_setopt($cURL,CURLOPT_URL,$sURL.'?'.$sQueryString);
        curl_setopt($cURL,CURLOPT_RETURNTRANSFER, TRUE);
        $Response=trim(curl_exec($cURL));
        curl_close($cURL);

        $JSON=json_decode($Response);

        $distance="";

        if ($JSON->status=='OK'){
        	$distance=(float)preg_replace('/[^\d\.]/','',$JSON->rows[0]->elements[0]->distance->text);
        }
		else{
        	$distance=0;
		}

        return $distance;
}
 


