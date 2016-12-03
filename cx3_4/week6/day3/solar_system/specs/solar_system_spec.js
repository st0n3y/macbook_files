var SolarSystem = require( '../solar_system_constructor' );
var Planet = require( '../planet' );
var assert = require( 'chai' ).assert


describe( "Solar System", function() {

  var sol = new SolarSystem( "Sol" );

  var mercury = new Planet( "Mercury" );
  var venus = new Planet( "Venus" );
  var earth = new Planet( "Earth" );
  var mars = new Planet( "Mars" );

  it( "Has a name", function() {
    assert.equal( "Sol", sol.systemName )
  } );

  it( "Begins with no planets", function() {
    assert.deepEqual( [], sol.planets )
  } );

  it( "Can add planets", function() {
    sol.addPlanet( mercury )
    sol.addPlanet( venus )
    sol.addPlanet( earth )
    sol.addPlanet( mars )

    assert.deepEqual( [mercury, venus, earth, mars], sol.planets )
    console.log( sol )
  } );

} )