function initMap() {

       var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
  
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
              localStorage.setItem("myLatitude",pos.lat);
              localStorage.setItem("myLongitude",pos.lng);
            
         

                  
          

           
        });

        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); 

        var markers = [];
        // SearchBox listen to the changes
        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
              return;
            }
           

            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
              if (!place.geometry) {
                alert("no");
                return;
            }

            else{
              localStorage.setItem("latitude",place.geometry.location.lat());
              localStorage.setItem("longitude",place.geometry.location.lng());

               window.location="viewResults.html?display=search";
              

            }
          });
      });
      
    }

  };

  function changeLocation() {
       var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 43.60627481, lng:1.44812791},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); 

        var markers = [];
        // SearchBox listen to the changes
        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
              return;
            }
           

            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
              if (!place.geometry) {
                alert("no");
                return;
            }
            else{

              localStorage.setItem("latitude",place.geometry.location.lat());
              localStorage.setItem("longitude",place.geometry.location.lng());
              initResultList();
            }
          });
      });
      
    };

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      };

      function getNearbySpaces(latitude,longitude){
         fetchResults(latitude,longitude,null,null,null,null,1,0,1000,null,null,null,null,null,null,null,null,null,'thumb');
      };

    