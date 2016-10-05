class CategoriesController < ApplicationController
  load_and_authorize_resource

  def create
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  def notify
    return unless ENV['NOTIFIABLE_URL']
    message = 'We\'ve added some new categories'

    Rails.logger.debug "Sending notification : #{message}"

    http = Net::HTTP.new(ENV['NOTIFIABLE_URL'])

    request = Net::HTTP::Post.new("/notifications_api/v1/notifications")
    request["Authorization"] = ENV['NOTIFIABLE_ACCESS_ID']
    request["Accept"] = "application/json"

    data = {
        "app_id" => ENV['NOTIFIABLE_APP_ID'],
        "notification[localized_notifications_attributes][][message]" => message,
        "notification[localized_notifications_attributes][][locale]" => "en" }

    request.set_form_data(data)

    request.each_header do |key,data|
      Rails.logger.debug("Request header : #{key} : #{data}")
    end
    Rails.logger.debug("Request host : #{request.uri}")
    Rails.logger.debug("Request body : #{request.body}")
    Rails.logger.debug "Request : #{request}"

    response = http.request(request)

    Rails.logger.debug "Notification response: #{response.code}"

    if response.code == 200
      redirect_to categories_path, notice: 'Notification has been sent.'
    else
      redirect_to categories_path, notice: 'Notification was not sent.'
    end

  end

  private
    def category_params
      params.require(:category).permit(:name_en, :name_ar)
    end
end
