
# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = Trip.where(user_id: current_user)
    # raise
  end

  def show
    @country_info = Restcountry::Country.find_by_name(@trip.destination[0..2])

    @travels = @trip.travels.order('start_date')
    @stays = @trip.stays.order('start_date')
    @diaries = @trip.diaries
    @tasks = @trip.tasks
    @accomodations = @trip.accomodations
    combined_timeline = (@travels + @stays + @diaries).flatten
    combined_maps = (@travels + @stays).flatten
    @date_order = combined_timeline.sort_by{|item|item.start_date}
    @date_order_maps = combined_maps.sort_by{|item|item.start_date}

    @weather = Weather.new(@trip.latitude, @trip.longitude)
    @weather = @weather.call


    gouv = Gouv.new(@trip.destination)
    @vaccination = gouv.call[:vaccination]

    # flag = Flag.new(@trip.destination)
    # @flag = flag.call[:flag]
    set_markers
    set_path
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

  def set_markers
    @markers = @date_order_maps.map do |element|
      if element.class == Stay
        {
          lat: element.accomodation.latitude,
          lng: element.accomodation.longitude,
          infoWindow: {
            content: render_to_string(partial: "/accomodations/map_box", locals: {
              stay: element
            })
          }
        }
          else
            [
              {
                lat: element.latin,
                lng: element.lngin,
                infoWindow: {
                  content: render_to_string(partial: "/travels/map_box", locals: {
                    travel: element,
                    departure: true
                  })
                }
              },
              {
                lat: element.latout,
                lng: element.lngout,
                infoWindow: {
                  content: render_to_string(partial: "/travels/map_box", locals: {
                    travel: element,
                    departure: false
                  })
                }
              }
            ]
          end
        end
        @markers.flatten!
      end

        def set_path
          @path = @date_order_maps.map do |element|
            if element.class == Stay
              [[element.accomodation.latitude, element.accomodation.longitude]]
            else
              [[element.latin, element.lngin], [element.latout, element.lngout]]
            end
          end
          @path = @path.flatten(1)
        end
      end
