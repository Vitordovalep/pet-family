class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @tasks = policy_scope(Task)
    @schedules = Schedule.all
    @calendar_schedules = @schedules.flat_map { |e| e.calendar_events(e.start_time, e.end_time) }
  end

  # params.fetch([:start_date], Time.zone.now).to_date

  def show
    authorize @task
  end

  def new
    @task = Task.new
    @task.build_schedule
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    if @task.save
      if params[:task][:schedule_attributes][:recurring_rule] != ""
        schedule = @task.schedule
        schedule.recurring_rule = params[:task][:schedule_attributes][:recurring_rule]
        schedule.save
      end
      redirect_to tasks_path, notice: "A tarefa foi criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @task
  end

  def update
    authorize @task
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "A tarefa foi atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:category, :description, schedule_attributes: %i[start_time end_time due_time pet_id user_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
