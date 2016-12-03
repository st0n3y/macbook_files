var athlete = require( '../athlete' );
var assert = require( 'chai' ).assert

describe( 'Athlete', function() {

  it( "should start at 100 hydration", function() {
    assert.equal( 100, athlete.hydration )
  } );

  it( "should start at 0 distance coverered", function() {
    assert.equal( 0, athlete.distanceCovered )
  } );

  it( "should reduce hydration by 10 for every 20 run", function() {
    athlete.run();
    assert.equal( 20, athlete.distanceCovered );
    assert.equal( 90, athlete.hydration );
  } );

  it( "should not be able to run when hydration at 0", function() {
    athlete.hydration = 0
    assert.equal( "Rehydrate!", athlete.run() )
  } );

  it( "should increase hydration by drinking from bottle", function() {
    
  } );

} )