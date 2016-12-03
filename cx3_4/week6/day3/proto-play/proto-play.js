var wisePerson = {
  wisdom: function() {
    console.log( "Commit often" );
  }
}

// Declare the object to take as prototype.
var myPerson = Object.create( wisePerson );

myPerson.walk = function() {
  console.log( "left, right, left, right" );
}

myPerson.wisdom();





var Fish = function( name, colour ) {
  this.name = name;
  this.colour = colour;
};

Fish.prototype = {
  swim: function() {
    console.log( "swimming" );
  }
};

var nemo = new Fish( "Nemo", "orange" );
nemo.swim();