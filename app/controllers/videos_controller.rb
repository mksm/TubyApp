class VideosController < ApplicationController
  load_and_authorize_resource

  def create
    @video.save ? redirect_to(@video, notice: 'Video was successfully created.') : render(:new)
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end
  
  def upload_csv
    csv_text = params[:csv_file].read
    @videos = Video.import_csv(csv_text)
  end

  private
    def video_params
      params.require(:video).permit(:name, :youtube_id,:category_id)
    end
end
