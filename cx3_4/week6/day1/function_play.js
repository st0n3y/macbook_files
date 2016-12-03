// function hello() {
//   console.log("Hello, everyone.");
// }

// hello();

// function add(a,b) {
//   return a + b;
// }

// console.log("result: " + add(1,2));



function printName(name, weather, mood) {
  console.log(name + ", it is " + weather + " and you are " + mood + ".");
}

printName("David", "cloudy", "happy");



function sum() {
  console.log(arguments);
}

sum(1,2,3,4);


var hello = function() {
  console.log("hello");
}

hello();


var add = function(a,b) {
  return a + b;
}

console.log(add(1,2));



var greater = function(a,b) {
  if(a > b) return a;
  return b;
}

// console.log("result: " + greater(1,2));

var wow = function(functionToInvoke) {
  console.log(functionToInvoke(2,1));
}

wow(add);