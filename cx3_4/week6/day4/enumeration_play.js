var _ = require( 'lodash' );

var testArray = [1,2,3,4];

var doubledArray = _.map( testArray, function( item ){
  return item * 2;
} )

console.log( "doubled array = ", doubledArray );

// testArray.forEach( function( number ){
//   console.log( "the number is ", number );
// } );

// var loopFunc = function( number ){
//   console.log( "the number is ", number );
// }

// testArray.forEach( loopfunc );



var ourOwnForEach = function( array, callback ){
  for( var i in array ){
    callback( array[i] )
  }
}

var printNumber = function( num ){
  console.log( num + 1 );
}

ourOwnForEach( [1,2,3,4], printNumber );