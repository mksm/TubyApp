class ChannelsController < ApplicationController
  load_and_authorize_resource

  def create
    if @channel.save
      redirect_to channels_url, notice: 'Channel was successfully created.'
    else
      render_with_alert :new
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to channels_url, notice: 'Channel was successfully updated.'
    else
      render_with_alert :edit
    end
  end

  def update_videos_in_channel
    @channel.update_videos_in_channel
    redirect_to videos_url, notice: 'The videos list was successfully updated.'
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private
  def channel_params
    params.require(:channel).permit(:name_en, :name_ar, :youtube_id)
  end

  def render_with_alert(template)
    flash[:alert] = @channel.errors.full_messages.to_sentence
    render template
  end
end
