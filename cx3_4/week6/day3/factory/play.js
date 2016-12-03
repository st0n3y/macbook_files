var Animal = function( name, speed ) {
  return { 
    name: name,
    speed: speed
  }
}

var Rabbit = function( name, speed ) {

  var rabbit = Animal( name, speed )
  rabbit.hasHat = true;
  rabbit.bounce = function() {
    console.log( "Boing!" );
  }

  return rabbit

}

var myRabbit = Rabbit( "Judy Hops", 8 );

console.log( myRabbit );

myRabbit.bounce();