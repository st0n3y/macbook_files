var init = function() {
  var center = {lat: 55.9484912, lng: -3.1996179}

  // Map takes two argument: A coordinate object and a zoom level.
  var map = new Map( center, 17 );
  // map.addMarker( center, nums[0] );
  // map.addMarker( jenners, nums[1] );
  // map.bindClick();
  // var locator = new GeoLocator( map );
  // locator.setMapCenter();
  map.addInfoWindow( center, "My info window" );
}

var GeoLocator = function( map ) {
  this.map = map;
  this.setMapCenter = function() {
    navigator.geolocation.getCurrentPosition( function( returnedPosition ) {
      var center = {lat: returnedPosition.coords.latitude, lng: returnedPosition.coords.longitude}
        this.map.resetCenter( center );
        // this.map.addMarker( center, "!" )
    }.bind( this ) );
  };

}

window.onload = init;