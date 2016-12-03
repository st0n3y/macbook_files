// For Loops


var pets = ["dog", "cat", "pika"]

var obj = {
  student1: 3, 
  student2: 12, 
  student3: 40
}

// It is conventional to name your variable 'i'.
// Input initial condition, ending condition and increment value.
for ( var i = 0; i < 5; i += 1 ) {
  console.log(i);
}



for ( var i = 0; i < pets.length; i += 1 ) {
  console.log(pets[i]);
}


// A 'for of' loop.
for ( var pet of pets ) {
  console.log( pet )
}


// A 'for in' loop.
for ( var pet in pets ) {
  console.log( pets[pet] )
}



// As the operation in dynamic, we cannot use the '.key' notation.
for ( var key in obj ) {
  console.log( obj[key] )
}




// While Loops


var x = 0;

// '++' and '--' are special operators for incrementing by 1.
while ( x < 10 ) {
  console.log( "loop" + x );
  x++;
}

var accounts = [
  { name: 'jay',
    amount: 125.50,
    type: 'personal'
  },
  { name: 'val',
    amount: 55125.10,
    type: 'business'
  },
  { name: 'marc',
    amount: 400.00,
    type: 'personal'
  },
  { name: 'keith',
    amount: 220.25,
    type: 'business'
  },
  { name: 'rick',
    amount: 1.00,
    type: 'personal'
  },
]