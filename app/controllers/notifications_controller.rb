class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.sort_by(&:created_at).reverse
  end


  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)

    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("notification_#{notification.id}") }
    end
  end
end
