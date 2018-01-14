class UsersController < ApplicationController

  def show
    set_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages.uniq.join(', ')
      render :new
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user ||= User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :tickets, :happiness, :nausea, :height, :admin, :password, :password_confirmation)
  end

end
