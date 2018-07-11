function getSpaceReviews(id){
  $.ajax({
                   url : URL+'/reviews/getSpaceReviews.php',
                   type : 'GET',
                   crossDomain: true,
                   data: { space_id:id } ,
                   success : function(response){ // success est toujours en place, bien sûr !
                          
                         displaySpaceReviews(response);
                        }
            ,

                   error : function(resultat, statut, erreur){

                   }

                });

};


function displaySpaceReviews(results){
          var result_arr = JSON.parse(results); // converting results to JSON object
          display_string ="";
          result_arr.forEach(function(review) { //looping through JSON array
            var reviewDate = new Date(review.date_posted);
            display_string = display_string+"<table>";
            display_string = display_string+"<tr>"; 
            if(review.picture!=''){
              display_string = display_string+"<td rowspan=2><img class='user_image' src='img/user/"+review.picture+"'/></td>";
            }
            else{
              display_string = display_string+"<td rowspan=2><img class='user_image'src='img/generic.jpg'/></td>";
            }

            display_string = display_string+"<td><b>"+review.firstname+"</b><td>";
            display_string = display_string+"<td><td>";
            display_string = display_string+"</tr>";
            display_string = display_string+"<tr>";
            display_string = display_string+"<td>"+months[reviewDate.getMonth()] +" "+reviewDate.getFullYear()+"<td>";
            display_string = display_string+"<td><span class='stars-container stars-"+review.rating+"''>★★★★★</span></td>";
            display_string = display_string+"</tr>";
            display_string = display_string+"</table>";
            display_string = display_string+"<p>"+review.comment+"</p>";
            display_string = display_string+"<hr>";
          });
          $("#div_reviews").html(display_string); // displaying the HTML string in a div
};