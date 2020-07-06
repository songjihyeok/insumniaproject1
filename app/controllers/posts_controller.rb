class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:show, :destroy, :edit]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "post has been saved"
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def edit

  end

  def update

    if @post.update(post_params)
      flash[:notice] = "post has been updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
