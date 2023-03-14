class PagesController < ApplicationController

  def show
    @family = Family.find(current_user.family.id)
    authorize @family
    @pets = Pet.includes(breed: :species).where(family_id: @family)
    # Calendar
    @tasks = policy_scope(Task)
    @schedules = Schedule.includes(:pet, :task, :user).all
    @calendar_schedules = @schedules.flat_map { |e| e.calendar_events(e.start_time, e.end_time) }
  end
end
