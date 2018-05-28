# frozen_string_literal: true

class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: %i[show edit update destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @accomodations = Accomodation.all
    @accomodations.each do |accomodation|
    @stays = accomodation.stays
    end
    @accomodations_geo = @accomodations.where.not(latitude: nil, longitude: nil)
    @markers = @accomodations_geo.map do |accomodation|
     {
       lat: accomodation.latitude,
       lng: accomodation.longitude,
       title: accomodation.name,
       label: "#{accomodation.kind}",
       id: accomodation.id
     }
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @stays = @accomodation.stays
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
    # @stays = @accomodation.stays
    # @stays.destroy
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
      stays_attributes:[:start_date, :end_date, :trip_id, :reservation_number]
    )
  end
end
