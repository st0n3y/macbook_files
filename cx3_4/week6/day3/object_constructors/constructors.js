// By convention, constructor function names are capitalised.
var House = function( sqFeet, bathrooms, bedrooms ) {
  this.sqFeet = sqFeet;
  this.bathrooms = bathrooms;
  this.bedrooms = bedrooms;
  this.numberOfRooms = function() {
    return( this.bathrooms + this.bedrooms )
  };
}


var house1 = new House( 1000, 3, 4 );
var house2 = new House( 2000, 4, 5 );

console.log( "house1", house1 );
console.log( "house2", house2 );
console.log( "house1", house1.numberOfRooms() )
console.log( "house2", house2.numberOfRooms() )





var Office = function( desks, meetingRooms ) {
  this.desks = desks;
  this.meetingRooms = meetingRooms;
  this.averageDesks = function() {
    return this.desks / this.meetingRooms;
  };
}

var office1 = new Office( 50, 3 );
var office2 = new Office( 100, 5 );

console.log( office1.averageDesks() );
console.log( office2.averageDesks() );