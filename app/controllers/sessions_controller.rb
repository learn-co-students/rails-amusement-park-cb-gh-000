class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end