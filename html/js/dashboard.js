var spaceMap = {};

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

function getBookingBySpace(_id,_interval){

  $.ajax({
                   url : URL+'/dashboard/getSpaceBookings.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { user_id:_id,
                           interval:_interval} , // the parameters
                   success : function(response){ 
                    // is request is a success, this block is executed
                  
                        populateDrilldownMap(response);
                    }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

};


function getBookingByHubFlag(_id,_interval){

  $.ajax({
                   url : URL+'/dashboard/getBookingByHubFlag.php', // URL of Web Service
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
                   url : URL+'/dashboard/getSpaceBookingPercentage.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { hub_id:_id,
                           interval:_interval} , // the parameters
                   success : function(response){ 
                    
                        displayPieChart(response);
                    }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

};

function HubDrilldown(hub_id,interval){
    space_array = spaceMap[Number(hub_id)];
    var space_name = [];
    var values = [];


    $("#column_container").show();
    $("#pie_container").show();

    space_array.forEach(function(space) {
        space_name.push(space.name);
        values.push(Number(space.y));

    });


     Highcharts.chart('column_container', {
        chart: {
            type: 'column',
            events: {
                drillup: function(e) {
                    $("#pie_container").html("");
                }
            }
        },


        title: {
            text: 'Number of Bookings'
        },
        xAxis: {
            type: 'category',
            labels: {
                style: {
                    color: '#ED561B',
                    font: '11px Trebuchet MS, Verdana, sans-serif'
                }
            },
            categories: space_name
            //categories: cat
        },
        yAxis: {
            labels: {
                style: {
                    color: '#ED561B',
                    font: '11px Trebuchet MS, Verdana, sans-serif'
                }
            },
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
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:f}</b> Booking(s)<br/>'
        },

        "series": [{
            "name": "Spaces",
            "colorByPoint": true,
            "data": values
        }]

    });

     getSpaceBookingPercentage(hub_id,interval);



}

function populateDrilldownMap(results) {

    var results_array = JSON.parse(results);
    var space_data = [];
    var hub_id = 0;
    var previousSpaceObj;
    var spaceObj;
    var len = results_array.length;
    var count =1;



    results_array.forEach(function(space) {

        spaceObj = {
            "name": space.space_name,
            "y": Number(space.num_bookings)
        };

        if (hub_id == 0 ){
            hub_id = space.hub_id;
            space_data.push(spaceObj);
        }
        else if(space.hub_id == hub_id){
            space_data.push(spaceObj);

        }
        else{

            spaceMap[hub_id] = space_data;
            space_data = [];
            hub_id = space.hub_id;
            space_data.push(spaceObj);
        }

        if(count == len){
            spaceMap[hub_id] = space_data;

        }

        
        count++;
        


});
}


function displayPieChart(results) {
  
    var results_array = JSON.parse(results);
    var space_data = [];
    var spaceObj;

    results_array.forEach(function(space) {
        spaceObj = {
            "name": space.space_name,
            "y": Number(space.percentage)
        };
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


function getPercentageEarningsByHub(_user_id,_year){

  $.ajax({
                   url : URL+'/dashboard/getEarningPercentage.php', // URL of Web Service
                   type : 'GET', //web Service method
                   async: false,
                   crossDomain: true, // to enable cross origin resource(CORS) sharing
                   data: { user_id:_user_id,
                           year:_year} , // the parameters
                   success : function(response){ 
                    // is request is a success, this block is executed
                  
                        displayEarningPieChart(response);
                    }
            ,

                   error : function(resultat, statut, erreur){
                    // in case of error log will be added

                        console.log("Error encountered. Could not retrieve details");

                   }

                });

};

function displayEarningPieChart(results){

  var results_array = JSON.parse(results);
        var hub_data = [];
        var hubObj;

        results_array.forEach(function(hub){
            hubObj = { "name": hub.name , "y":Number(hub.percentage)};
            hub_data.push(hubObj);
           

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
                name: 'Hub',
                colorByPoint: true,
                data: hub_data
            }]
        });

}


function displayBookingStackChart(results){

      var results_array = JSON.parse(results);
        var past_booking = [];
        var future_booking = [];
        var hubObj;
        var serie_data = [];
        var hub_name = [];
        var len = results_array.length;

        for (var i = 0; i < len; i++){

            if(results_array[i].flag == 0){//past
                hubObj = { "name": results_array[i].name , "y":Number(results_array[i].y), "drilldown":results_array[i].hub_id};
                past_booking.push(hubObj);
                hub_name.push(results_array[i].name);

                if(i+1 < len) {
                    if (results_array[i+1].hub_id == results_array[i].hub_id){
                        hubObj = { "name": results_array[i+1].name , "y":Number(results_array[i+1].y), "drilldown":results_array[i+1].hub_id};
                        future_booking.push(hubObj);
                        i++;
                }
            }

            }
            else{//only future
                hubObj = { "name": results_array[i].name , "y":Number(results_array[i].y), "drilldown":results_array[i].hub_id};
                future_booking.push(hubObj);
                hubObj = { "name": results_array[i].name , "y":0, "drilldown":results_array[i].hub_id};
                past_booking.push(hubObj);
                hub_name.push(results_array[i].name);
            }


        }

    

Highcharts.chart('stack_container', {
    colors: ['#B0C4DE','#4169E1'],
    chart: {
        type: 'column'
    },

    title: {
        text: 'Stacked column chart'
    },
    xAxis: {
        categories: hub_name
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Total fruit consumption'
        },
        stackLabels: {
            enabled: true,
            style: {
                fontWeight: 'bold',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
            }
        }
    },
    legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
    tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true,
                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
            }
        },
         series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:f}'
                },
                events: {
                    click: function(event) {
                        HubDrilldown(event.point.drilldown, $("#interval").val());
                    }
                }
            }
    },
    series: [{
        name: 'Future Bookings',
        data: future_booking
    }, {
        name: 'Past Bookings',
        data: past_booking
    }]
});

}
