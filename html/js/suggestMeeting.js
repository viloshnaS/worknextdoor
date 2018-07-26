function rad2degr(rad) { return rad * 180 / Math.PI; }
function degr2rad(degr) { return degr * Math.PI / 180; }

/**
 * @param latLngInDeg array of arrays with latitude and longitude
 *   pairs in degrees. e.g. [[latitude1, longitude1], [latitude2
 *   [longitude2] ...]
 *
 * @return array with the center latitude longitude pairs in 
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

    // convert average x, y, z coordinate to latitude and longitude
    var lng = Math.atan2(avgY, avgX);
    var hyp = Math.sqrt(avgX * avgX + avgY * avgY);
    var lat = Math.atan2(avgZ, hyp);

    return ([rad2degr(lat), rad2degr(lng)]);
}


function addInputLocation(){
	var currNoOfInput = parseInt($('#numbOfBar').text());

	var addInput = "";
	addInput += "<div class='block clear'>"
	addInput += 	"<label for='comment' style='font-weight: bold;'>Location " + (currNoOfInput + 1) + "</label>"
	addInput += 	"<input type='text' class='controls inputBar' name='url' id='location-" + (currNoOfInput + 1) + "' value='' size='22' required>"
	addInput += 	"<div id='map-" + (currNoOfInput + 1) + "' style='display: none'></div>"
	addInput += 	"<div id='lat-" + (currNoOfInput + 1) + "' style='display: none'></div>"
	addInput += 	"<div id='lng-" + (currNoOfInput + 1) + "' style='display: none'></div>"
	addInput += "</div>"

	$('#listInputLocation').append(addInput);


	var addJS = "";

	addJS += "var map" + (currNoOfInput + 1) + " = new google.maps.Map(document.getElementById('map-" + (currNoOfInput + 1) + "'), {" ;
    addJS += "center: {lat: -33.8688, lng: 151.2195}, zoom: 13, mapTypeId: 'roadmap' });"

	addJS += "var input" + (currNoOfInput + 1) + " = document.getElementById('location-" + (currNoOfInput + 1) + "');"
	addJS += "var searchBox" + (currNoOfInput + 1) + " = new google.maps.places.SearchBox(input" + (currNoOfInput + 1) + ");"
	addJS += "map" + (currNoOfInput + 1) + ".controls[google.maps.ControlPosition.TOP_LEFT].push(input" + (currNoOfInput + 1) + ");"
	addJS += "searchBox" + (currNoOfInput + 1) + ".addListener('places_changed', function() {"
	addJS += "    $('#txtErr').html('Please enter locations');"
    addJS += "    var places = searchBox" + (currNoOfInput + 1) + ".getPlaces();"
    addJS += "    if (places.length == 0) { return;}"
    addJS += "    var bounds = new google.maps.LatLngBounds();"
    addJS += "    places.forEach(function(place) { if (!place.geometry) { return;}"
    addJS += "        else{ var latitude = place.geometry.location.lat(); var longitude = place.geometry.location.lng();"
    addJS += "          	$('#lat-" + (currNoOfInput + 1) + "').html(latitude); $('#lng-" + (currNoOfInput + 1) + "').html(longitude);"
	addJS += "		} }); });"

	eval(addJS);

	$('#numbOfBar').text((currNoOfInput + 1));
}


function submitLocation(){
	
	var listInputCoord = [];
	var inputCoordTxt = "";
	var currNoOfInput = parseInt($('#numbOfBar').text());


	for (var i = 0; i < currNoOfInput; i++) {
		inputCoordTxt += "var location" + (i + 1) + "= $('#location-" + (i + 1) + "').val();";
		inputCoordTxt += "var lat" + (i + 1) + "= parseFloat($('#lat-" + (i + 1) + "').text());";
		inputCoordTxt += "var lng" + (i + 1) + "= parseFloat($('#lng-" + (i + 1) + "').text());";
		inputCoordTxt += "if( !isNaN(lat" + (i + 1) + ") && !isNaN(lng" + (i + 1) + ") && location" + (i + 1) + " != ''){"
		inputCoordTxt += "var coord" + (i + 1) + " = { lat: lat" + (i + 1) + ", lng: lng" + (i + 1) + "};";
		inputCoordTxt += "listInputCoord.push(coord" + (i + 1) + ");"
		inputCoordTxt += "}"
	}

	eval(inputCoordTxt);

	if(listInputCoord.length == 0){
		$("#txtErr").html("Please enter locations");
		return;
	}

	$("#comments").slideToggle('fast');
	$("#resultSuggestion").show();
	$("#listResultSpaceSuggestion").html("");

	var midPoint = getLatLngCenter(listInputCoord);

	var dataLocation = "";
	dataLocation += "var locations = [";
	for (var i = 0; i < listInputCoord.length - 1; i++) {
		dataLocation += "[lat" + (i + 1) + ",lng" + (i + 1) + "],";
	}
	dataLocation += "[lat" + listInputCoord.length + ",lng" + listInputCoord.length + "]";
	dataLocation += "];";

	eval(dataLocation);

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
       			var dist = getDistanceFromLatLngInKm(midPoint[0], midPoint[1], responseData[i].latitude, responseData[i].longitude);
       			if( dist <= 3){ // Choose hubs with 5km around midpoint
       				hubInRadius.push(responseData[i]);	
       			}
       		}
       		
       		var list_hub_id = [];
			for( var i = 0; i< hubInRadius.length; i++){
				list_hub_id.push(hubInRadius[i].hub_id);
			}
			$.ajax({
		       	url : URL+'/meetingSuggestion/getListSpaceByListHubId.php',
		       	type : 'GET',
		       	async: false,
		       	crossDomain: true,
		       	data: {list_hub_id : list_hub_id},
		       	success : function(responseData){ 
		       		responseData = JSON.parse(responseData);
		       		// displaySuggestedSpace(locations, midPoint, hubInRadius, responseData);
		       		var html = "";
		       		var destination = [];
		       		var arrResponseTravelTime = [];
		       		for (var m = 0; m < listInputCoord.length; m++) {
		       			destination.push(new google.maps.LatLng(listInputCoord[m].lat, listInputCoord[m].lng));
		       		}
		       			
					for (var i = 0; i < responseData.length; i++) {
						html += "<div class='block clear' style='margin-bottom: 30px;'>"
					    html += "<div class='block clear'><img src='img/" + responseData[i].thumbnail_picture + "' alt='' style='height: 150px; width: 100%; cursor: pointer' onclick='viewSpace("+ responseData[i].space_id +")'></div>"
					    html += "<div class='block clear'><span>" + (responseData[i].space_type = 1 ? 'Workdesk': 'Conference room') + "</span></div>"
					    html += "<div class='block clear' style='font-weight: bold;'><span>" + responseData[i].space_name + "</span></div>"
					    html += "<div class='block clear'><span>€9 per hour</span></div>"
					    html += "<div class='block clear'><span class='block clear'>Distance:</span></div>";
					    html += "<div class='block clear' id='travelTime-" + i + "'></div>";
				
						for (var j = 0; j < hubInRadius.length; j++) {
							if(responseData[i].hub_id == hubInRadius[j].hub_id){
								var origin = new google.maps.LatLng(hubInRadius[j].latitude, hubInRadius[j].longitude);
							    var service = new google.maps.DistanceMatrixService();
							    var duration = 0;
							    var currSpaceId = responseData[i].space_id;
							    service.getDistanceMatrix({
								    origins: [origin],
								    destinations: destination,
								    // travelMode: mode,
								    travelMode: 'DRIVING',
								      	drivingOptions: {
								            departureTime: new Date(Date.now()),
								            trafficModel: 'optimistic'
								      	}
								  	}, function(response,status){
								      	var results = response.rows[0].elements;
								      	arrResponseTravelTime.push(results);
									}
								);
								
							}
						}
						html += "</div>"
					}
					$('#listResultSpaceSuggestion').html(html);

					setTimeout(function(){
						for (var p = 0; p < arrResponseTravelTime.length; p++) {
							var txt = "";
					      	for (var k = 0; k < arrResponseTravelTime[p].length; k++) {
					      		txt += "<div class='block clear one_half'>Location " + (k+1) + ": " + arrResponseTravelTime[p][k].duration.text + "</div>";
					      	}
					      	$("#travelTime-" + p).html(txt);
						}
					}, 3000);
					for (var l = 0; l < hubInRadius.length; l++) {
						var addCoord = [];
						addCoord.push(hubInRadius[l].latitude);
						addCoord.push(hubInRadius[l].longitude);
						locations.push(addCoord);
					}
						
				    var map = new google.maps.Map(document.getElementById('map'), {
				      	zoom: 12,
				      	center: new google.maps.LatLng(midPoint[0], midPoint[1]),
				      	mapTypeId: google.maps.MapTypeId.ROADMAP
				    });

				    var infowindow = new google.maps.InfoWindow();

				    var marker, q;

				    for (q = 0; q < listInputCoord.length; q++) {  
				      	marker = new google.maps.Marker({
					        position: new google.maps.LatLng(locations[q][0], locations[q][1]),
					        map: map
				      	});
				      
				    }

				    for (q = listInputCoord.length; q < locations.length; q++) {  
				      	marker = new google.maps.Marker({
					        position: new google.maps.LatLng(locations[q][0], locations[q][1]),
					        map: map,
					        icon: {
						      	url: 'img/icon.png',
						      	scaledSize: new google.maps.Size(40, 40), // scaled size
							    origin: new google.maps.Point(0,0), // origin
							    anchor: new google.maps.Point(0, 0) // anchor
						    },
				      	});
				      
				    }

		        }, error : function(err){
		        	console.log(err);
		       	}

		    });
        }, error : function(err){
        	console.log(err);
       	}

    });
}

function viewSpace(spaceId){
	window.location.href = "viewSpace.html?space_id=" + spaceId;
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
	var elementLength = array[0].length;
  for(var i = 0; i < array.length; i++) {
    var min = i;
    for(var j = i + 1; j < array.length; j++) {
      if(array[j][elementLength - 1] < array[min][elementLength - 1]) {
        min = j;
      }
    }
    if(i !== min) {
      swap(array, i, min);
    }
  }
  return array;
}

function maxDiff(arr){
	var maxDiff = 0;
	for (var i = 1; i < arr.length - 1; i++) { // Bcuz the first element in arr is hub infor
		for (var j = i + 1; j < arr.length; j++) {
			var diff = Math.abs(arr[i] - arr[j]);
			if( diff > 0) maxDiff = diff;
		}
	}
	return maxDiff;
}

function backToInputLocation(){
	$("#comments").slideToggle('fast');
	$("#resultSuggestion").hide();
}