// var element = document.getElementById( "main-text" )

// console.log( window );

console.log( "JavaScript calling!" );

// The DOM's window has a native 'onload' property, which is set to null by default.
window.onload = function(){
  main(); 
}

function main(){
  console.log( "The DOM has successfully loaded." );
  var element = document.getElementById( "main-text" );
  console.log( element );
  logElement( element );
}

function logElement( ele ) {
  console.log( ele );
}

console.log( onload );