// setTimeout( function(){
//   console.log( "I waited for 1 second" );
// }, 1000 );

var logRed = function( message ){
  console.log( message );
}

var logNotRed = function(){
  console.log( "It is NOT red." );
}


// isRed and isNotRed are invoked as callback functions.
var redChecker = function( message, colour, isRed, isNotRed ){
  if( colour === "red" ){
    isRed( message );
  }
  else {
    isNotRed();
  }
}

redChecker( "It is red!", "red", logRed, logNotRed );