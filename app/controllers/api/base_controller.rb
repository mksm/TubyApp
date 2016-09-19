class Api::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    render :status => 403
  end
  
  rescue_from ActionController::ParameterMissing do |exception|
    render :status => 406    
  end
  
  before_filter :set_locale

  private
    def set_locale
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    end
end