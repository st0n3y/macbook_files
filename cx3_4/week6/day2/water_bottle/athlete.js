var athlete = {

  hydration: 100,

  distanceCovered: 0,

  run: function() {

    if( this.hydration > 0 ) {
      this.distanceCovered += 20;
      this.hydration -= 10;
    }
    else {
      return "Rehydrate!";
    }
  }

  rehydrate: function() {

    
  }



}

module.exports = athlete;