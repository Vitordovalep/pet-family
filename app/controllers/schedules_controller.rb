class SchedulesController < ApplicationController
  # before_action :set_task, only: %i[new create]

  # def new
  #   @schedule = Schedule.new
  # end

  # def create
  #   @schedule = Schedule.new(schedule_params)
  #   @schedule.task = @task
  #   if @schedule.save
  #     redirect_to root_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # private

  # def schedule_params
  #   params.require(:schedule).permit(:start_date, :end_date, :due_time, :pet_id, :user_id)
  # end

  # def set_task
  #   @task = Task.find(params[:task_id])
  # end
end
