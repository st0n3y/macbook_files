class CommentsController < ApplicationController

  # def index()
  #   comments = [
  #     {
  #       id: 1, 
  #       author: "David", 
  #       text: "Hello"
  #     },
  #     {
  #       id: 2, 
  #       author: "Rubot", 
  #       text: "Beep boop"
  #     }
  #   ]
  #   render :json => comments
  # end

  def index()
    comments = Comment.all
    render :json => comments
  end

  def create()
    comment = Comment.create(comment_params)
    render :json => comment
  end


  private
  def comment_params()
    params.require(:comment).permit(:text, :author)
  end

end