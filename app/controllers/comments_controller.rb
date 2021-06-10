class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    unless @comment.save
      render 'error'  # app/views/comments/error.js.erbを参照する
    end
     # app/views/comments/create.js.erbを参照する
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # app/views/comments/destroy.js.erbを参照する
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
