var SolarSystem = function( systemName ) {
  this.systemName = systemName;
  this.planets = [];
  this.addPlanet = function( planet ) { 
    this.planets.push( planet );
  };
}

module.exports = SolarSystem