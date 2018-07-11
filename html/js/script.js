var URL ="http://localhost:80/services";

var months = [ "Jan", "Feb", "Mar", "Apr", "May", "June",
    "July", "Aug", "Sep", "Oct", "Nov", "Dec" ];



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


