var React = require('react');
var Comment = require('./Comment.jsx');

var CommentList = React.createClass({

  render: function(){
    var commentArray = this.props.data.map(function(comment){
      return(
        <Comment 
          key={comment.id}
          id={comment.id}
          author={comment.author} 
          text={comment.text}
          onCommentDelete={this.props.onCommentDelete}
        />
      )
    }.bind(this));
    return (
    <div>
      Hello! I am a comment list.
      {commentArray}
    </div>
    );
  }
});

module.exports = CommentList;