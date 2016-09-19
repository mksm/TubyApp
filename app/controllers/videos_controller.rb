class VideosController < ApplicationController
  load_and_authorize_resource

  def create
    @video.save ? redirect_to(videos_path, notice: 'Video was successfully created.') : render(:new)
  end

  def update
    @video.update(video_params) ? redirect_to(videos_path, notice: 'Video was successfully updated.') : render(:edit)
  end

  def destroy
    @video.destroy
    redirect_to videos_path, notice: 'Video was successfully deleted.'
  end
  
  def upload_csv
    if request.post?
      csv_text = params[:csv_file].read
      @videos = Video.import_csv(csv_text)
      render :multiple_new    
    end
  end
  
  def create_multiple
    @videos = []
    params["videos"].each_pair { |i, v| @videos << Video.new(multiple_video_params(v)) }
    
    invalid_count = 0
    ActiveRecord::Base.transaction do
      @videos.each{|v| v.save }
      invalid_count = @videos.count {|v| v.new_record?}
      raise ActiveRecord::Rollback if invalid_count > 0
    end
    
    if invalid_count > 0
      flash[:alert] = "Please correct #{invalid_count} errors before saving."
      render :multiple_new 
    else
      redirect_to(videos_url, notice: "#{@videos.count} videos were successfully created.")      
    end
  end

  private
    def video_params
      params.require(:video).permit(:name_en, :name_ar, :youtube_id,:category_id)
    end
    
    def multiple_video_params(video_params)
      video_params.permit(:name, :youtube_id, :category_id)
    end
end
