class RidesController < ApplicationController
  def create
    if logged_in?
      @ride = current_user.rides.create(attraction_id: params[:attraction_id])
      @message = @ride.take_ride
      redirect_to user_path(@ride.user), :alert => @message
    else
      redirect_to login_path, flash[:notice] => "You need to log in first."
    end
  end
end
