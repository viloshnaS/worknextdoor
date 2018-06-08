var URL ="http://localhost:80/services";

var months = [ "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December" ];

(function(globals){
  "use strict";
  globals.commutingTime = "cacads";
}(this));


function initHomePage() {

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
			dd='0'+dd
		} 
		if(mm<10){
			mm='0'+mm
		} 

	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("date").setAttribute("min", today);
};

function displayResultList( results){

		      var result_arr = JSON.parse(results);

          display_string ="";

          display_string = display_string+"<table>";

          result_arr.forEach(function(hub) {
            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+
            "<a href='viewSpace.html?space_id="+hub.space_id+"' data-transition='slide' data-ajax='false'>"+
            "<img class='thumbnail' src='img/"+hub.thumbnail+"'>"+
            "</a>"+
            "</td>";
            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td><b>"+hub.space_type_description+"</b></td>";
            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+hub.name+"</td>";
            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td> <i class='material-icons euro_icon'>euro_symbol</i>"+hub.price+" per "+hub.price_rate+"</td>";
            display_string = display_string+"/<tr>";
            
            display_string = display_string+"<tr>";

            if(!!hub.reviews_count){
              
              display_string = display_string+"<td><span class='stars-container stars-"+hub.rating+"''>★★★★★</span>("+hub.reviews_count+")</td>";
            }
            else{
              display_string = display_string+"<td>No user review</td>";
            }
            display_string = display_string+"/<tr>";
          });
          display_string =display_string +"</table>";
	

         $('#div_results').html(display_string);

};

function displayResultsThumbnail(response){


          var spaces = JSON.parse(response);

          display_string ="";

          display_string = display_string+"<table>";
          for (i = 0; i < spaces.length; i+=2) { 
    
            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+
            "<a href='viewSpace.html?space_id="+spaces[i].space_id+"' data-transition='slide' data-ajax='false'>"+
            "<img class='small_thumbnail' src='img/"+spaces[i].thumbnail+"'>"+
            "</a>"+
            "</td>";

            display_string = display_string+"<td>"+
            "<a href='viewSpace.html?space_id="+spaces[i+1].space_id+"' data-transition='slide' data-ajax='false'>"+
            "<img class='small_thumbnail' src='img/"+spaces[i+1].thumbnail+"'>"+
            "</a>"+
            "</td>";

            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td><b>"+spaces[i].space_type_description+"</b></td>";
            display_string = display_string+"<td><b>"+spaces[i+1].space_type_description+"</b></td>";
            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+spaces[i].name+"</td>";
            display_string = display_string+"<td>"+spaces[i+1].name+"</td>";
            display_string = display_string+"/<tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td> <i class='material-icons euro_icon'>euro_symbol</i>"+spaces[i].price+" per "+spaces[i].price_rate+"</td>";
            display_string = display_string+"<td> <i class='material-icons euro_icon'>euro_symbol</i>"+spaces[i+1].price+" per "+spaces[i+1].price_rate+"</td>";
            
            display_string = display_string+"/<tr>";
            
            display_string = display_string+"<tr>";
            display_string = display_string+"<td>Distance here</td>";
            display_string = display_string+"<td>Distance here</td>";
            display_string = display_string+"/<tr>";

          }
          display_string =display_string +"</table>";

           $('#div_results_thumbnail').html(display_string);


};

function initResultList(){

              var _latitude = $("#latitude").val();
                var _longitude = $("#longitude").val();
                var _space_rate = $("#space_rate").val();
                var _date_from = $("#date_from").val();
                var _date_to = $("#date_to").val();
                var _space_type = $("#space_type").val();
                var _capacity = $("#capacity").val();
                var _price_min = $("#price_min").val();
                var _price_max = $("#price_max").val();
                var _screen = $("#screen").val();
                var _projector = $("#projector").val();
                var _whiteboard = $("#whiteboard").val();
                var _wifi = $("#wifi").val();
                var _kitchen = $("#kitchen").val();
                var _parking = $("#parking").val();
                var _heater = $("#heater").val();
                var _air_con = $("#air_con").val();
                var _printer_scanner = $("#printer_scanner").val();

               
                fetchResults(_latitude,_longitude,_space_rate,_date_from,_date_to,
                  _space_type,_capacity,_price_min,_price_max,_screen,_projector,_whiteboard,
                  _wifi,_kitchen,_parking,_heater,_air_con,_printer_scanner,'list');
               

                

};

function fetchResults(_latitude,_longitude,_space_rate,_date_from,_date_to,
                  _space_type,_capacity,_price_min,_price_max,_screen,_projector,_whiteboard,
                  _wifi,_kitchen,_parking,_heater,_air_con,_printer_scanner,_display){

	$.ajax({
                   url : URL+'/spaces/getSpacesWithFilters.php',
                   type : 'GET',
                   data: { latitude:_latitude,
                          longitude:_longitude,
                          space_rate:_space_rate,
                          date_from:_date_from,
                          date_to:_date_to,
                          space_type:_space_type,
                          capacity:_capacity,
                          price_min:_price_min,
                          price_max:_price_max,
                          screen:_screen,
                          projector:_projector,
                          whiteboard:_whiteboard,
                          wifi:_wifi,
                          kitchen:_kitchen,
                          parking:_parking,
                          heater:_heater,
                          air_con:_air_con,
                          printer_scanner:_printer_scanner

                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !

                      if(_display=='list'){
          				
                         displayResultList(response);
                      }
                      else if(_display=='thumb'){
                        displayResultsThumbnail(response);
                      }
                  }
   					,

                   error : function(resultat, statut, erreur){

                   }

                });

};


function getSpaceDestails(id){
  $.ajax({
                   url : URL+'/spaces/getSpaceById.php',
                   type : 'GET',
                   data: { space_id:id } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                  
                         displaySpaceDetails(response);
                        }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

};

function displaySpaceDetails(results){

    var space = JSON.parse(results);
    var displayString ="";

    localStorage.setItem("SpaceDetails",results);

    var pictures = JSON.parse(space.pictures);

    displayString = displayString + "<p><div id='slideshow'>";

      pictures.forEach(function(picture) {

        displayString = displayString + "<div><img class='space_image' src='img/"+picture+"'></div>";

      });

 
         
     displayString = displayString + "</div></p> <br/><br/><br><br/><br/><br/><br/><br/>";

  
    if(space.space_type_id=='1'){
      displayString = displayString + "<h3>"+space.space_type_description+"</h3>";
    }
    else{
      displayString = displayString + "<h3>"+space.space_type_description+" : " 
      + space.number_of_guests+" guests</h3>";
    }
    
    displayString = displayString + "<h1>"+space.name+"</h1>";

    if(!!space.reviews_count){
      displayString = displayString + "<p> <span class='stars-container stars-"+space.rating+"'>★★★★★</span>("+space.reviews_count+")</p>";
    }
    else{
      displayString = displayString + "<p>No rating</p>"

    }
    displayString = displayString + "<p>"+space.address+"</p>";
    
   

    lat1=localStorage.getItem("latitude");
    long1=localStorage.getItem("longitude");
    lat2=space.latitude;
    long2=space.longitude;

    displayString = displayString + "<table>";

    displayString = displayString + "<tr>";

    displayString = displayString + "<td><div id='walk'></div></td>";    
    displayString = displayString + "<td><div id='bicycle'></div></td>";
     displayString = displayString + "</tr>";
    
     displayString = displayString + "<tr>";
     displayString = displayString + "<td><div id='drive'></div></td>";
    displayString = displayString + "<td><div id='transit'></div></td>";
    
     displayString = displayString + "</tr>";

    displayString = displayString + "</table>";


    displayString = displayString + "<h3>Price Rate : </h3>";

   
   

    space.pricing.forEach(function(price){

      displayString = displayString + "<p>"+price.description+": "+price.price+"<i class='material-icons euro_icon'>euro_symbol</i></p>";
      
    });
   

    displayString = displayString + "<h3>The venue : </h3>";
    displayString = displayString + "<p>"+space.hub_description+"</p>";
    displayString = displayString + "<p>Hosted by: "+space.firstname +" "+ space.lastname+"</p>";

    displayString = displayString + "<h3>Amenities : </h3>";

    displayString = displayString + "<table>";
    displayString = displayString + "<tr>";
    
    if(space.wifi=='1'){
      displayString = displayString + "<td class='available'> WIFI </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> WIFI </td>";
    }

    if(space.printer_scanner=='1'){
      displayString = displayString + "<td class='available'> Printer/Scanner </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Printer/Scanner </td>";
    }
    displayString = displayString + "</tr>";
    displayString = displayString + "<tr>";

    if(space.projector=='1'){
      displayString = displayString + "<td class='available'> Projector </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Projector </td>";
    }

    if(space.screen=='1'){
      displayString = displayString + "<td class='available'> Screen </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Screen </td>";
    }

     displayString = displayString + "</tr>";

     displayString = displayString + "<tr>";

    if(space.air_con=='1'){
      displayString = displayString + "<td class='available'> Air Conditioner </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Air Conditioner </td>";
    }

    if(space.heater=='1'){
      displayString = displayString + "<td class='available'> Heater </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Heater </td>";
    }

     displayString = displayString + "</tr>";


     displayString = displayString + "<tr>";

    if(space.kitchen=='1'){
      displayString = displayString + "<td class='available'> Kitchen </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Kitchen </td>";
    }

    if(space.parking=='1'){
      displayString = displayString + "<td class='available'> Parking </td>";
    }
    else{
      displayString = displayString + "<td class='notavailable'> Parking </td>";
    }

     displayString = displayString + "</tr>";

    displayString = displayString + "</table>";

   displayString = displayString +"<div>";
   displayString = displayString +"<iframe src='maps.html' width='250' height='150' seamless=''></iframe>";
   displayString = displayString +"</div>";

    if(!!space.reviews_count){
      displayString = displayString + "<a href='#popupReview' id='link_review' data-transition='slideup' class='ui-corner-all ui-shadow' data-rel='popup'>View Reviews("+space.reviews_count+")</a>";
    }
    else{
      displayString = displayString +"<p> No Reviews</p>";
    }

    displayString = displayString +"<input id='hub_lat' type='hidden' value='"+space.latitude+"'>";
    displayString = displayString +"<input id='hub_lng' type='hidden' value='"+space.longitude+"'>";

    $('#space_details').html(displayString);
    calculateTime(lat1,long1,lat2,long2,'WALKING');
    calculateTime(lat1,long1,lat2,long2,'BICYCLING');
    calculateTime(lat1,long1,lat2,long2,'TRANSIT');
    calculateTime(lat1,long1,lat2,long2,'DRIVING');



};

function calculateTime(lat1,long1,lat2,long2,mode){

            var origin = new google.maps.LatLng(lat1, long1);
            var destination = new google.maps.LatLng(lat2,long2);

            var service = new google.maps.DistanceMatrixService();
            var duration="";
            service.getDistanceMatrix(
                  {
                    origins: [origin],
                    destinations: [destination],
                    travelMode: mode,
                      drivingOptions: {
                        departureTime: new Date(Date.now()),
                        trafficModel: 'optimistic'
                      }
                  }, function(response,status){


                      var results = response.rows[0].elements;
                      duration = (results[0].duration.text);
                      duration =duration.replace("hours","H");
                      if(mode == 'WALKING'){
                        $("#walk").html("<i class='material-icons'>directions_walk</i> " +duration);
                      }
                      else if(mode == 'BICYCLING'){
                        $("#bicycle").html("<i class='material-icons'>directions_bike</i> " +duration);
                      }
                      else if(mode == 'DRIVING'){
                        $("#drive").html("<i class='material-icons'>directions_car</i> " +duration);
                      }
                      else{
                        $("#transit").html("<i class='material-icons'>directions_transit</i> " +duration);
                      }
                      

                    }
                  );

          

};

function getSpaceReviews(id){
  $.ajax({
                   url : URL+'/reviews/getSpaceReviews.php',
                   type : 'GET',
                   data: { space_id:id } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                  
                         displaySpaceReviews(response);
                        }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

};


function displaySpaceReviews(results){

   var result_arr = JSON.parse(results);

          display_string ="";

          

          result_arr.forEach(function(review) {
            var reviewDate = new Date(review.date_posted);
            display_string = display_string+"<table>";
            display_string = display_string+"<tr>";

            if(review.gender=='M'){
              display_string = display_string+"<td rowspan=2><img class='gender' src='img/boy.jpg'/></td>";

            }
            else{
              display_string = display_string+"<td rowspan=2><img class='gender'src='img/women.png'/></td>";
            }

            display_string = display_string+"<td><b>"+review.firstname+"</b><td>";
            display_string = display_string+"<td><td>";
            display_string = display_string+"</tr>";

            display_string = display_string+"<tr>";

            display_string = display_string+"<td>"+months[reviewDate.getMonth()] +" "+reviewDate.getFullYear()+"<td>";

            display_string = display_string+"<td><span class='stars-container stars-"+review.rating+"''>★★★★★</span></td>";

            display_string = display_string+"</tr>";

            display_string = display_string+"</table>";

            display_string = display_string+"<p>"+review.comment+"</p>";

            display_string = display_string+"<hr>";

          });

          $("#div_reviews").html(display_string);

};

function getNumberOfDays(date1,date2){

    var one_day = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return Math.round(difference_ms/one_day);


};

function createBooking(_space_id,_user_id,_date_from,_date_to,_space_rate,_unit_price,_duration){
  alert(_space_id);
  $.ajax({
                   url : URL+'/bookings/createBooking.php',
                   type : 'POST',
                   data: { space_id:_space_id,
                          user_id:_user_id,
                          date_from:_date_from,
                          date_to:_date_to,
                          space_rate:_space_rate,
                          unit_price:_unit_price,
                          duration:_duration
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !

                      
                      alert(response);
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}



