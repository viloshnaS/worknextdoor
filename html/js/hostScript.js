


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

        }, error : function(err){
        	console.log(err);
       }

    });
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
        }, error : function(err){
        	console.log(err);
       }

    });
}


	
