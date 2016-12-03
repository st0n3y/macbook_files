var LineChart = function() {

  var container = document.getElementById( "lineChart" );

  var chart = new Highcharts.Chart( {
    chart: {
      type: "line",
      renderTo: container
    },
    title: {
      text: "Number of Pokermans I Have Caught"
    },
    series: [
      {
        name: "Water Pokermans",
        data: [2, 7, 10, 12, 14],
        color: "DODGERBLUE" 
      },
      {
        name: "Fire Pokermans",
        data: [4, 3, 5, 18, 11],
        color: "ORANGERED"
      }
    ],
    xAxis: {
      categories: ["Jan", "Feb", "March", "April", "May"]
    }


  } )

}