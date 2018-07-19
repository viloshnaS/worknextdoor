

function rad2degr(rad) { return rad * 180 / Math.PI; }
function degr2rad(degr) { return degr * Math.PI / 180; }

/**
 * @param latLngInDeg array of arrays with latitude and longtitude
 *   pairs in degrees. e.g. [[latitude1, longtitude1], [latitude2
 *   [longtitude2] ...]
 *
 * @return array with the center latitude longtitude pairs in 
 *   degrees.
 */
function getLatLngCenter(latLngInDegr) {
    var sumX = 0;
    var sumY = 0;
    var sumZ = 0;

    for (var i=0; i<latLngInDegr.length; i++) {
        var lat = degr2rad(latLngInDegr[i].lat);
        var lng = degr2rad(latLngInDegr[i].lng);
        // sum of cartesian coordinates
        sumX += Math.cos(lat) * Math.cos(lng);
        sumY += Math.cos(lat) * Math.sin(lng);
        sumZ += Math.sin(lat);
    }

    var avgX = sumX / latLngInDegr.length;
    var avgY = sumY / latLngInDegr.length;
    var avgZ = sumZ / latLngInDegr.length;

    // convert average x, y, z coordinate to latitude and longtitude
    var lng = Math.atan2(avgY, avgX);
    var hyp = Math.sqrt(avgX * avgX + avgY * avgY);
    var lat = Math.atan2(avgZ, hyp);

    return ([rad2degr(lat), rad2degr(lng)]);
}


function addInputLocation(){

}

function submitLocation(){
	var lat1 = parseFloat($('#lat-1').text());
	var lng1 = parseFloat($('#lng-1').text());
	var lat2 = parseFloat($('#lat-2').text());
	var lng2 = parseFloat($('#lng-2').text());
	var lat3 = parseFloat($('#lat-3').text());
	var lng3 = parseFloat($('#lng-3').text());
	var listInputCoord = [];
	var coord1 = {
		lat: lat1,
		lng: lng1
	}
	var coord2 = {
		lat: lat2,
		lng: lng2
	}
	var coord3 = {
		lat: lat3,
		lng: lng3
	}
	listInputCoord.push(coord1);
	listInputCoord.push(coord2);
	listInputCoord.push(coord3);
	var midPoint = getLatLngCenter(listInputCoord);

	// List distance with hub info
	var hubInRadius = [];
	// Get list hub
	$.ajax({
       	url : URL+'/meetingSuggestion/getListHub.php',
       	type : 'GET',
       	async: false,
       	crossDomain: true,
       	data: {},
       	success : function(responseData){ 
       		responseData = JSON.parse(responseData);
       		for(var i = 0; i < responseData.length; i++){
       			// Calculate distance from midpoint to each hub
       			var dist = getDistanceFromLatLngInKm(midPoint[0], midPoint[1], responseData[i].latitude, responseData[i].longtitude);
       			if( dist < 5){ // Choose hubs with 5km around midpoint
       				// var data = {
	       			// 	distance: dist,
	       			// 	hub: responseData[i]
       				// }
       				// hubInRadius.push(data);
       				hubInRadius.push(responseData[i]);	
       			}

       			// Calculate distance from choosed hubs to each participant
       			for(var j = 0; j < hubInRadius.length; j++){
       				
       			}
       			
       		}

        }, error : function(err){
        	console.log(err);
       }

    });



	var locations = [
      [lat1,lng1],
      [lat2,lng2],
      [lat3,lng3],
      midPoint
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 13,
      center: new google.maps.LatLng(midPoint[0], midPoint[1]),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][0], locations[i][1]),
        map: map
      });
      
    }
}


function getDistanceFromLatLngInKm(lat1,lng1,lat2,lng2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1); 
  var dLon = deg2rad(lng2-lng1); 
  var a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
    ; 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; // Distance in km
  return d;
}

function deg2rad(deg) {
  return deg * (Math.PI/180)
}

// Sorting helper
function swap(array, i, j) {
  var temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

function selectionSort(array) {
  for(var i = 0; i < array.length; i++) {
    var min = i;
    for(var j = i + 1; j < array.length; j++) {
      if(array[j] < array[min]) {
        min = j;
      }
    }
    if(i !== min) {
      swap(array, i, min);
    }
  }
  return array;
}