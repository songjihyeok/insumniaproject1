class CommentsController < ApplicationController
  def new
  end


  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def current_post

  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
