var bottle = require( '../water_bottle' );
var assert = require( 'chai' ).assert

describe( 'Water Bottle', function() {

  it( "should be empty at start", function() {
    assert.equal( 0, bottle.volume )
  } );

  it( "should fill up to 100", function() {
    bottle.fill();
    assert.equal( 100, bottle.volume )
  } );

  it( "should reduce by 10 when drunk", function() {
    bottle.drink();
    assert.equal( 90, bottle.volume )
  } );

  it( "should reduce to 0 when emptied", function() {
    bottle.empty();
    assert.equal( 0, bottle.volume )
  } );

  it( "should not go below 0", function() {
    bottle.drink();
    assert.equal( "No water left", bottle.drink() )
  } );

} )