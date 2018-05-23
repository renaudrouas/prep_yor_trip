class DiariesController < ApplicationController
 before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = Diaries.all
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diary_path(@diary)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: 'Diary was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @diary.destroy
    redirect_to diarys_url, notice: 'Diary was successfully destroyed.'
  end

  private
  def set_diary
    @diary =diary.find(params[:id])
    #authorize @diary
  end

  def diary_params
    params.require(:diary).permit(:date, :description, :title, :address, :latitude, :longitude)
  end
end
