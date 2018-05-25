class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def weather
    @weather = Weather.new(:destination,:start_date,:end_date)
    @weather = @weather.call

  end
#   <i class="fa fa-sun"></i>
#   <i class="fa fa-thermometer"></i>
# <i class="fa fa-cloud"></i>
# <i class="fa fa-tint"></i>
  def show
    @travels = @trip.travels
    @stays = @trip.stays
    @diaries = @trip.diaries
    @weather = Weather.new(@trip.destination, @trip.start_date, @trip.end_date)
    @weather = @weather.call
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip), notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    #authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :latitude, :longitude, :title)
  end
end
