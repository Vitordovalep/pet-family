class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.joins(schedule: { user: :family }).where(families: { id: user.family})
    end
  end

  def show?
    @record.schedule.user.family == user.family || user.admin?
  end

  def create?
    true
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
