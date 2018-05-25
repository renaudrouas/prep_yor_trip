class AccomodationsController < ApplicationController
before_action :set_accomodation, only: [:show, :edit, :update, :destroy]

  def index
    @accomodations = Accomodation.all
  end

  def show
  end

  def new
    @accomodation = Accomodation.new
    @trip = Trip.find(params[:trip_id])
    @accomodation.stays.build
    #@stay = Stay.new
  end

  def create
    @trip = Trip.find(params[:trip_id])

    @accomodation = Accomodation.new(accomodation_params)
    @accomodation.stays.each do |stay|
      stay.trip = @trip
    end
    if @accomodation.save
      redirect_to trip_accomodation_path(@trip, @accomodation), notice: 'accomodation and stay were successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @accomodation.update(accomodation_params)
      redirect_to @accomodation, notice: 'accomodation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @accomodation.destroy
    redirect_to accomodations_url, notice: 'accomodation was successfully destroyed.'
  end

  private

  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
    #authorize @accomodation
  end

  def accomodation_params
    params.require(:accomodation).permit(:address, :name, :e_mail, :phone_number, :latitude, :longitude, :kind, stays_attributes:[:start_date, :end_date, :reservation_number])
  end
end
