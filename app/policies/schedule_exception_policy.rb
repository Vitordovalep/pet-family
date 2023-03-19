class ScheduleExceptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def show?
    @record.schedule.user.family == user.family || user.admin?
  end

  def create?
    true
  end
end
