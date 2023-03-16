class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.joins(pet: :family).where(families: { id: user.family })
    end
  end

  def show?
    @record.pet.family == user.family || user.admin?
  end

  def create?
    true
  end

  def destroy?
    @record.pet.family == user.family || user.admin?
  end

  def edit?
    @record.pet.family == user.family || user.admin?
  end

  def update?
    @record.pet.family == user.family || user.admin?
  end
end
