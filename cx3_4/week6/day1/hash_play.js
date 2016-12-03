// In JS, an object takes the form of a hash.

var myPerson = {
  name: "Guybrush",
  age: 32,
  weapon: "cutlass",
  address: {
    street: "Pirate Way", 
    postcode: "EH1 4AL"
  },
  myFunc: function() {
    console.log( "My first JS method" )
  }
}

myPerson.myFunc()


// var propertyName = "weapon"

// console.log( myPerson.name );
// console.log( myPerson["name"] );

// console.log( myPerson[propertyName] );

// myPerson.pet = "parrot"
// myPerson.age += 20

// console.log( myPerson );


var caesar = {
  city: "Rome"
}

var cleopatra = {
  city: "Cairo"
}

var cicero = {
  city: "Rome"
}

var historyLesson = [caesar, cleopatra, cicero];

console.log( historyLesson[1].city )