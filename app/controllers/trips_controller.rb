class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trips.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
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
  def delete
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private
  def set_trip
    @trip =Trip.find(params[:id])
    #authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:title, :country, :latitude, :longitude, :start_date, :end_date)
  end
end


