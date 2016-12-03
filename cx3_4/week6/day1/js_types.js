var a = 1;
var b = 2;
var c = 2.5;

console.log(a + b);
console.log(c - b);
console.log(c * a);
console.log(b / a);
console.log(a % b);

var myString = "a nice string we are creating";

console.log(myString.length);
console.log(myString.toUpperCase()); 
// Need parentheses after 'toUpperCase'

console.log(1 > 2);
console.log(2 == 2);
console.log(2 === "2");
// Three equals signs compares type as well as value.
console.log(2 !== 2);

var mySleepingBear = null;
console.log(mySleepingBear);

var myUndefinedBear;
console.log(myUndefinedBear);

console.log(typeof(myUndefinedBear));
console.log(typeof(1));
console.log(typeof("Rick"));
console.log(typeof(null));
console.log(typeof(undefined));
// 'typeof' returns the type of the parameter.

var number = 1;
number = "not a number lol";
console.log(typeof(number));

console.log(3 + "hello");
// Program converts 3 to a string.
console.log("route" + 6 + 6);
console.log(6 + 6 + "route");
// Order matters. Here, program performs maths before converting to string.
console.log("route" + (6+6));

(1 + 1 === 2) && (1 + 1 === 4);
(1 + 1 === 2) || (1 + 1 === 4);

console.log(!true);

if(true) {
  console.log("true!");
}
// Truth is truthy.
if(false) {
  console.log("true!");
}
// False is falsey.
if(0) {
  console.log("true!");
}
// 0 is falsey.
if(2) {
  console.log("2 is true!");
}
// All other numbers are truthy.
if(undefined) {
  console.log("true!");
}
// Undefined is falsey.
if("") {
  console.log("Empty string!");
}
// An empty string is falsey.
if(" ") {
  console.log("Empty string!")
}
// A string containing anything, even a space, is truthy.
if(null) {
  console.log("Is null true?")
}
// null is falsey.
if(NaN) console.log("Huh?");
// NaN (Not a Number) is falsey.

console.log(parseInt("2"));
// Converts string to integer.

console.log(typeof(NaN));
// NaN is classed as a number.

console.log(isNaN(1));
// 1 is a number, so this will evaluate as false.