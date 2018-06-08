function initMap() {
       var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 43.60627481, lng:1.44812791},
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
            
            getNearbySpaces(pos.lat,pos.lng);

           
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
              document.getElementById("latitude").value=place.geometry.location.lat();
              document.getElementById("longitude").value=place.geometry.location.lng();
            }
          });
      });
      
    }

  };

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      };

      function getNearbySpaces(latitude,longitude){
         fetchResults(latitude,longitude,null,null,null,null,1,null,null,null,null,null,null,null,null,null,null,null,'thumb');
      };

      function displayHubLocation() {
        var myLatLng = {lat: 43.6447, lng: 1.54421};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
        });
      }