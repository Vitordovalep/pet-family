class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[destroy]

  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  # def create
  #   @notification = Notification.last
  #   authorize @notification
  #   @user = current_user
  #   NotificationsChannel.broadcast_to(@user.id, @notification)
  # end

  def destroy
    authorize @notification
    @notification.destroy
    redirect_to notifications_path
  end

  def mark_all_as_read
    @notifications = policy_scope(Notification)
    @notifications.unread.update_all(read_at: Time.now)
    redirect_to notifications_path
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
