class TasksController < ApplicationController
  # before_action :set_task, only: %i[show]
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_task_schedule_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:category, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
