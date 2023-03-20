class ScheduleExceptionsController < ApplicationController
  def create
    task = Task.find(params[:task_id])
    @schedule = task.schedule
    if @exception = @schedule.schedule_exceptions.create(start_time: params[:exception_date])
      redirect_to request.referrer, notice: "Tarefa realizada"
    else
      render "pages/show", notice: "Não foi possível realizar tarefa"
    end
    authorize @exception
  end
end
