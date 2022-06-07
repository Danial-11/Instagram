# frozen_string_literal: true

# class postpolicy
class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def edit?
    update?
  end

  def update?
    user && user == record.user
  end

  def destroy?
    user && user == record.user
  end
end
