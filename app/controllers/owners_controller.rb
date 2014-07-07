class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
    @user = User.new
  end

  def login_user
    @user = User.find(user_params[:id])
    if @user
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/"
    end
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :id)
    end
end
