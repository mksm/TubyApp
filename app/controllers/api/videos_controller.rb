class Api::VideosController < Api::BaseController
  load_and_authorize_resource
  
  before_action :find_category_ids!, :find_page!, :find_page_size
  
  def index
    @videos = @videos.where(:category_id => @category_ids)
    @videos = @videos.where('name LIKE ?', "%#{params[:q]}%") if params[:q]
    @videos = @videos.page(@page).per(@page_size)
  end
  
  private
    def find_category_ids!
      raise ActionController::ParameterMissing.new(:category_ids) unless params[:category_ids]
      
      @category_ids = params[:category_ids].split(",")
    end
    
    def find_page!
      @page = params[:page]
      raise ActionController::ParameterMissing.new(:page) unless params[:page]
    end
    
    def find_page_size
      @page_size = params[:page_size] || 50
    end
  
end