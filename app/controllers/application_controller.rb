class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :unless => :devise_controller?

  def notify
    if request.post?
      SendNotificationJob.perform_later params[:message]

      redirect_to channels_path, notice: 'Notification has been sent.'
    end
  end
end
