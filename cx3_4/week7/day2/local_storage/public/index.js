// Sets up an array for films, or retrieves it if it already exists.
var films = JSON.parse( localStorage.getItem( "films" ) ) || [];
console.log( films );

var main = function() {
  console.log( "app-started" );
  var button = document.getElementById( "add-button" );
  button.onclick = handleClick;

  var form = document.getElementById( "film-form" );
  form.onsubmit = handleSubmit;

  films.forEach( function( filmTitle ) {
    appendFilm( filmTitle )
  } )
}

// handleSubmit will be passed to the DOM function onsubmit, which will feed in an event as an argument.
var handleSubmit = function( event ) {
  event.preventDefault();
  handleClick();
}

var handleClick = function() {
  
  var input = document.getElementById( "film-text-input" )
  var filmTitle = input.value;
  appendFilm( filmTitle );

  films.push( filmTitle );
  console.log( "films", films );
  console.log( "localStorage", localStorage );
  var stringFilms = JSON.stringify( films );
  localStorage.setItem( "films", stringFilms );
}

var appendFilm = function( filmTitle ) {
  var li = document.createElement( "li" );
  li.innerText = filmTitle;
  console.log( li );
  var ul = document.getElementById( "film-list" )
  ul.appendChild( li );
}

window.onload = main;