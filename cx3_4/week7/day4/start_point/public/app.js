window.onload = function() {

  // var pokermanData = [ {
  //   name: "Fire",
  //   y: 74,
  //   color: "ORANGERED"
  // },
  // {
  //   name: "Water",
  //   y: 20,
  //   color: "DODGERBLUE"
  // },
  // {
  //   name: "Grass",
  //   y: 10,
  //   color: "FORESTGREEN"
  // },
  // {
  //   name: "Electric",
  //   y: 32,
  //   color: "GOLD"
  // } ]

  // new PieChart( "Pokerman Types I Have Caught", pokermanData);

  var url = "https://restcountries.eu/rest/v1"
  var request = new XMLHttpRequest();
  request.open( "GET", url );
  request.send( null );

  request.onload = function() {
    if( request.status === 200 ) {
        console.log( "Data retrieved" );
        var jsonString = request.responseText
    }
    loadCountryCharts( jsonString );
  }

  // new LineChart();

  // new BarChart();

}

var loadCountryCharts = function( responseText ) {
  var countries = JSON.parse( responseText );

  var countryPopulationData = [];

  for( country of countries ) {
    countryPopulationData.push( 
      {
        name: country.name,
        y: country.population,
        drilldown: "nativeName"
      }
    )
  }

  var countryNativeName = [];

  for( country of countries ) {
    countryNativeName.push(
      {
        nativeName: country.nativeName
      }
    )
  }

  new PieChart( "Country Populations", countryPopulationData, countryNativeName );
}