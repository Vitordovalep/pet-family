class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(family: user.family)
    end
  end

  def create?
    true
  end

  def destroy?
    record.family == user.family
  end
end
