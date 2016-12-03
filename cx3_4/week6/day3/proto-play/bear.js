var Bear = function( age, type, weight ) {
  this.age = age;
  this.type = type;
  this.weight = weight;
}


Bear.prototype = {
  roar: function() {
    console.log( "Rawr!" );
  },
  eat: function( amount ) {
    return ( this.weight += amount );
  },
  boke: function() {
    this.weight -= 2
  }
}

var bruno = new Bear( 5, "sloth bear", 300 );
bruno.eat( 10 );
console.log( bruno );
bruno.boke();
console.log( bruno );
bruno.roar();