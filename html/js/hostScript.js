


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
 
}
 
function displayHubInfo(result){
  var hub = JSON.parse(result); // converting results to JSON object
 
       $("#hubName").val(hub.name);
       $("#hubAddress").val(hub.address);
       $("#hubDescription").val(hub.description);
    
       if(hub.air_con == 1){
          
            $("#airCondition").prop('checked', true);
        }
 
        if(hub.printer_scanner == 1){
          
            $("#printer").prop('checked', true);
        }
 
        if(hub.kitchen == 1){
          
            $("#kitchen").prop('checked', true);
        }
 
        if(hub.wifi == 1){
          
            $("#wifi").prop('checked', true);
        }
 
        if(hub.heater == 1){
          
            $("#heater").prop('checked', true);
        }
 
 
        if(hub.parking == 1){
          
            $("#parking").prop('checked', true);
 
        }
 
        if(hub.weekends == 1){
          
            $("#weekend").prop('checked', true);
        }
 
        if(hub.public_holidays == 1){
          
            $("#publicHoliday").prop('checked', true);
        }
}
 
 
 
function updateHub(){
  var currURL = window.location.href;
  var arrURLDetail = currURL.split("=");
  var hubId = parseInt(arrURLDetail[1]);

  var hubName = $("#hubName").val();
  var hubDescription = $("#hubDescription").val();
  var airCondition = $("#airCondition").is(':checked') ? 1:0;
  var printer = $("#printer").is(':checked') ? 1:0;
  var kitchen = $("#kitchen").is(':checked') ? 1:0;
  var heater = $("#heater").is(':checked') ? 1:0;
  var wifi = $("#wifi").is(':checked') ? 1:0;
  var parking = $("#parking").is(':checked') ? 1:0;
 
  var publicHoliday = $("#publicHoliday").is(':checked') ? 1:0;
  var weekend = $("#weekend").is(':checked') ? 1:0;
  var active = $("#active").is(':checked') ? 0:1;
 
  var uploadData = {
    hub_id : hubId,
    name : hubName,
    description : hubDescription,
    aircon : airCondition,
    printer_scanner : printer,
    kitchen : kitchen,
    heater : heater,
    wifi : wifi,
    parking : parking,
    public_holidays : publicHoliday,
    weekends : weekend,
    active :active
    //picture : arrHubPicture.toString()
  }
  
 
 
  $.ajax({
    url : URL+'/host/updateHub.php',
    type : 'POST',
    crossDomain: true,
    async: false,
        data: uploadData,
        success : function(responseData){ 
 			if(responseData > 0){
            //displaySpaceDetails(response);
            window.location.href = "modifyResult.html";
          } 
          else{
            $("#txtErr").html("Modify hub unsuccessfully, please try again")
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

	if(nbOfGuest <= 0 || nbOfGuest == null || isNaN(nbOfGuest)){
		$("#txtErr").html("Please enter number of guest");
		return;
	}

	if(nbOfSpace <= 0 || nbOfSpace == null || isNaN(nbOfSpace)){
		$("#txtErr").html("Please enter number of workdesk/people");
		return;
	}

	if(spaceSize <= 0 || spaceSize == null || isNaN(spaceSize)){
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

 function getSpaceInfo(id){
  $.ajax({
      url : URL+'/host/hostGetSpaceById.php',
      type : 'GET',
 
      crossDomain: true,
      data: { space_id:id } ,
      success : function(response){ // success est toujours en place, bien sûr !
          displaySpaceInfo(response);
      },
      error : function(resultat, statut, erreur){
      }
  });
 
}
 
function displaySpaceInfo(result){
  var space = JSON.parse(result); // converting results to JSON object
 
       $("#spaceTypeList").val(space.space_type);
       $("#spaceName").val(space.space_name);
       $("#nbOfGuest").val(space.number_of_guests);
       $("#nbOfSpace").val(space.number_of_spaces);
       $("#spaceSize").val(space.size);
 
       if(space.whiteboard == 1){
          
            $("#whiteBoard").prop('checked', true);
        }
 
        if(space.screen == 1){
          
            $("#screen").prop('checked', true);
        }
 
        if(space.projector == 1){
          
            $("#projector").prop('checked', true);
        }
 }
 
 
function updateSpace(){
  //var hubId = $("#hubList option:selected").val();
  var currURL = window.location.href;
  var arrURLDetail = currURL.split("=");
  var spaceId = parseInt(arrURLDetail[1]);
  var spaceType = parseInt($("#spaceTypeList option:selected").val());
  var spaceName = $("#spaceName").val();
  
  var nbOfGuest = parseInt($("#nbOfGuest").val());
  var nbOfSpace = parseInt($("#nbOfSpace").val());
  var spaceSize = parseInt($("#spaceSize").val());
  var whiteBoard = $("#whiteBoard").is(':checked') ? 1:0;
  var screen = $("#screen").is(':checked') ? 1:0;
  var projector = $("#projector").is(':checked') ? 1:0;
  var active = $("#active").is(':checked') ? 0:1;
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
    space_id : spaceId,
    space_type : spaceType,
    space_name : spaceName,
    number_of_guests : nbOfGuest,
    number_of_spaces : nbOfSpace,
    size : spaceSize,
    whiteboard : whiteBoard,
    screen : screen,
    projector : projector,
    thumbnail_picture : arrSpacePicture.toString(),
    active : active
  }
 
 
 
  $.ajax({
        url : URL+'/host/updateSpace.php',
        type : 'POST',
        async: false,
        crossDomain: true,
        data: uploadData,
        success : function(responseData){ 
          
          if(responseData > 0){
            //displaySpaceDetails(response);
            window.location.href = "modifyResult.html";
          } 
          else{
            $("#txtErr").html("Modify space unsuccessfully, please try again")
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

function modifyMore(){
  window.location.href = "hostSpaceList.html";
}
	
