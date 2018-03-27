class RidesController < ApplicationController
  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(params[:user_id])
  end
end
