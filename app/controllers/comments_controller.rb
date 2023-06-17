class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(author: current_user, **comment_parameters)
    if @comment.save
      redirect_to user_post_path(current_user, post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
