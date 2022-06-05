# frozen_string_literal: true

# Post Policy
class UserPolicy
  def update?
    @user.current_user?
  end

  def edit?
    update?
  end

  def destroy?
    @user.current_user?
  end
end
