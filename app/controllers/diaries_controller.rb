class DiariesController < ApplicationController
before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @diaries = Diary.all
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @diary = Diary.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @diary = Diary.new(diary_params)
    @diary.trip = @trip
    if @diary.save
      redirect_to trip_diary_path(@trip,@diary)
    else
      render :new
    end
  end
  def edit
    @trip = Trip.find(params[:trip_id])
  end
  def update
    @trip = Trip.find(params[:trip_id])
    if @diary.update(diary_params)
      redirect_to trip_diary_path(@trip,@diary), notice: 'Diary was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @trip = Trip.find(params[:trip_id])
    @diary.destroy
    redirect_to trip_diaries_path, notice: 'Diary was successfully destroyed.'
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
    #authorize @diary
  end

  def diary_params
    params.require(:diary).permit(:date, :description, :address, :title, :latitude, :longitude)
  end
end
