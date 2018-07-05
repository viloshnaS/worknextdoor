





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

function submitNewHub(){
	var hubName = $("#hubName").val();
	var hubAddress = $("#hubAddress").val();
	var hubDescription = $("#hubDescription").val();
	var airCondition = $("#airCondition").is(':checked') ? 1:0;
	var printer = $("#printer").is(':checked') ? 1:0;
	var kitchen = $("#kitchen").is(':checked') ? 1:0;
	var heater = $("#heater").is(':checked') ? 1:0;
	var projector = $("#projector").is(':checked') ? 1:0;
	var coffeeMachine = $("#coffeeMachine").is(':checked') ? 1:0;
	var parking = $("#parking").is(':checked') ? 1:0;

	var uploadData = {
		hubName : hubName,
		hubAddress : hubAddress,
		hubDescription : hubDescription,
		airCondition : airCondition,
		printer : printer,
		kitchen : kitchen,
		heater : heater,
		projector : projector,
		coffeeMachine : coffeeMachine,
		parking : parking,
		arrHubPicture : arrHubPicture
	}

	$.ajax({
       	url : URL+'/spaces/createHub.php',
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


	
