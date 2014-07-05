class RidesController < ApplicationController

  def new
    @ride = Ride.create(
      :customer_id => params[:customer_id],
      :attraction_id => params[:attraction_id]
    )
    @message = @ride.start_ride
    redirect_to customer_path(@ride.customer, :message => @message)
  end

  private

    def attraction_params
      params.require(:ride).permit( 
        :customer_id,
        :attraction_id,
      )
    end

end