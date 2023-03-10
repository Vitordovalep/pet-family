class ProfilesController < ApplicationController
  def show
    @user = User.find(current_user.id)
    authorize @user
  end

  def update

  end
end
