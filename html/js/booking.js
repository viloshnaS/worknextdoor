function createBooking(_space_id,_user_id,_date_from,_date_to,_space_rate,_unit_price,_duration,_name){

  $.ajax({
                   url : URL+'/bookings/createBooking.php',
                   type : 'POST',
                   crossDomain: true,
                   data: { space_id:_space_id,
                          user_id:_user_id,
                          date_from:_date_from,
                          date_to:_date_to,
                          space_rate:_space_rate,
                          unit_price:_unit_price,
                          hub_name:_name,
                          duration:_duration
                          
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      localStorage.setItem("booking_id",response);
                
                      window.location="bookingConfirmation.html";
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}


function getAvailableDates(_space_id){
  localStorage.setItem("booked_dates","");

  return $.ajax({
                   url : URL+'/bookings/getAvailableDates.php',
                   type : 'GET',
                   crossDomain: true,
                   data: { space_id:_space_id
                          
                          } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                      localStorage.setItem("booked_dates",response);
                    
                     
                  }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

}

function getNumberOfDays(date1,date2){

    var one_day = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return (Math.round(difference_ms/one_day))+1;


};
