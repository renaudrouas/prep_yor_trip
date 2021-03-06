# frozen_string_literal: true

class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @travels = @trip.travels.order(start_date: :asc)

    @markers = @travels.map do |travel|
      [
        {
          lat: travel.latin,
          lng: travel.lngin,
          infoWindow: {
            content: render_to_string(partial: "/travels/map_box", locals: {
              travel: travel,
              departure: true
            })
          }
        },
        {
          lat: travel.latout,
          lng: travel.lngout,
          infoWindow: {
            content: render_to_string(partial: "/travels/map_box", locals: {
              travel: travel,
              departure: false
            })
          }
        }
      ]
    end
    # pry-byebug
    @markers.flatten!

    @path = @travels.map do |travel|
      [[travel.latin, travel.lngin], [travel.latout, travel.lngout]]
    end
    @path= @path.flatten(1)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @markers =
      [
        {
          lat: @travel.latin,
          lng: @travel.lngin,
          infoWindow: {
            content: render_to_string(partial: "/travels/map_box", locals: {
              travel: @travel,
              departure: true
            })
          }
        },
        {
          lat: @travel.latout,
          lng: @travel.lngout,
          infoWindow: {
            content: render_to_string(partial: "/travels/map_box", locals: {
              travel: @travel,
              departure: false
            })
          }
        }
      ]

     @path = [@travel.latin, @travel.lngin], [@travel.latout, @travel.lngout]
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @travel = Travel.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @travel = Travel.new(travel_params)
    # latlngin = Geocoder.search(@travel.address_in)
    # @travel.latin = latlngin[0].data["geometry"]["location"]["lat"]
    # @travel.lngin = latlngin[0].data["geometry"]["location"]["lng"]
    # latlngout = Geocoder.search(@travel.address_out)
    # @travel.latout = latlngout[0].data["geometry"]["location"]["lat"]
    # @travel.lngout = latlngout[0].data["geometry"]["location"]["lng"]
    # @travel.trip = @trip
    # if @travel.save
    geo_in = Geocoder.search(@travel.address_in)
    @travel.latin = geo_in[0].data["geometry"]["location"]["lat"]
    @travel.lngin = geo_in[0].data["geometry"]["location"]["lng"]
    geo_out = Geocoder.search(@travel.address_out)
    @travel.latout = geo_out[0].data["geometry"]["location"]["lat"]
    @travel.lngout = geo_out[0].data["geometry"]["location"]["lng"]
    @travel.trip = @trip
    if @travel.save
      redirect_to trip_travels_path(@trip), notice: 'travel was successfully created.'
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
      redirect_to trip_travels_path(@trip), notice: 'travel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @travel.destroy
    redirect_to trip_travels_path, notice: 'travel was successfully destroyed.'
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    # authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:reservation_number, :start_date, :end_date, :compagny_name, :ticket_file, :address_in, :address_out, :latitude, :longitude, :mode, :start_date_time, :end_date_time)
  end
end
