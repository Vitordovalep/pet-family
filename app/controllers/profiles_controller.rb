class ProfilesController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @users = User.where(family_id: current_user.family_id)
    @family = Family.find(current_user.family_id)
    authorize @user
  end

  def update

  end
end
