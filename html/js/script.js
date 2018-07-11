var URL ="http://localhost:80/services";

var months = [ "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December" ];



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
         
          $('#div_results').html(results);
          var result_arr = JSON.parse(results);

          display_string ="";

          display_string = display_string+"<table>";


          result_arr.forEach(function(hub) {
            display_string = display_string+"<tr >";
            display_string = display_string+"<td class='list_thumb'>";
            display_string = display_string+"<table>";
            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+
            "<a href='viewSpace.html?space_id="+hub.space_id+"' data-transition='slide' data-ajax='false'>"+
            "<img class='thumbnail' src='img/"+hub.thumbnail+"'>"+
            "</a>"+
            "</td>";
            display_string = display_string+"</tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td><b>"+hub.space_type_description+"</b></td>";
            display_string = display_string+"</tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+hub.name+"</td>";
            display_string = display_string+"</tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td> <i class='material-icons euro_icon'>euro_symbol</i>"+hub.price+" per "+hub.price_rate+"</td>";
            display_string = display_string+"</tr>";

            display_string = display_string+"<tr>";
            display_string = display_string+"<td>Distance : "+hub.distance+" Km</td>";
            display_string = display_string+"</tr>";
            
            display_string = display_string+"<tr>";

            if(!!hub.reviews_count){
              
              display_string = display_string+"<td><span class='stars-container stars-"+hub.rating+"''>★★★★★</span>("+hub.reviews_count+")</td>";
            }
            else{
              display_string = display_string+"<td>No user review</td>";
            }
            display_string = display_string+"</tr>";

            display_string = display_string+"</table>";
            display_string = display_string+"</td>";
            display_string = display_string+"</tr>";
          });
          display_string =display_string +"</table>";
  

         $('#div_results').html(display_string);

};


function getDisplayStringThumbnail(space){

  display_string ="";
  display_string = display_string+"<table>";
  display_string = display_string+"<tr>";
  var height = Number($(window).height())*10/100;
  var width = Number($(window).width())*35/100;
  display_string = display_string+"<tr><td>" +
  "<a href='viewSpace.html?space_id="+space.space_id+"' data-transition='slide' data-ajax='false'>"+
  "<img class='small_thumbnail' src='img/"+space.thumbnail+"' width='"+width+"' height='"+height+"'>"+
  "</a>"+
  "</td>";

  display_string = display_string+"</tr>";

  display_string = display_string+"<tr>";
  display_string = display_string+"<td>"+space.space_type_description+"</td>";
  display_string = display_string+"</tr>";

  display_string = display_string+"<tr>";
  display_string = display_string+"<th>"+space.name+"</th>";
  display_string = display_string+"</tr>";

  display_string = display_string+"<tr>";
  display_string = display_string+"<td> <i class='material-icons euro_icon'>euro_symbol</i>"+space.price+" per "+space.price_rate+"</td>";
  display_string = display_string+"</tr>";

  display_string = display_string+"<tr>";
  display_string = display_string+"<td>Distance : "+space.distance+" Km</div></td>";
  display_string = display_string+"</tr>";

  display_string = display_string+"</table>";

  return display_string;


  
};



function displayResultsThumbnail(response){
          
          var spaces = JSON.parse(response);


          display_string ="";

          

          display_string = display_string+"<table width='100%'>";
          for (i = 0; i <= 2; i+=2) { 
    
            display_string = display_string+"<tr>";
            display_string = display_string+"<td class='thumb'>" +getDisplayStringThumbnail(spaces[i])+"</td>";
            display_string = display_string+"<td class='thumb'>" +getDisplayStringThumbnail(spaces[i+1])+"</td>";
            display_string = display_string+"</tr>";
          }
          display_string =display_string +"<tr><td><a href='viewResults.html> View More </a></td></tr>";
          display_string =display_string +"</table>";

           $('#div_results_thumbnail').html(display_string);


};

function initResultList(){



                var _latitude = localStorage.getItem("latitude");
                var _longitude = localStorage.getItem("longitude");
                var _space_rate = localStorage.getItem("space_rate");
                var _date_from = localStorage.getItem("date_from");
                var _date_to = localStorage.getItem("date_to");
                var _space_type = localStorage.getItem("space_type");
                var _capacity = localStorage.getItem("capacity");
                var _price_min = localStorage.getItem("price_min");
                var _price_max = localStorage.getItem("price_max");
                var _screen = localStorage.getItem("screen");
                var _projector = localStorage.getItem("projector");
                var _whiteboard = localStorage.getItem("whiteboard");
                var _wifi = localStorage.getItem("wifi");
                var _kitchen = localStorage.getItem("kitchen");
                var _parking = localStorage.getItem("parking");
                var _heater = localStorage.getItem("heater");
                var _air_con = localStorage.getItem("aircon");
                var _printer_scanner = localStorage.getItem("printer_scanner");

               
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
                   async: false,
                   crossDomain: true,
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

                      localStorage.setItem("resultList",response);
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
                   url : URL+'/spaces/getSpaceById.php', // URL of Web Service
                   type : 'GET', //web Service method
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { space_id:id } , // the parameters
                   success : function(response){ 
                    // is request is a success, this block is executed
                  
                         displaySpaceDetails(response);
                        }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

};


function displaySpaceDetails(results){



    var space = JSON.parse(results);
    var displayString ="";

    localStorage.setItem("SpaceDetails",results);

    var pictures = JSON.parse(space.pictures);

    var height = Number($(window).height())*40/100;

  
   displayString = displayString +"<iframe class='picture_frame' src='slideshow.html' scrolling='no' height='"+height+"px' seamless=''></iframe>";


    displayString = displayString + "<div class='relative'>";
    if(space.space_type_id=='1'){
      displayString = displayString + "<p><h3>"+space.space_type_description+"</h3></p>";
    }
    else{
      displayString = displayString + "<p><h3>"+space.space_type_description+" : " 
      + space.number_of_guests+" guests</h3></p>";
    }
    
    displayString = displayString + "<p><h2>"+space.name+"</h2></p>";

    if(!!space.reviews_count){
      displayString = displayString + "<p> <span class='stars-container stars-"+space.rating+"'>★★★★★</span>("+space.reviews_count+")</p>";
    }
    else{
      displayString = displayString + "<p>No rating</p>"

    }

    displayString = displayString + "<hr>";

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

     displayString = displayString + "<hr>";


    displayString = displayString + "<p><h3>Price Rate : </h3></p>";

   
   

    space.pricing.forEach(function(price){

      displayString = displayString + "<p>"+price.description+": "+price.price+"<i class='material-icons euro_icon'>euro_symbol</i></p>";
      
    });

     displayString = displayString + "<hr>";
   

    displayString = displayString + "<p><h3>The venue : </h3></p>";
    displayString = displayString + "<p>"+space.hub_description+"</p>";
    displayString = displayString + "<table>";
    displayString = displayString + "<tr>";


    displayString = displayString + "<td>Hosted by: "+space.firstname+"</td>";
    if(space.user_picture!=''){
              displayString = displayString+"<td><img class='user_image' src='img/user/"+space.user_picture+"'/></td>";
            }
            else{
              displayString = displayString+"<td><img class='user_image'src='img/generic.jpg'/></td>";
            }
    displayString = displayString + "</tr>";
    displayString = displayString + "</table>";

    displayString = displayString + "<hr>";

    displayString = displayString + "<h3>Amenities : </h3>";

    displayString = displayString + "<table>";
    displayString = displayString + "<tr>";
    
    if(space.wifi=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>WIFI </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i> WIFI </td>";
    }

    if(space.printer_scanner=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Printer/Scanner </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Printer/Scanner </td>";
    }
    displayString = displayString + "</tr>";
    displayString = displayString + "<tr>";

    if(space.projector=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Projector </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Projector </td>";
    }

    if(space.screen=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Screen </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Screen </td>";
    }

     displayString = displayString + "</tr>";

     displayString = displayString + "<tr>";

    if(space.air_con=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Air Conditioner </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Air Conditioner </td>";
    }

    if(space.heater=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Heater </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Heater </td>";
    }

     displayString = displayString + "</tr>";


     displayString = displayString + "<tr>";

    if(space.kitchen=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Kitchen </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Kitchen </td>";
    }

    if(space.parking=='1'){
      displayString = displayString + "<td> <i class='material-icons check_icon'>done</i>Parking </td>";
    }
    else{
      displayString = displayString + "<td><i class='material-icons close_icon'>close</i>Parking </td>";
    }

     displayString = displayString + "</tr>";

    displayString = displayString + "</table>";

    var height = Number($(window).height())*60/100;

   displayString = displayString +"<iframe height='"+height+"px' class='map_frame' src='maps.html'></iframe>";

    if(!!space.reviews_count){
      displayString = displayString + "<a href='#popupReview' id='link_review' data-transition='slideup' class='ui-corner-all ui-shadow' data-rel='popup'>View Reviews("+space.reviews_count+")</a>";
    }
    else{
      displayString = displayString +"<p> No Reviews</p>";
    }

    displayString = displayString +"<input id='hub_lat' type='hidden' value='"+space.latitude+"'>";
    displayString = displayString +"<input id='hub_lng' type='hidden' value='"+space.longitude+"'>";
    displayString = displayString + "</div>";
    displayString = displayString + "<br/><br/><br/><br/><br/>";
    $('#space_details').html(displayString);
    calculateTime(lat1,long1,lat2,long2,'WALKING');
    calculateTime(lat1,long1,lat2,long2,'BICYCLING');
    calculateTime(lat1,long1,lat2,long2,'TRANSIT');
    calculateTime(lat1,long1,lat2,long2,'DRIVING');



};

function populateSlideshow(){

  var results=localStorage.getItem("SpaceDetails");
  var space = JSON.parse(results);
  var pictures =JSON.parse(space.pictures);


    displayString = "<div id='slideshow'>";

      pictures.forEach(function(picture) {
        displayString = displayString + "<div>";  

        displayString = displayString + "<img class='space_image' src='img/"+picture+"'>";
        displayString = displayString + "</div>";
      });
 
         
     displayString = displayString + "</div>";

     return displayString;


}

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

function calculateDistance(lat1,long1,lat2,long2,id){


            var origin = new google.maps.LatLng(lat1, long1);
            var destination = new google.maps.LatLng(lat2,long2);

            var service = new google.maps.DistanceMatrixService();
            var distance="";
            service.getDistanceMatrix(
                  {
                    origins: [origin],
                    destinations: [destination],
                    travelMode: 'DRIVING'
                  }, function(response,status){


                      var results = response.rows[0].elements;
                      distance = (results[0].distance.text);
                    
                        $("#distance_"+id).html(distance);
                      

                    }
                  ); 

};



function getSpaceReviews(id){
  $.ajax({
                   url : URL+'/reviews/getSpaceReviews.php',
                   type : 'GET',
                   crossDomain: true,
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
          var result_arr = JSON.parse(results); // converting results to JSON object
          display_string ="";
          result_arr.forEach(function(review) { //looping through JSON array
            var reviewDate = new Date(review.date_posted);
            display_string = display_string+"<table>";
            display_string = display_string+"<tr>"; 
            if(review.picture!=''){
              display_string = display_string+"<td rowspan=2><img class='user_image' src='img/user/"+review.picture+"'/></td>";
            }
            else{
              display_string = display_string+"<td rowspan=2><img class='user_image'src='img/generic.jpg'/></td>";
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
          $("#div_reviews").html(display_string); // displaying the HTML string in a div
};


function getNumberOfDays(date1,date2){

    var one_day = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return (Math.round(difference_ms/one_day))+1;


};

function createBooking(_space_id,_user_id,_date_from,_date_to,_space_rate,_unit_price,_duration,_name){

  $.ajax({
                   url : URL+'/bookings/createBooking.php',
                   type : 'POST',
                   crossDomain: true,
                   data: { space_id:_space_id,
                          user_id:_user_id,
                          date_from:_date_from,
                          date_to:_date_to,
                          space_rate:_space_rate,
                          unit_price:_unit_price,
                          hub_name:_name,
                          duration:_duration
                          
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      localStorage.setItem("booking_id",response);
                
                      window.location="bookingConfirmation.html";
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}


function getAvailableDates(_space_id){
  localStorage.setItem("booked_dates","");

  return $.ajax({
                   url : URL+'/bookings/getAvailableDates.php',
                   type : 'GET',
                   crossDomain: true,
                   data: { space_id:_space_id
                          
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      localStorage.setItem("booked_dates",response);
                    
                     
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}
function clearfilters(){
                  localStorage.setItem("latitude",localStorage.getItem("myLatitude"));
                  localStorage.setItem("longitude",localStorage.getItem("myLongitude"));
                  localStorage.setItem("space_rate","");
                  localStorage.setItem("date_from","");
                  localStorage.setItem("duration","");
                  localStorage.setItem("date_to","");
                  localStorage.setItem("space_rate","");
                  localStorage.setItem("space_type","");
                  localStorage.setItem("capacity","1");
                  localStorage.setItem("price_min","0");
                  localStorage.setItem("price_max","1000");

                  localStorage.setItem("screen","");
                  localStorage.setItem("projector","");

                  localStorage.setItem("whiteboard","");
                  localStorage.setItem("parking","");

                  localStorage.setItem("kitchen","");
                  localStorage.setItem("heater","");
                  localStorage.setItem("wifi","");


                  localStorage.setItem("air_con","");
                  localStorage.setItem("printer_scanner","");  
}

function addHubAvailability(_hub_id,_selectedDates){
  localStorage.setItem("booked_dates","");
  alert(_selectedDates);

  return $.ajax({
                   url : URL+'/host/addHubAvailability.php',
                   type : 'POST',
                   crossDomain: true,
                   data: { hub_id:_hub_id,
                          selectedDates:_selectedDates
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      if(response =="1"){
                        window.location="hostSpace.html?hub_id="+_hub_id;
                        //alert("Dates successfully added");
                      }
                      else{
                        alert("Dates not added. Please try later");
                      }
                    
                     
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}


function getSpaceList(id){
  $.ajax({
                   url : URL+'/host/getHubList.php',
                   type : 'GET',
                   crossDomain: true,
                   data: { user_id:id } ,
                   success : function(response){ // success est toujours en place, bien sûr !
              
              
                         displayhostHubList(response);
                        }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

};

function displayhostHubList(results){

      var result_arr = JSON.parse(results); // converting results to JSON object
      display_string ="";
      result_arr.forEach(function(hub) { 
          display_string = display_string+"<ul class='accordion-menu' onclick='toggleHubList(this)'>"+hub.name +"<i class='fa fa-chevron-down' ></i><li>";
          display_string = display_string+"<a href='modifyHub.html?hub_id="+hub.hub_id+"'></a>";
          hub.spaces.forEach(function(space) {
            display_string = display_string+"<ul class='submenuItems' style='display:none'><li>";
            display_string = display_string+"<a href='modifySpace.html?space_id="+space.space_id+"'><span>";
            display_string = display_string+space.space_name+ "</span>";
            display_string = display_string+"</a>"; 
            display_string = display_string+"</li></ul>";
          });
          display_string = display_string+"</li></ul>";

       });

       $("#host_spaces").html(display_string);

};

function toggleHubList(tagg){
  jQuery(tagg).find("ul").slideToggle();
}


