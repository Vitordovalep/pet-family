class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @tasks = policy_scope(Task)
    @schedules = Schedule.all
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
      schedule = @task.schedule
      schedule.end_time = schedule.start_time + 1.years if schedule.end_time.nil?
      if params[:task][:schedule_attributes][:recurring_rule] != "null"
        schedule.recurring_rule = params[:task][:schedule_attributes][:recurring_rule]
        schedule.save
      else
        schedule.recurring_rule = IceCube::Rule.daily.count(1)
        schedule.save
      end
      redirect_to main_page_path, notice: "A tarefa foi criada com sucesso!"
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
      add_update_schedule_notification(@task)
      redirect_to main_page_path, notice: "Tarefa atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to request.referrer, notice: "Tarefa excluída com sucesso"
  end

  private

  def task_params
    params.require(:task).permit(:category, :description, schedule_attributes: %i[start_time end_time due_time pet_id user_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def add_update_schedule_notification(task)
    Notification.create(schedule: task.schedule, message: "A tarefa '#{task.category}' para o pet #{task.schedule.pet.name} foi atualizada", user: task.schedule.user, family: task.schedule.user.family)
  end
end
