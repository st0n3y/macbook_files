var Map = function( latLng, zoom ) {
  // 'google' references the Google API. '.maps' and '.Map' are built-in properties of the API.
  this.googleMap = new google.maps.Map( document.getElementById( "map" ), {
    center: latLng,
     zoom: zoom,
     mapTypeId: google.maps.MapTypeId.SATELLITE
  } );

  this.addInfoWindow = function( latLng, title ) {
    var marker = this.addMarker( latLng, title );
    var infoWindow = new google.maps.InfoWindow( {
        content: title
    } )
    marker.addListener( "click", function() {
      console.log( "Yo! I have been clicked!" );
      infoWindow.open( this.map, marker );
    } )
  };

  this.addMarker = function( latLng, title ) {
    var marker = new google.maps.Marker( {
      position: latLng,
      map: this.googleMap,
      title: title
    } )
    return marker
  };

  this.bindClick = function() {
    // var that = this;
    //'addListener' takes three arguments: map, action and a function.
    google.maps.event.addListener( this.googleMap, "click", function( event ) {
      console.log( event.latLng.lat() );
      console.log( event.latLng.lng() );
      var latLngObj = {
        lat: event.latLng.lat(),
        lng: event.latLng.lng()
      }
    // that.addMarker( latLngObj, "0" );
    this.addMarker( latLngObj, "!" );
    }.bind( this ) );
  };

  this.resetCenter = function( latLngObj ) {
    this.googleMap.panTo( latLngObj )
  };


}