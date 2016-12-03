// This 'name' variable is global.
var name = "Keith";

// This 'name' variable is local and only accessible within the function. Without the 'var', the global variable 'name' would be reassigned.
var talk = function() {
  var name = "David"
  console.log( "My name is " + name + "." );
}

// console.log( "My name is " + name + "." );

var walk = function() {
  console.log( name + " is walking." );
}

talk();
walk();



var greet = function( isHappy ) {
  var text = "";

  if ( isHappy ) {
    text = "Hello, friend.";
  }
  else {
    text = "Fade.";
  }

  // 'displayText' has access to 'text', because JS remembers the environment of a variable's creation.
  var displayText = function() {
    console.log( text )
  }
  displayText();
}

greet( true )






var detective = 'Dr Watson';
var outerFunction = function(decided){
    var detective = 'Miss Marple';
    var theOtherDetective = "Sherlock";
    var innerFunctionA = function(){
        var detective = 'Hercule Poirot';
        detective = "Scooby Doo";
    };
    var innerFunctionB = function(){
        var detective = 'Hercule Poirot';
        var someAction = function() {
            var detective = "Maigret";
            if (decided) {
                theOtherDetective = "Jake Parelta";
            } else {
                detective = "Chief Clarence \"Clancy\" Wiggum";
            }
            return detective;
        };
        detective = someAction();
    };
    var innerFunctionC = function(){
        var detectiveFrost = 'Jack Frost';
        var somethingWheelyFunc = function() {
            var bestWheeledDetectiveEver = "Ironside";
            detective = bestWheeledDetectiveEver;
            return theOtherDetective;
        };
        detective = 'John Luther';

        detective = somethingWheelyFunc();
        return detective;
    };
    detective = innerFunctionA();
    detective = innerFunctionB();
    detective = innerFunctionC();
    return detective;
};
detective = outerFunction(false);
console.log('The best detective is', detective, "of course!");

// detective = outerFunction(true);
// console.log('The best detective is', detective, "of course!");