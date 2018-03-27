class UsersController < ApplicationController
  before_action :set_user, :require_sign_in, only: %i[show update edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: 'Welcome to the theme park!' }
      else
        flash.now[:error] = @user.errors.full_messages.first
        format.html { render new_user_path }
      end
    end
  end

  def show; end

  def update
    @user.update(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: 'updated' }
      else
        flash.now[:error] = @user.errors.full_messages.first
        format.html { render :edit }
      end
    end
  end

  def edit; end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit('name', 'nausea', 'happiness', 'tickets', 'height', 'password', 'password_confirmation', 'admin')
  end

  def require_sign_in
    redirect_to root_path, alert: 'requir sign in' unless user_signed_in?
  end
end
