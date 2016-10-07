class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return unless ENV['NOTIFIABLE_URL']
    
    message = 'We\'ve added some new categories'
    send_notification(ENV['NOTIFIABLE_URL'], ENV['NOTIFIABLE_ACCESS_ID'], ENV['NOTIFIABLE_APP_ID'], "en", message)
  end
  
  private
  def send_notification(notifiable_url, notifiable_access_id, notifiable_app_id, locale, message)
    
    Rails.logger.debug "Sending notification : #{message}"

    http = Net::HTTP.new(notifiable_url)

    request = Net::HTTP::Post.new("/notifications_api/v1/notifications")
    request["Authorization"] = notifiable_access_id
    request["Accept"] = "application/json"

    data = {
        "app_id" => notifiable_app_id,
        "notification[localized_notifications_attributes][][message]" => message,
        "notification[localized_notifications_attributes][][locale]" => locale }

    request.set_form_data(data)
    response = http.request(request)
    
    Rails.logger.debug "Notification response: #{response.code}"
    
    response.code.to_i
  end
end
