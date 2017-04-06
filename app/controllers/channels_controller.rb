class ChannelsController < ApplicationController
  load_and_authorize_resource

  def create
    begin
    if @channel.save
      redirect_to channels_url, notice: 'Channel was successfully created.'
    else
      flash[:alert] = "There has been an error in saving proccess. Please try again."
      render :new
    end
    rescue Yt::Errors::NoItems => e
      flash[:alert] = "There is an error in the channel's youtube id. Please correct it before saving."
      render :new
    rescue => e
      flash[:alert] = "There has been an error in the saving proccess. Please try again."
      render :new
    end
  end

  def update
    begin
    if @channel.update(channel_params)
      redirect_to channels_url, notice: 'Channel was successfully updated.'
    else
      flash[:alert] = "There has been an error in the saving proccess. Please try again."
      render :edit
    end
    rescue Yt::Errors::NoItems => e
      flash[:alert] = "There is an error in the channel's youtube id. Please correct it before saving."
      render :edit
    rescue => e
      flash[:alert] = "There has been an error in the saving proccess. Please try again."
      render :edit
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private
  def channel_params
    params.require(:channel).permit(:name_en, :name_ar, :youtube_id)
  end
end
