class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  def login
    @owner = Owner.new
  end

  def login_user
    @owner = Owner.find(owner_params[:id])
    if @owner
      redirect_to "/owners/#{@owner.id}"
    else
      redirect_to "/"
    end
  end

  def show
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end

    def owner_params
      params.require(:owner).permit(:name, :id)
    end
end
