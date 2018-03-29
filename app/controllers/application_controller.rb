class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def logged_in?
    true if current_user
  end

  def current_user
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

end
