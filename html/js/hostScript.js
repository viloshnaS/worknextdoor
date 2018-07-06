


var URL ="http://localhost:80/services";


var arrHubPicture = [];

$("#hubPicture").change(function(e) {
  arrHubPicture = [];
    for(var i=0 ; i< e.target.files.length; i++){
      arrHubPicture.push(e.target.files[i].name)

    }
    var html= "";
    for(var j=0 ; j< arrHubPicture.length; j++){
      html += "<div class='one_quarter'>"
        html += "<img src='D:/Profiles/ddinhdieu/Downloads/brickary/images/demo/" + arrHubPicture[j] + "' alt=''>"
        html += "</div>"
    }
    $("#showImage").html(html);
});

function submitNewHub(lat, lng){
  var hubName = $("#hubName").val();
  var hubAddress = $("#hubAddress").val();
  var hubDescription = $("#hubDescription").val();
  var airCondition = $("#airCondition").is(':checked') ? 1:0;
  var printer = $("#printer").is(':checked') ? 1:0;
  var kitchen = $("#kitchen").is(':checked') ? 1:0;
  var heater = $("#heater").is(':checked') ? 1:0;
  var wifi = $("#wifi").is(':checked') ? 1:0;
  var parking = $("#parking").is(':checked') ? 1:0;

  var publicHoliday = $("#publicHoliday").is(':checked') ? 1:0;
  var weekend = $("#weekend").is(':checked') ? 1:0;

  var latitude = 0;
  var longitude = 0;

  var geocoder = new google.maps.Geocoder();
    var textAddress = document.getElementById('hubAddress').value;

    geocoder.geocode({ 'address': textAddress }, function (results, status) {
        if (status === 'OK') {
            latitude = results[0].geometry.location.lat();
            longitude = results[0].geometry.location.lng();
        }
    });

  var uploadData = {
    user_id : 7,
    name : hubName,
    address : hubAddress,
    latitude : parseFloat(lat),
    longitude : parseFloat(lng),
    description : hubDescription,
    aircon : airCondition,
    printer_scanner : printer,
    kitchen : kitchen,
    heater : heater,
    wifi : wifi,
    parking : parking,
    public_holidays : publicHoliday,
    weekends : weekend,
    picture : arrHubPicture.toString()
  }

  $.ajax({
        url : URL+'/host/createHub.php',
        type : 'POST',
        async: false,
        crossDomain: true,
      // dataType: 'jsonp',
        data: uploadData,
        success : function(responseData){ 
	var hubName = $("#hubName").val();
	var hubAddress = $("#hubAddress").val();
	var hubDescription = $("#hubDescription").val();
	var airCondition = $("#airCondition").is(':checked') ? 1:0;
	var printer = $("#printer").is(':checked') ? 1:0;
	var kitchen = $("#kitchen").is(':checked') ? 1:0;
	var heater = $("#heater").is(':checked') ? 1:0;
	var wifi = $("#wifi").is(':checked') ? 1:0;
	var parking = $("#parking").is(':checked') ? 1:0;

	var publicHoliday = $("#publicHoliday").is(':checked') ? 1:0;
	var weekend = $("#weekend").is(':checked') ? 1:0;

	var uploadData = {
		user_id : 7,
		name : hubName,
		address : hubAddress,
		latitude : parseFloat(lat),
		longitude : parseFloat(lng),
		description : hubDescription,
		aircon : airCondition,
		printer_scanner : printer,
		heater : heater,
		wifi : wifi,
		parking : parking,
		public_holidays : publicHoliday,
		weekends : weekend,
		picture : arrHubPicture.toString()
	}

	$.ajax({
       	url : URL+'/host/createHub.php',
       	type : 'POST',
       	async: false,
       	crossDomain: true,
	   	// dataType: 'jsonp',
       	data: uploadData,
       	success : function(responseData){ 
       		if(responseData > 0){
       			window.location="hubavailability.html?hub_id="+responseData;
       		} // Create successfully and return Hub ID
       		else{
       			console.log('Create hub failed');
       		}
        }, error : function(err){
          console.log(err);
       }

    });
}


function getHubInfo(id){
  $.ajax({
      url : URL+'/host/getHubById.php',
      type : 'GET',
      crossDomain: true,
      data: { hub_id:id } ,
      success : function(response){ // success est toujours en place, bien sûr !
          displayHubInfo(response);
      },
      error : function(resultat, statut, erreur){
      }
  });

function displayHubInfo(result){
  var hub = JSON.parse(result); // converting results to JSON object
      
     

       $("#hubName").val(hub.name);

};
}

function updateHub(hubId){
  $.ajax({
    url : URL+'/host/updateHub.php',
    type : ''
  })
}

function getListHubByUserId(userId){
  $.ajax({
        url : URL+'/spaces/getListHubByUserId.php',
        type : 'POST',
        async: false,
        crossDomain: true,
      // dataType: 'jsonp',
        data: {userId: userId},
        success : function(responseData){ 
          for(var i = 0; i < responseData.length; i++){
            // add list hub to select tag 
          }
	$.ajax({
       	url : URL+'/host/getHubList.php',
       	type : 'POST',
       	async: false,
       	crossDomain: true,
	   	// dataType: 'jsonp',
       	data: {userId: 7},
       	success : function(responseData){ 
       		var html = "";
       		for(var i = 0; i < responseData.length; i++){
       			// add list hub to select tag 
       			html = "<option value='" + responseData[i].hub_id + "'>" + responseData[i].name + "</option>"
       		}
        }, error : function(err){
          console.log(err);
       }

    });
}


  
