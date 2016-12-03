var express = require( 'express' );

//It is convention to call this 'app'.
var app = express();

//Helps us locate resources.
var path = require( 'path' );
var planets = [
  {
    name: "Mars",
    size: 2039
  },
  {
    name: "Saturn",
    size: 40000
  },
  {
    name: "Earth",
    size: 3500
  }
]

app.use( express.static( 'client/build' ) );

//By convention, 'req' and 'res' represent request and response.
app.get( '/', function( req, res ) {
  res.sendFile( path.join(__dirname + '/client/build/index.html') );
} );


//INDEX
app.get( '/planets', function( req, res ) {
  res.json( planets );
} );

//NEW
app.get( '/planets/new', function( req, res ) {
  res.send( "There should be a form in the browser." )
} );

//CREATE
app.post( '/planets', function( req, res ) {
  res.send( "Post request to the homepage" );
});

//SHOW
app.get( '/planets/:id', function( req, res ) {
  res.json( planets[req.params.id-1] );
} );

//EDIT
app.get( '/planets/:id/edit', function( req, res ) {
  res.send( "This is an update form" );
} );

//UPDATE
app.put( '/planets/:id', function( req, res ) {
  res.send( "This is the update route" )
} );

//DELETE
app.delete( '/planets/:id', function( req, res ) {
  res.send( "This is the delete method" );
} );


app.listen( '9000', function() {
  console.log( "The magic is all happening on port 9000" );
} );