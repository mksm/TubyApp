class Api::VideosController < Api::BaseController
  load_and_authorize_resource

  before_action :find_included_youtube_ids, :find_excluded_youtube_ids,:find_page!, :find_page_size

  def index
    # excluded
    @videos = @videos.where.not(:youtube_id => @excluded_youtube_ids) if params[:excluded_youtube_ids]

    # included
    @videos = @videos.or(Video.where(:youtube_id =>  @included_youtube_ids)) if params[:included_youtube_ids]

    # search
    @videos = @videos.where(' lower(video_translations.name) LIKE ?', "%#{params[:q].downcase}%") if params[:q]

    # sort and paginate
    @videos =  @videos.with_translations.order(:created_at).page(@page).per(@page_size)
  end

  private
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
