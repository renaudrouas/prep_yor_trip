class AccomodationsController < ApplicationController
 before_action :set_accomodation, only: [:show, :edit, :update, :destroy]

  def index
    @accomodations = Accomodations.all
  end

  def show
  end

  def new
    @accomodation = Accomodation.new
  end

  def create
    @accomodation = Accomodation.new(accomodation_params)
    if @accomodation.save
      redirect_to accomodation_path(@accomodation)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @accomodation.update(accomodation_params)
      redirect_to @accomodation, notice: 'Accomodation was successfully updated.'
    else
      render :edit
    end
  end
  def delete
    @accomodation.destroy
    redirect_to accomodations_url, notice: 'Accomodation was successfully destroyed.'
  end

  private
  def set_accomodation
    @accomodation =accomodation.find(params[:id])
    #authorize @accomodation
  end

  def accomodation_params
    params.require(:accomodation).permit(:address, :kind, :name, :e_mail, :phone_number, :latitude, :longitude)
  end
end

