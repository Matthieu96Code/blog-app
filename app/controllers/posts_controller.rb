class PostsController < ApplicationController
  def index; end

  def show
    @pid = params[:id]
  end
end
