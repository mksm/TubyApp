class Api::VideosController < Api::BaseController
  load_and_authorize_resource
  
  before_action  :find_category_ids!, :find_included_youtube_ids, :find_excluded_youtube_ids,:find_page!, :find_page_size
  
  def index
    # included
    @included_videos = @videos.where(:youtube_id =>  @included_youtube_ids) if params[:included_youtube_ids]


    # categories
    @videos = @videos.where(:category_id => @category_ids)
    
    # excluded
    @videos = @videos.where.not(:youtube_id => @excluded_youtube_ids) if params[:excluded_youtube_ids]

    # add included videos to the collection
    if @included_videos
      @videos = @videos + @included_videos

      # sort the new array by date
      @videos =  @videos.sort_by &:created_at
    end

    # search
    @videos = @videos.with_translations.where(' lower(video_translations.name) LIKE ?', "%#{params[:q].downcase}%") if params[:q]

    # paging
    if @included_videos
      @videos = Kaminari.paginate_array(@videos).page(@page).per(@page_size)
    else
      @videos = @videos.page(@page).per(@page_size)
    end

  end

  private
    def find_category_ids!
      raise ActionController::ParameterMissing.new(:category_ids) unless params[:category_ids]
      
      @category_ids = params[:category_ids].split(",")
    end

  def find_included_youtube_ids
      if params[:included_youtube_ids]
        @included_youtube_ids = params[:included_youtube_ids].split(",")
      end
  end

  def find_excluded_youtube_ids
    if params[:excluded_youtube_ids]
      @excluded_youtube_ids = params[:excluded_youtube_ids].split(",")
    end
  end
    
    def find_page!
      @page = params[:page]
      raise ActionController::ParameterMissing.new(:page) unless params[:page]
    end
    
    def find_page_size
      @page_size = params[:page_size] || 50
    end

end