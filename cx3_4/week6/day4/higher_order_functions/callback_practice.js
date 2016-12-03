var myFunction = function( number ){
  console.log( number )
}


var functionCaller = function( func, number ){
  return func( number )
}

functionCaller( myFunction, 10 )




var getSomethingFromTheShop = function( budget, callback ){
  console.log( "I have " + budget + " to go to the shop." )
  callback( "Freddo", "Irn Bru Bar" )
}

getSomethingFromTheShop( "50p", function( req, res ){ console.log( "I wanted a " + req + ", but all I got was a " + res ) } );



var increment = function( number ){
  return number + 1
}

var square = function( number ){
  return number * number
}

var doSomeMathsForMe = function( n, callback ){
  return callback( n );
}


console.log( doSomeMathsForMe( 2, increment ) );

console.log( doSomeMathsForMe( 2, square ) );