class UsersController < ApplicationController
  def index
    @users = User.all
    @current = @users.first
  end

  def show
    @id = params[:id]
    @current_user = User.find(params[:id])
  end

  # def user_params
  #   params.require(:user).permit(:photo, :bio)
  # end
end
