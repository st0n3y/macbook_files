var PieChart = function( title, data, drilldownData ) {

  var container = document.getElementById( "pieChart" );
  
  var chart = new Highcharts.Chart( {
    chart: {
      type: "pie",
      renderTo: container
    },
    title: {
      text: title
    },
    series: [
      {
        name: "Type",
        data: data
      }
    ],
    drilldown: [
      {
        id: "nativeName",
        data: drilldownData
      }
    ]
  } )

}