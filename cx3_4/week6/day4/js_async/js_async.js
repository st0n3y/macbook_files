// These actions will be performed one after another, without delay.

// console.log( "This runs first" );
// console.log( "This runs second" );
// console.log( "This runs third" );



// The third action will run while the setTimeout is holding the second action.

// console.log( "This runs first" );

// setTimeout( function(){
//   console.log( "This runs second" );

//   setTimeout( function(){
//     console.log( "Where we're going, you don't need roads" );
//   }, 3000 );

// }, 1000 );

// console.log( "This runs third" );



console.log( "Customer: Can I have a latte, please." );

console.log( "Server: I'll pass it to the barista." );

setTimeout( function(){
  console.log( "Your latte is ready." );
}, 4000 );

//Customer 2
console.log( "Customer: One espresso, please." );

console.log( "Server: I'll pass it off to the barista." );

setTimeout( function(){
  console.log( "Your espresso is ready" );
}, 2000 );




function getTweetsAsync( callback ){
  //Go and get the tweets

  setTimeout( function(){
    var tweets = "These are the tweets you are looking for.";
    callback( tweets );
  }, 2000 );
}

var myTweets = null;

getTweetsAsync( function( tweets ){
  myTweets = tweets;
  console.log( myTweets );
} );