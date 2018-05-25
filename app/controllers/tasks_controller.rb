# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @tasks = Task.all.order('created_at DESC')
  end

  def show; end

  def new
    @trip = Trip.find(params[:trip_id])
    @task = Task.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @task = Task.new(task_params)
    @task.trip = @trip
    if @task.save
      redirect_to trip_task_path(@trip, @task)
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
      redirect_to trip_task_path(@trip, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @task.destroy
    redirect_to trip_tasks_path, notice: 'Task was successfully destroyed.'
  end

  def complete
    @task = Task.find(params[:trip_id])
    @task.update(done: true)
    redirect_to trip_tasks_path(@task)
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
