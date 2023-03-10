class PetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

 def destroy?
    record.family == user.family
  end

  def edit?
    record.family == user.family
  end
end
