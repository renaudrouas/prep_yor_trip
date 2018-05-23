class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = Travels.all
  end

  def show
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to travel_path(@travel)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @travel.update(travel_params)
      redirect_to @travel, notice: 'Travel was successfully updated.'
    else
      render :edit
    end
  end
  def delete
    @travel.destroy
    redirect_to travels_url, notice: 'Travel was successfully destroyed.'
  end

  private
  def set_travel
    @travel = Travel.find(params[:id])
    #authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:reservation_number, :mode, :start_date, :end_date,
      :compagny_name, :ticket_file, :address_in, :address_out, :latitude, :longitude, :start_date_time, :end_date_time)
  end
end
