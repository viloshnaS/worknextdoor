function addHubAvailability(_hub_id,_selectedDates){
  localStorage.setItem("booked_dates","");

  return $.ajax({
                   url : URL+'/host/addHubAvailability.php',
                   type : 'POST',
                   crossDomain: true,
                   data: { hub_id:_hub_id,
                          selectedDates:_selectedDates
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      if(response =="1"){
                        alert("Dates successfully added");
                      }
                      else{
                        alert("Dates not added. Please try later");
                      }
                    
                     
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}

function deleteDate(index,selected_dates ){
  selected_dates.splice(index,1);
  displaySelectedDates(selected_dates); 
};



function getHubAvailability(_hub_id){
    var selected_dates = [];
    $.ajax({
        url : URL+'/host/getHubAvailability.php',
        type : 'GET',
        async: false,
        crossDomain: true,
        data: {hub_id: _hub_id},
        success : function(responseData){ 
          

          if(responseData != ""){
              var count =0;
              var results_list = JSON.parse(responseData);
              results_list.forEach(function(hub_date) { 

              
                var _date_from = new Date(hub_date.startDate);
                var _date_to = new Date(hub_date.endDate);
                var _date =[_date_from,_date_to];
                selected_dates.push(_date);
          });
              
          }          
          
        }, error : function(err){
          console.log(err);
       }

    });
    return selected_dates;

}

 function displaySelectedDates(selected_dates){

            var res = "";

            for (i = 0; i < selected_dates.length; i++)  {

              var selectedDate = selected_dates[i];
              var _date_from = selectedDate[0];
              var _date_to = selectedDate[1];

                res += "<div class='block clear' >";
                res += "<div class='one_quarter'>";
                res += "        <label style='font-weight: bold; display: none;'>Padding div tag</label></div>";
                res += "      <div class='one_half' >";
                res += "        <label style='font-weight: bold; font-size: 12px;'>" + _date_from.getDate()+" "+ months[_date_from.getMonth()] + " "+ _date_from.getFullYear() + " to " +  _date_to.getDate()+" "+ months[_date_to.getMonth()] + " "+ _date_to.getFullYear() + "</label></div>";
                res += "      <div class='one_quarter' >";
                res += "       <i class='material-icons clear_image' id='"+i+"' style='float: left; color: red'>clear</i></div>";
                res += "<div>";
            }
              $("#date_display").html(res);
              $( ".datepicker" ).datepicker("refresh");

          }
