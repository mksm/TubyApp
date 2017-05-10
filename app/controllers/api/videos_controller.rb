class Api::VideosController < Api::BaseController
  load_and_authorize_resource

  before_action :find_included_youtube_ids, :find_excluded_youtube_ids,:find_page!, :find_page_size, :find_channel_ids!, :find_trending

  def index
    #all
    @videos = Video.where(:hidden => false)
    #trending
    if @trending == "true"
      @videos = @videos.trending
    elsif @trending == "false"
      @videos = @videos.not_trending
    end
    #by channel
    @videos = @videos.where(:channel_id => @channel_ids) if params[:channel_ids]
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
    raise ActionController::ParameterMissing.new(:page) unless params[:page]
    @page = params[:page]
  end

  def find_page_size
    @page_size = params[:page_size] || 50
  end

  def find_channel_ids!
    raise ActionController::ParameterMissing.new(:page) unless params[:channel_ids]
    @channel_ids = params[:channel_ids].split(",")
  end

  def find_trending
    if params[:trending] == "true" || params[:trending] == "false"
      @trending = params[:trending]
    end
  end

end
