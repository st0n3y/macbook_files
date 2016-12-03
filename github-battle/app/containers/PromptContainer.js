var React = require('react');
var Prompt = require('../components/Prompt');

var PromptContainer = React.createClass({
  // Context allows us to pass items to components without using props (does not scale well)
  contextTypes: {
    router: React.PropTypes.object.isRequired
  },
  getInitialState: function() {
    return {
      username: ''
    }
  },
  handleUpdateUser: function(e) {
    this.setState({
      username: e.target.value
    })
  },
  handleSubmitUser: function(e) {
    e.preventDefault();
    // Cache username so old username does not appear if user goes back
    var username = this.state.username;
    this.setState({
      username: ''
    });
    if(this.props.routeParams.playerOne) {
      this.context.router.push({
        pathname: '/battle',
        // These data will be accessible in the /battle route
        query: {
          playerOne: this.props.routeParams.playerOne,
          playerTwo: this.state.username
        }
      })
    } else {
      this.context.router.push('/playerTwo/' + this.state.username)
    }
  },
  render: function() {
    return (
      <Prompt 
        onSubmitUser={this.handleSubmitUser}
        onUpdateUser={this.handleUpdateUser}
        header={this.props.route.header}
        username={this.state.username} />
    )
  }
});

module.exports = PromptContainer;