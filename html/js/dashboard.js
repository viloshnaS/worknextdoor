function getBookingByHub(id){

  $.ajax({
                   url : URL+'/dashboard/getHubBookings.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { user_id:id } , // the parameters
                   success : function(response){ 
                    // is request is a success, this block is executed
                  
                        result = response;
                    }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

   return result;

};