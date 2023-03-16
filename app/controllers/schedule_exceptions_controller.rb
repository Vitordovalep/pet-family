class ScheduleExceptionsController < ApplicationController

  def create
    task = Task.find(params[:task_id])
    @schedule = task.schedule
    if @exception = @schedule.schedule_exceptions.create(start_time: params[:exception_date])
      redirect_to root_path, notice: "Marked as done"
    else
      render "pages/show", notice: "Not able to mark as done"
    end
    authorize @exception
  end

end
