var React = require('react');
var CommentList = require('./CommentList');
var CommentForm = require('./CommentForm');

var CommentBox = React.createClass({
  
  getInitialState: function(){
    return {data: []};
  },

  fetchComments: function(){
    console.log("CDM was called");
    var request = new XMLHttpRequest();
    request.open("GET", this.props.url);
    request.onload = function(){
      var comments = JSON.parse(request.responseText);
      this.setState({data: comments})
    }.bind(this);
    request.send();
  },

  componentDidMount: function(){
    this.fetchComments();
    setInterval(this.fetchComments, 1000);
  },

  handleCommentSubmit: function(comment){
    var comments = this.state.data;
    comment._id = Date.now();
    var newComments = comments.concat([comment]);
    this.setState({data: newComments});

    var request = new XMLHttpRequest();
    request.open("POST", this.props.url);
    request.setRequestHeader("Content-Type", "application/json");
    request.onload = function(){
      if(request.status === 200){
        this.fetchComments();
      }
    }.bind(this);
    request.send( JSON.stringify(comment) );
  },

  render: function(){
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div>
    );
  }
});

module.exports = CommentBox;