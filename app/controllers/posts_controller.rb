class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user_id = params[:user_id]
    @user = User.find(params[:user_id])
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.post.new(post_param)
    if @post.save
      redirect_to @post
    else 
      render: new, status: :unprocessable_entity
    end
  end
  private

  def post_param
    params.require(:post).permit(:title, :text)
  end
end
