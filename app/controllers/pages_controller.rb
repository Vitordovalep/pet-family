class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: ["home"]

  def home
  end

  def show
    @family = Family.find(current_user.family.id)
    authorize @family
    @pets = Pet.includes(breed: :species).where(family_id: @family)
    # Calendar

    if params[:query].present?
      @schedules = Schedule.includes(:pet, :task, :user).where(pet_id: params[:query])
    else
      @schedules = Schedule.includes(:pet, :task, :user).where(pet: @pets)
    end

    @calendar_schedules = @schedules.flat_map { |e| e.calendar_events(e.start_time, e.end_time) } + ScheduleException.all.to_a
    @events_schedule = []
    @events_schedule_exceptions = []


    respond_to do |format|
      format.html
      format.text { render partial: "calendar", locals: { calendar_schedules: @calendar_schedules }, formats: [:html] }
    end
  end
end
