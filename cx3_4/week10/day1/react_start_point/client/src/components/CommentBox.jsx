var React = require('react');
var CommentList = require('./CommentList.jsx')
var CommentForm = require('./CommentForm.jsx')

var sampleData = [
  {id: 1, author: "Keith", text: "Boom!"},
  {id: 2, author: "Rick", text: "Cool."},
  {id: 3, author: "Kat", text: "Howdy."}
]

var CommentBox = React.createClass({

  getInitialState: function(){
    return {data: sampleData}
  },

  handleCommentSubmit: function(comment) {
    comment.id = Date.now();
    var newComments = this.state.data.concat([comment]);
    this.setState({data: newComments});
  },

  handleDelete: function(id){
    var filteredComments = this.state.data.filter(function(comment){
      return comment.id != id
    });
    this.setState({data: filteredComments});
  },

  render: function(){
    return (
    <div>
      Hello! I am a comment box.
      <CommentList data={this.state.data} onCommentDelete={this.handleDelete}/>
      <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
    </div>
    );
  }
});

module.exports = CommentBox;