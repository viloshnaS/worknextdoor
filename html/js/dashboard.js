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

function HubDrilldown(hub_id,interval){
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
        var drilldownObj;
        var spaceObj;
        var space_data = [];

        results_array.forEach(function(result){
            hubObj = { "name": result.name , "y":Number(result.y), "drilldown":result.hub_id};
            hub_data.push(hubObj);
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
                type: 'Hubs'
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
                            HubDrilldown(event.point.drilldown,$( "#interval" ).val());
                        }
                    }
                }
            },

            tooltip: {
                headerFormat: '<span ">{point.name}</span>:{point.y:f}'
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

function getEarningsByHub(_user_id,_year){

  $.ajax({
                   url : URL+'/dashboard/getHubEarnings.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { user_id:_user_id,
                           year:_year} , // the parameters
                   success : function(response){ 
                    // is request is a success, this block is executed
                  
                        displayEarningLineChart(response);
                    }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

};

function displayEarningLineChart(results){

     var results_array = JSON.parse(results);
            var series_data = [];
            var hub_data = [];
            var earning_array = [0,0,0,0,0,0,0,0,0,0,0,0];
            var hubObj;
            var hub_id = 0;
            var hub_name = "";
            var len = results_array.length;
            var count = 1;


      results_array.forEach(function(result){

            if(hub_id ==0){
                hub_id = result.hub_id;
                hub_name = result.name;
                earning_array[result.month - 1] = Number(result.amount);
            }
            else if(result.hub_id !=hub_id){
                 hubObj = { "name": hub_name ,"data":earning_array};
                 series_data.push(hubObj);
                // new hub. initialising new array
                hub_id = result.hub_id;
                hub_name = result.name;
                earning_array = [0,0,0,0,0,0,0,0,0,0,0,0];
                earning_array[result.month - 1] = Number(result.amount);
            }
            else{
                earning_array[result.month - 1] = Number(result.amount);
            }

            if(len == count){
                 hubObj = { "name": hub_name ,"data":earning_array};
                 series_data.push(hubObj);
            }

            count ++;

        });

            
    Highcharts.chart('line_container', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Monthly Average Temperature'
        },
        subtitle: {
            text: 'Source: WorldClimate.com'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: series_data
    });

}