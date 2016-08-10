class Api::VideosController < Api::BaseController
  load_and_authorize_resource
  
  before_action :find_category_ids!
  
  def index
    @videos = @videos.where(:category_id => @category_ids)
    @videos = @videos.where('name LIKE ?', "%#{params[:q]}%") if params[:q]
  end
  
  private
    def find_category_ids!
      raise ActionController::ParameterMissing.new(:category_ids) unless params[:category_ids]
      
      @category_ids = params[:category_ids].split(",")
    end
  
end