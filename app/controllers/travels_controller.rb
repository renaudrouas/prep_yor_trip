class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update]

  def index
    @trip = Trip.find(params[:trip_id])
    @travels = Travel.all
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @travel = Travel.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @travel = Travel.new(travel_params)
    @travel.trip = @trip
    if @travel.save
      redirect_to trip_travel_path(@trip, @travel), notice: 'travel was successfully created.'
    else
      render :new
    end
  end
  def edit
    @trip = Trip.find(params[:trip_id])
  end
  def update
    @trip = Trip.find(params[:trip_id])
    if @travel.update(travel_params)
      redirect_to trip_travel_path(@trip, @travel), notice: 'travel was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @travel.destroy
    render :index, notice: 'travel was successfully destroyed.'
  end

  private
  def set_travel
    @travel = Travel.find(params[:id])
    #authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:reservation_number, :start_date, :end_date, :compagny_name, :ticket_file, :address_in, :address_out, :latitude, :longitude, :mode, :start_date_time, :end_date_time)
  end
end
