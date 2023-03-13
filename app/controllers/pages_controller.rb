class PagesController < ApplicationController

  def show
    @family = Family.find(current_user.family.id)
    authorize @family
    @pets = Pet.where(family_id: @family)
    @my_schedules = current_user.schedules
    @family_schedules = @family.pets.map(&:schedules).flatten
  end
end
