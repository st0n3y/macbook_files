var assert = require('assert');
var robot = require('./robot');

describe( 'Robot', function(){
  it( 'Should welcome me', function(){
    assert.equal( "Hello, David", robot.welcome() )
  } )
} )