class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user_id = params[:user_id]
    @user = User.find(params[:user_id])
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(**post_parameters, likes_counter: 0, comments_counter: 0)
    if @post.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
