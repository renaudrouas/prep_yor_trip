# frozen_string_literal: true

class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: %i[show edit update destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @accomodations = @trip.accomodations

    @markers = @accomodations.map do |accomodation|
       {
          lat: accomodation.latitude,
          lng: accomodation.longitude,
          infoWindow: {
            content: render_to_string(partial: "/accomodations/map_box", locals: {
              stay: accomodation
            })
          }
        }
    end
    @markers.flatten!

    @path = @accomodations.map do |accomodation|
      [accomodation.latitude, accomodation.longitude]
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @stays = @accomodation.stays
    @markers =
       [{
          lat: @accomodation.latitude,
          lng: @accomodation.longitude,
          infoWindow: {
            content: render_to_string(partial: "/accomodations/map_box", locals: {
              stay: @accomodation
            })
          }
        }]

    @path = [@accomodation.latitude, @accomodation.longitude]
  end

  def new
    @accomodation = Accomodation.new
    @trip = Trip.find(params[:trip_id])
    @accomodation.stays.build
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @accomodation = Accomodation.new(accomodation_params)
    @accomodation.stays.each do |stay|
      stay.trip = @trip
    end
    if @accomodation.save
      redirect_to trip_accomodations_path(@trip), notice: 'accomodation and stay were successfully created.'
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    # @accomodations.each do |accomodation|
    # @stays = accomodation.stays
    # end
    #   @stay = @stays.first
    #   @stay.destroy
    if @accomodation.update(accomodation_params)
      redirect_to trip_accomodations_path(@trip), notice: 'accomodation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @accomodation.destroy
    redirect_to trip_accomodations_path, notice: 'accomodation was successfully destroyed.'
  end

  private

  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
    # authorize @accomodation
  end

  def accomodation_params
    params.require(:accomodation).permit(
      :address, :name, :e_mail, :phone_number,
      :latitude, :longitude, :kind,
      stays_attributes:[:id, :start_date, :end_date, :trip_id, :reservation_number]
    )
  end
end
