# frozen_string_literal: true

# class story policy
class StoryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def destroy?
    user && user == record.user
  end
end
