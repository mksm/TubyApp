class Api::VideosController < Api::BaseController
  load_and_authorize_resource
  
  before_action :find_category_ids!, :find_page!, :find_page_size
  
  def index
    
    # categories
    @videos = @videos.where(:category_id => @category_ids)
    
    # included
    @videos = @videos.where(:youtube_id => params[:included_youtube_ids]) if params[:included_youtube_ids]
    
    # excluded
    @videos = @videos.where.not(:youtube_id => params[:excluded_youtube_ids]) if params[:excluded_youtube_ids]
    
    # search
    @videos = @videos.with_translations.where(' lower(video_translations.name) LIKE ?', "%#{params[:q].downcase}%") if params[:q]
    
    # paging
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