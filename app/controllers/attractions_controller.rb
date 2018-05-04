class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    set_attraction
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction), flash[:notice] => "Attraction successfully created."
      else
        render :new
      end
    else
      redirect_to attractions_path, flash[:error] => "Only admins can create an attraction."
    end
  end

    def edit
      set_attraction
    end

    def update
      set_attraction
      if current_user.admin
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
      else
        redirect_to attractions_path, flash[:error] => "Only admins can update an attraction."
      end
    end

  private

  def set_attraction
    @attraction ||= Attraction.find_by_id(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
