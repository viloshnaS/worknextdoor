


var URL ="http://localhost:80/services";


var arrHubPicture = [];
var arrSpacePicture = [];

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

$("#spacePicture").change(function(e) {
	arrSpacePicture = [];
    for(var k=0 ; k< e.target.files.length; k++){
    	arrSpacePicture.push(e.target.files[k].name)

    }
    var html1= "";
    for(var l=0 ; l< arrSpacePicture.length; l++){
    	html1 += "<div class='one_quarter'>"
        html1 += "<img src='D:/Profiles/ddinhdieu/Downloads/brickary/images/demo/" + arrSpacePicture[l] + "' alt=''>"
        html1 += "</div>"
    }
    $("#showSpaceImage").html(html1);
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

	if(hubName == "" || hubName == null){
		$("#txtErr").html("Please enter hub name");
		return;
	}

	if(hubAddress == "" || hubAddress == null){
		$("#txtErr").html("Please enter hub address");
		return;
	}

	if(hubDescription == "" || hubDescription == null){
		$("#txtErr").html("Please enter hub description");
		return;
	}

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
       		if(responseData > 0){
       			window.location="hubavailability.html";
       		} // Create successfully and return Hub ID
       		else{
       			console.log('Create hub failed');
       		}
        }, error : function(err){
        	console.log(err);
       }

    });
}

function getListHubByUserId(userId){
	$.ajax({
       	url : URL+'/host/getHubList.php',
       	type : 'GET',
       	async: false,
       	crossDomain: true,
       	data: {user_id: userId},
       	success : function(responseData){ 
       		responseData = JSON.parse(responseData);
       		var html = "";
       		for(var i = 0; i < responseData.length; i++){
       			// add list hub to select tag 
       			html += "<option value='" + responseData[i].hub_id + "'>" + responseData[i].name + "</option>"
       		}
       		$("#hubList").html(html);
        }, error : function(err){
        	console.log(err);
       }

    });
}


function submitNewSpace(){
	//var hubId = $("#hubList option:selected").val();
	var hubId = 1;
	var spaceType = parseInt($("#spaceTypeList option:selected").val());
	var spaceName = $("#spaceName").val();
	
	var nbOfGuest = parseInt($("#nbOfGuest").val());
	var nbOfSpace = parseInt($("#nbOfSpace").val());
	var spaceSize = parseInt($("#spaceSize").val());
	var whiteBoard = $("#whiteBoard").is(':checked') ? 1:0;
	var screen = $("#screen").is(':checked') ? 1:0;
	var projector = $("#projector").is(':checked') ? 1:0;

	if(spaceName == "" || spaceName == null){
		$("#txtErr").html("Please enter space name");
		return;
	}

	if(nbOfGuest <= 0 || nbOfGuest == null){
		$("#txtErr").html("Please enter number of guest");
		return;
	}

	if(nbOfSpace <= 0 || nbOfSpace == null){
		$("#txtErr").html("Please enter number of workdesk/people");
		return;
	}

	if(spaceSize <= 0 || spaceSize == null){
		$("#txtErr").html("Please enter space size");
		return;
	}

	var uploadData = {
		hub_id : hubId,
		space_type : spaceType,
		space_name : spaceName,
		number_of_guests : nbOfGuest,
		number_of_spaces : nbOfSpace,
		size : spaceSize,
		whiteboard : whiteBoard,
		screen : screen,
		projector : projector,
		thumbnail_picture : arrSpacePicture.toString()
	}



	$.ajax({
       	url : URL+'/host/createSpace.php',
       	type : 'POST',
       	async: false,
       	crossDomain: true,
       	data: uploadData,
       	success : function(responseData){ 
       		
       		var html = "";
       		if(responseData > 0){
       			window.location.href = "createSpaceResult.html";
       		} 
       		else{
       			$("#txtErr").html("Create space unsuccessfully, please try again")
       		}
        }, error : function(err){
        	console.log(err);
       }

    });
}

function changeTypeOfGuest(){
	if($("#spaceTypeList option:selected").val() == "1"){
		$("#txtGuestType").html("work desk(s)");
	}
	else{
		$("#txtGuestType").html("people");
	}
}

function createMoreSpace(){
	window.location.href = "hostSpace.html";
}

function returnHomepage(){
	window.location.href = "index.html";
}
	
