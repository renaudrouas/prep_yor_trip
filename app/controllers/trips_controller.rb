
# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = Trip.all
  end

  def show
    @country_info = Restcountry::Country.find_by_name(@trip.destination[0..2])
    @travels = @trip.travels
    @stays = @trip.stays
    @travels = @trip.travels.order('start_date')
    @stays = @trip.stays.order('start_date')
    @diaries = @trip.diaries
    @tasks = @trip.tasks
    @accomodations = @trip.accomodations
    combined = (@travels + @stays).flatten
    @date_order = combined.sort_by{|item|item.start_date}
    @weather = Weather.new(@trip.destination)
    @weather = @weather.call
    gouv = Gouv.new(@trip.destination)
    @vaccination = gouv.call[:vaccination]
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

  def edit; end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.task.destroy
    redirect_to trips_url, notice: 'Task was successfully destroyed.'
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    # authorize @trip
  end

  def set_task
    @task = Task.find(params[:id])
    # authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :done, :title)
  end

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :latitude, :longitude, :title)
  end
end
