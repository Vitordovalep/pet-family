class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    @record.schedule.user.family == user.family
  end

  def create?
    @record.schedule.user.family == user.family
  end

  def destroy?
    @record.schedule.user.family == user.family
  end

  def edit?
    @record.schedule.user.family == user.family
  end

  def update?
    @record.schedule.user.family == user.family
  end
end
