function getBookingByHub(_id,_interval){

  $.ajax({
                   url : URL+'/dashboard/getHubBookings.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { user_id:_id,
                           interval:_interval} , // the parameters
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

function getSpaceBookingPercentage(_id,_interval){

  $.ajax({
                   url : URL+'/dashboard/getTopSpaces.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { hub_id:_id,
                           interval:_interval} , // the parameters
                   success : function(response){ 
                    
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

function drilldown(hub_id,interval){
    displayPieChart(getSpaceBookingPercentage(hub_id,interval));
}

function displayPieChart(results){

        var results_array = JSON.parse(results);
        var space_data = [];
        var spaceObj;

        results_array.forEach(function(space){
            spaceObj = { "name": space.space_name , "y":Number(space.percentage)};
            space_data.push(spaceObj);
           

        });
    

        // Build the chart
        Highcharts.chart('pie_container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Percentage booking for each space'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            "series": [{
                name: 'Spaces',
                colorByPoint: true,
                data: space_data
            }]
        });
    }
    function displayBarChart(results){

        var results_array = JSON.parse(results);
        var hub_data = [];
        var drilldown_data = [];
        var hubObj;
        var cat = [];
        var drilldownObj;
        var spaceObj;
        var space_data = [];

        results_array.forEach(function(result){
            hubObj = { "name":result.name , "y":Number(result.y), "drilldown":result.hub_id};
            hub_data.push(hubObj);
            cat.push(result.name);
            drilldownObj = { "name": result.space_name , "id":result.hub_id};
            space_data = [];
            result.spaces.forEach(function(space){
                spaceObj = [space.space_name , Number(space.num_bookings)];
                space_data.push(spaceObj);
            });
            drilldownObj.data = space_data;
            drilldown_data.push(drilldownObj);

        });
    
       

        Highcharts.chart('bar_container', {
            chart: {
              type: 'column',
              events: {
                  drillup: function (e) {
                      $("#pie_container").html("");
                  }
              }        
            },


            title: {
                text: 'Number of Bookings'
            },
            xAxis: {
                type: 'Hubs',
                //categories: ['space1', 'space2', 'space3']
                categories: cat
            },
            yAxis: {
                title: {
                    text: 'Number of Bookings'
                }

            },
            legend: {
                enabled: false
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:f}'
                    },
                    events: {
                        click: function (event) {
                            drilldown(event.point.drilldown,$( "#interval" ).val());
                        }
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:f}</b> Booking(s)<br/>'
            },

        "series": [
        {
            "name": "Hubs",
                "colorByPoint": true,
                "data":hub_data
        }
        ],
    "drilldown": {
      
        "series":drilldown_data
    }
   
    });
}