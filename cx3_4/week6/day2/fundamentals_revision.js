//Section 1

//what types are these? Write your answer in a comment beside it.

1; //Number
"cat"; //String
true; //Boolean
[]; //Object
{}; //Object
1.1; //Number
undefined; //Undefined

//Section 2

// what is the truthy/falsiness values of the following
// write your answer in a comment beside it
// you can use an if to test this...
1; //true
"cat"; //true
true; //true
NaN; //false
[]; //true
{}; //true
undefined; //false
""; //false
0; //false


//Section 3

//Using examples that are different from above...

//3.1 Assign a variable that is a number
var num = 1888;
//3.2 Assign a variable that is a string
var str = "I'm a frayed knot";
//3.3 Assign a variable that is a boolean
var bool = false;
//3.4 Assign a variable that is an object
var obj = { name: "David", height: "1.93m"};

//Section 4
//4.1 Write a statement that writes "hello" to the console if it's true and "bye" if it is false
if( typeof(5) == true ) {
  console.log( "hello" );
}
else {
  console.log( "bye" );
}

//Section 5
var animals = ["raccoon","hedgehog","mouse","gerbil"];

//5.1. Assign the first element to a variable
var first = animals[0];
//5.2. Assign the last element to a variable
var last = animals.pop;
//5.3. Assign the length of an array to a variable
var len = animals.length;
//5.4. Add an item to the end of the array
animals.push( "lion tamarin" );
//5.5. Add an item to the start of the array
animals.unshift( "three-toed sloth" );
//5.6. Assign the index of hedgehog to a variable
var hedge = animals.indexOf( "hedgehog" );

//Section 6
//6.1 Create an array of 5 vegetables
var vegetables = ["carrot", "yam", "tattie", "peas", "sweetcorn"]

//6.2 Loop over the array and write to the console using a "while"
var x = 0;

while ( x < vegetables.length ) {
  console.log( vegetables[x] );
  x++;
}

//6.3 Loop again using a "for" with a counter
for ( var i = 0; i < vegetables.length; i += 1 ) {
  console.log( vegetables[i]);
}

//6.4 Loop again using a "for in"
for ( var veg in vegetables ) {
  console.log( vegetables[veg] );
}

//Section 7
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
//7.1 Calculate the total cash in accounts
var totalCash = function() {
  var cash = 0;
  for ( var account in accounts ) {
    cash += accounts[account].amount;
  } 
  return cash
}

console.log(totalCash());
//7.2 Find the name of the account with the largest balance
var largestBankAccount = function() {
  var largestAccount = accounts[0]

  for ( var account of accounts ) {
    if( account.amount > largestAccount.amount ) {
      largestAccount = account
    }
  }
  return largestAccount
}

console.log( largestBankAccount );

//7.3 Find the name of the account with the smallest balance
var smallestBankAccount = function() {
  var smallestAccount = accounts[0]

  for ( var account of accounts ) {
    if( account.amount < smallestAccount.amount ) {
      smallestAccount = account
    }
  }
  return smallestAccount
}

console.log( smallestBankAccount );

//7.4 Calculate the average bank account value
var averageAmount = function() {
  console.log( totalCash / accounts.length )
}

console.log( averageAmount )

//7.5 Find the value of marcs bank account
var customerBalance = function( name ) {
  for ( var i = 0; i < accounts.length; i++ ) {
    if( accounts[i].name === name ) {
      return accounts[i].amounts
    }
  }
}

console.log( customerBalance( "marc" ) )

//7.6 Find the holder of the largest bank account
largestBankAccount.name

//7.7 Calculate the total cash in business accounts
var businessTotal = function() {
  x = 0
  for ( var i in accounts ) {
    if ( accounts[i].type === "business" ) {
      x += accounts[i].amount
    }
  }
  return x
}

//7.8 Find the largest personal account owner
var largestAccountHolder = function() {
  personalAccounts = [];
  for ( account of accounts ) {
    if ( account.type === "personal" ) {
      personalAccounts.push( account )
    }
  }

  ver largestHolder = personalAccounts[0]

  for ( account of personalAccounts ) {
    if ( account.amount > largestHolder.amount ) {
      largestHolder = account
    }
  }
  return largestHolder
}

console.log( largestAccountHolder() );

//Section 8
//Assign a variable myPerson to a hash, giving them a name, height, favourite food and an eat method

var myPerson = {
  name: "David", 
  height: 1.93, 
  favouriteFood: "Oyakodon", 
  eat: function() {
    console.log( "Get in ma belly" );
  }
}