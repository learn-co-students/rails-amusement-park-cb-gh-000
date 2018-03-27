class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[update show edit]
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction), notice: 'Attraction was successfully created.'
  end

  def edit; end

  def show; end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction), notice: 'Attraction was successfully updated.'
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit('name', 'nausea_rating', 'happiness_rating', 'tickets', 'min_height')
  end
end
