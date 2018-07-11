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
