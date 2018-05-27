function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 15,
		center: new google.maps.LatLng(43.60627481, 1.44812791),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	});
	// Create the search box
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	// Result
	map.addListener('bounds_changed', function() {
	  searchBox.setBounds(map.getBounds());
	});

	var markers = [];
	// SearchBox listen to the changes
	searchBox.addListener('places_changed', function() {
	  var places = searchBox.getPlaces();

	  if (places.length == 0) {
		return;
	  }

	  // Clear out the old markers.
	  // markers.forEach(function(marker) {
		// marker.setMap(null);
	  // });
	  // markers = [];
	  // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
	
	
	var loc1 = {
		info: '<strong>Toulouse Co-working 1</strong><br>\
					31 rue de Peri<br> Toulouse, TL 31000<br>\
					<a href="#">Get Directions</a>',
		lat: 43.60529837,
		lng: 1.45179643
	};

	var loc2 = {
		info: '<strong>Co-working space 2</strong><br>\
					10 rue Jean Jaures<br> Toulouse, TL 31000<br>\
					<a href="#">Get Directions</a>',
		lat: 43.60434814,
		lng: 1.44057481
	};

	var loc3 = {
		info: '<strong>Co-working space 2</strong><br>\r\
					199 rue de Francoise Verdier <br> Toulouse, TL 31000<br>\
					<a href="#">Get Directions</a>',
		lat: 43.60055677,
		lng: 1.4472696
	};

	var locations = [
      [loc1.info, loc1.lat, loc1.lng, 0],
      [loc2.info, loc2.lat, loc2.lng, 1],
      [loc3.info, loc3.lat, loc3.lng, 2],
    ];

	

	var infowindow = new google.maps.InfoWindow({});

	var marker, i;

	for (i = 0; i < locations.length; i++) {
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			map: map
		});

		google.maps.event.addListener(marker, 'click', (function (marker, i) {
			return function () {
				infowindow.setContent(locations[i][0]);
				infowindow.open(map, marker);
			}
		})(marker, i));
	}
}
