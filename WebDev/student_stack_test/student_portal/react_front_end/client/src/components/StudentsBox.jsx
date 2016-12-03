var React = require('react');

var StudentsBox = React.createClass({
  
  loadResourcesFromServer: function() {
    var url = this.props.url;
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.setRequestHeader("Content-Type", "application/json");
    request.onload = function() {
      if(request.status === 200) {
        var data = JSON.parse(request.responseText);
        this.setState({data: data});
      }
    }.bind(this);
    request.send(null);
  },

  componentDidMount: function() {
    this.loadResourcesFromServer();
  },

  getInitialState: function () {
    return {
      data: []
    };
  },

  render: function(){
    console.log(this.state.data);

    const nodes = this.state.data.map(function(student, index) {
        return (
          <div>
            <h3>{student.first_name}</h3>
            <h2>{student.last_name}</h2>
            <h4>Cohort {student.cohort}</h4>
          </div>
        );
      }.bind(this));

    return (
      <div>
        {nodes}
      </div>
    );
  }

});

module.exports = StudentsBox;