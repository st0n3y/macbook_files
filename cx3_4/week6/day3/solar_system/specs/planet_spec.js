var Planet = require( '../planet' );
var assert = require( 'chai' ).assert

describe( 'Planet', function() {

  it( "Has a name", function() {
    var mercury = new Planet( "Mercury" );
    assert.equal( "Mercury", mercury.planetName )
  } );

} )