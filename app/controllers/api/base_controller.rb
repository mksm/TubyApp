class Api::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    render :status => 403
  end
  
  rescue_from ActionController::ParameterMissing do |exception|
    render :status => 406    
  end
end