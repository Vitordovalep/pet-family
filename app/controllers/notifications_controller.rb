class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
  end

  def create
    @notification = Notification.last
    authorize @notification
    @user = current_user
    NotificationsChannel.broadcast_to(@user.id, @notification)
  end
end
