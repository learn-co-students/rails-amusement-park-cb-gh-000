class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    return head(:forbidden) unless authenticated

    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: "Welcome back to the theme park!"
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end