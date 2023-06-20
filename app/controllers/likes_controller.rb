class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @like = post.likes.new(author: post.author)
    if @like.save
      redirect_to user_post_path(post.author, post)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
