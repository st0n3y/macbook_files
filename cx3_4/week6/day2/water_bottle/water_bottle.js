var waterBottle = {

  volume: 0,

  fill: function() {
    this.volume = 100;
  },

  drink: function() {
    
    if( this.volume > 0 ) {
      this.volume -= 10;
    }
    else {
      return "No water left";
    }
  },

  empty: function() {
    this.volume = 0;
  }

}

module.exports = waterBottle;