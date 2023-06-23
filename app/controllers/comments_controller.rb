class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(author: post.author, **comment_parameters)
    if @comment.save
      redirect_to user_post_path(post.author, post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
