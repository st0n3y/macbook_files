// To create an array, we can do this:
var guitars = ["fender","gibson","gretsch"];

// Or we can use a constructor function:
var drums = new Array();

drums.push( "yamaha" );
drums.push( "gretsch" );
drums[1] = "zildijan"
drums[10] = "boom"

console.log("guitars", guitars);
console.log("drums", drums[1]);
console.log(drums[5]);

console.log( "drums", drums.length )
console.log( "drums", drums.pop() )

// To select the first element:
console.log( drums.shift() );
console.log( drums.slice(0,1) );
console.log( drums.splice(0,1) );

drums.unshift("Zildjian")
drums.splice(1,8)
console.log( drums )