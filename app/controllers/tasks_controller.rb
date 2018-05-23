class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
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
      redirect_to trip_task_path(@task)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  def delete
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = Task.find(params[:id])
    #authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :done, :title)
  end
end
