class UsersController < ApplicationController
  def index
    @users = User.all
    @current = current_user
  end

  def show
    @id = params[:id]
    @current_user = User.find(params[:id])
  end
end
