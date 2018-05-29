# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy complete]
  skip_before_action :verify_authenticity_token, only: :complete
  skip_before_action :authenticate_user!, only: :complete

  def index
    @trip = Trip.find(params[:trip_id])
    @tasks = @trip.tasks
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @task = Task.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @task = Task.new(task_params)
    @task.trip = @trip
    if @task.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    if @task.update(task_params)
      redirect_to trip_path(@trip), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @task.destroy
    redirect_to trip_path(@trip), notice: 'Task was successfully destroyed.'
  end

  def complete
    @trip = Trip.find(params[:trip_id])
    if @task.done?
      @task.update(done: false)
    else
      @task.update(done: true)
    end
    render json: { done: @task.done? }
  end

  private

  def set_task
    @task = Task.find(params[:id])
    # authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :done, :title)
  end
end
