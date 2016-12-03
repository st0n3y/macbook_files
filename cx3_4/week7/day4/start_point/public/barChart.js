var BarChart = function() {

  var container = document.getElementById( "barChart" );
  
  var chart = new Highcharts.Chart( {
    chart: {
      type: "bar",
      renderTo: container
    },
    title: {
      text: "Pokerman types I have caught"
    },
    series: [
      {
        name: "Type",
        data: [
          {
            name: "Fire",
            y: 74,
            color: "ORANGERED"
          },
          {
            name: "Water",
            y: 20,
            color: "DODGERBLUE"
          },
          {
            name: "Grass",
            y: 10,
            color: "FORESTGREEN"
          },
          {
            name: "Electric",
            y: 32,
            color: "GOLD"
          }
        ]
      }
    ],
    xAxis: {
      categories: ["Fire", "Water", "Grass", "Electric"]
    }
  } )

}