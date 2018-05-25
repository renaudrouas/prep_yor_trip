class StaysController < ApplicationController

  # before_action :set_stay, only: [:show, :edit, :update, :destroy]

  # def index
  #   @stays = Stay.all
  # end

  # def show
  # end

  # def new
  #   @accomodation = Accomodation.new
  #   @trip = Trip.find(params[:trip_id])
  #   @accomodation.stays.build
  #   # @stay = Stay.new

  # end

  # def create
  #   # @trip = Trip.find(params[:trip_id])
  #   # @accomodation = Accomodation.new(params[:accomodation])
  #   #  @accomodation.save
  #   # @stay = Stay.new(stay_params)
  #   # @stay.accomodation = @accomodation
  #   # @stay.trip = @trip

  #   if @stay.save
  #     redirect_to trip_stay_path(@trip, @stay), notice: 'Stay and Accomodation were successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #    @trip = Trip.find(params[:trip_id])
  # end

  # def update
  #   @trip = Trip.find(params[:trip_id])
  #   if @stay.update(stay_params)
  #     redirect_to @stay, notice: 'Stay was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @stay.destroy
  #   redirect_to stays_url, notice: 'Stay was successfully destroyed.'
  # end

  # private

  # def set_stay
  #   @stay = Stay.find(params[:id])
  #   #authorize @stay
  # end

  # def stay_params
  #   params.require(:stay).permit(:start_date, :end_date, :reservation_number, accomodations_attributes:[:address, :name, :e_mail, :phone_number, :latitude, :longitude, :kind])
  # end

  # def accomodation_params
  #   params.require(:accomodation).permit(:address, :name, :e_mail, :phone_number, :latitude, :longitude, :kind)
  # end
end
