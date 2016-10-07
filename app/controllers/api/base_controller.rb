class Api::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    head 403
  end
  
  rescue_from ActionController::ParameterMissing do |exception|
    head 406    
  end
  
  before_action :authorize_client!, :set_locale

  private
    def authorize_client!
      access_id, secret_key = access_id_and_secret_key

      head(:unauthorized) unless access_id && secret_key && ApiAuth.authentic?(request, secret_key)
    end
    
    def access_id_and_secret_key
      access_id = ApiAuth.access_id(request)
      secret_key = nil
      if access_id == ENV['android_access_id']
        secret_key = ENV['android_secret_key']
      elsif access_id == ENV['ios_access_id']
        secret_key = ENV['ios_secret_key']
      end
      return access_id, secret_key
    end
  
    def set_locale
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    end
end