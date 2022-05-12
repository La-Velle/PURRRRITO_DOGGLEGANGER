class PetPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     scope.all
    end
  end

  #new is nested in created?
  def new?
    create?
  end

  def create?
    true

  end

  # edit is nested in update?
  def update?
    record.user == user

  end

  def destroy?
    record.user == user
  end








end
