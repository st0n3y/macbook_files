var _ = require('lodash');

var robot = {
  bestFriend: "david",
  welcome: function(){
    return "Hello, " + _.capitalize(this.bestFriend);
  }
}

module.exports = robot;

// module.exports = {
//   robot: robot
// }