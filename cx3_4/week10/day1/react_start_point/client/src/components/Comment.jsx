var React = require('react');

var Comment = React.createClass({
  handleCommentDelete: function(){
    console.log("削除ボタンが押された", this.props.author);
    this.props.onCommentDelete(this.props.id)
  },

  render: function(){
    return (
      <div>
        <h2>{this.props.author}</h2>
        {this.props.text}
        <button onClick={this.handleCommentDelete}>削除</button>
      </div>
    )
  }
});

module.exports = Comment;