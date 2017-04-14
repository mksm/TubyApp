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

  private
    def video_params
      params.require(:video).permit(:name_en, :name_ar, :youtube_id, :channel_id, :hidden)
    end

    def multiple_video_params(video_params)
      video_params.permit(:name, :youtube_id, :channel_id)
    end
end
