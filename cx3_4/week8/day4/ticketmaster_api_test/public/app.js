window.onload = function() {


  //GIGATOOLS
  // var url = "http://api.gigatools.com/city.json?cities[]=Berlin&api_key=eee33176ea7e799840"

  //TICKETMASTER
  // var url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=evSfYBzBfoEQwQq13yf0I0Po7YGf2Wcs&classificationName=music&size=20&latlong=40.729476,-73.9971838&radius=5&unit=miles&startDateTime=2016-07-19T00:00:00Z&endDateTime=2016-07-19T23:59:59Z&"

  //TICKETMASTER INTERNATIONAL
  // var url = "https://app.ticketmaster.com/discovery/v2/events/G5dYZfa1ypvij/images.json?apikey=evSfYBzBfoEQwQq13yf0I0Po7YGf2Wcs"

  //TICKETMASTER INTERNATIONAL
  // var url = "https://app.ticketmaster.eu/mfxapi/v1/events?category_ids=10001&rows=50&lat=55.948646&long=-3.199360&radius=10&apikey=evSfYBzBfoEQwQq13yf0I0Po7YGf2Wcs"

  //EVENTFUL
  // var url = "http://api.eventful.com/json//events/search?q=live+music&l=Edinburgh&within=10&units=miles&page_size=50&date=Future&app_key=4ZF5VLX96LxTtTvw"
  
  // EDINBURGH COORDS: 55.948646, -3.199360

  // NEW YORK COORDS: 40.729476, -73.997183

  var url = "http://www.aliss.org/api/v2/search/?q=hostel&location=Edinburgh&distance=2"

  var request = new XMLHttpRequest();


  request.open("GET", url);

  // request.setRequestHeader('Accept', 'application/json');
  // request.setRequestHeader('Content-Type', 'application/json');

  request.onload = function() {
    if( request.status === 200 ) {
      console.log( "Data retrieved" );
      var jsonString = request.responseText;
      
      var returnedData = JSON.parse(jsonString);
    }
    console.log(returnedData);
  }
  request.send(null);
};