class StaysController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]

  def index
    @stays = Stay.all
  end

  def show
  end

  def new
    @stay = Stay.new
  end

  def create
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
  def delete
    @stay.destroy
    redirect_to stays_url, notice: 'Stay was successfully destroyed.'
  end

  private
  def set_stay
    @stay = Stay.find(params[:id])
    #authorize @stay
  end

  def stay_params
    params.require(:stay).permit(:start_date, :end_date, :reservation_number)
  end
end
