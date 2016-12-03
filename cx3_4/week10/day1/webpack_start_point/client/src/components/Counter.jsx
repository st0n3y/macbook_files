var React = require('react');

var Counter = React.createClass({
  getInitialState: function() {
    return {count: 0}
  },

  incrementCount: function(){
    console.log("button pressed");
    //this.setState prods the virtual DOM into updating the display
    this.setState({
      count: this.state.count + this.props.multiple
    });
  },

  decrementCount: function() {
    this.setState({
      if(this.state.count - this.props.multiple <= 0){
        count: 0
      } else {
        count: this.state.count - this.props.multiple
      }
    })
    // this.setState({
    //   count: this.state.count - this.props.multiple
    // })
  },

  render: function() {
    return (
      //Any additions here must be wrapped in an all-encompassing div.
        <div> 
          <h1> {this.props.title} </h1>
          <h4> The multiple is {this.props.multiple} </h4>
          <p> The current count is {this.state.count} </p>
          <button onClick={this.incrementCount}>Increment</button>
          <button onClick={this.decrementCount}>Decrement</button>
        </div>
      );
  }
});

module.exports = Counter;