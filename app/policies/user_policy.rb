class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.admin?
    end
  end

  def show?
    record == user || user.admin?
  end

  def edit?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user || user.admin?
  end
end
