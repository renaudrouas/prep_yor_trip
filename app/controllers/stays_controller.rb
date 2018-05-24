class StaysController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]

  def index
    @stays = Stay.all
  end

  def show
  end

  def new
    @accomodation = Accomodation.new
    @stay = Stay.new
  end

  def create
    @accomodation = Accomodation.new(accomodation_params)
    @accomodation.save
    @accomodation.stay = @accomodation
    @stay = Stay.new(stay_params)
    if @stay.save
      redirect_to stay_path(@stay)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stay.update(stay_params)
      redirect_to @stay, notice: 'Stay was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stay.destroy
    redirect_to stays_url, notice: 'Stay was successfully destroyed.'
  end

  private

  def set_stay
    @stay = Stay.find(params[:id])
    #authorize @stay
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def stay_params
    params.require(:stay).permit(:start_date, :end_date, :reservation_number)
  end

  def accomodation_params
    params.require(:accomodation).permit(:address, :name, :e_mail, :phone_number, :latitude, :longitude, :kind)
  end
end
