var React = require('react');
var Comment = require('./Comment.jsx')
var CommentList = React.createClass({
  
  render: function() {

    var commentNodes = this.props.data.map(function(comment) {
      return (
        <Comment author={comment.author} key={comment._id}>  
          {comment.text}
        </Comment>
        // comment.text will pass text as a child to Comment.jsx, where it can be accessed through props.children.
      );
    });

    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});

module.exports = CommentList;