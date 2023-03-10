class FamilyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    record.users.include?(user)
  end

  def create?
    true
  end

  def create_join?
    true
  end
end
