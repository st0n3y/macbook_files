var myName = "Keith";

if(myName === "Keith"){
  console.log("Yo, " + myName);
}


var counter = 1;

if(counter > 0){
  console.log("The counter is greater than 0");
}
else if(myCounter < 0){
  console.log("The counter is less than 0");
}
else{
  console.log("The counter is 0");
}



var pet = "dog";

switch(pet){
  case "cat":
    console.log("Soft kitty, warm kitty.");
    break;
  case "dog":
    console.log("Who let the dogs out?");
    break;
  default:
    console.log("No pet. Sad.");
}



1 + 1 === 2 ? console.log("Yay! Maths!") : console.log("Node, maths is broken.");