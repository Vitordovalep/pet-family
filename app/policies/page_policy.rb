class PagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all if user.admin?
    end
  end

  def show?
    record.users.include?(user) || user.admin?
  end

end
