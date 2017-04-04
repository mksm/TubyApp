class YoutubeChannelValidator < ActiveModel::Validator

  def validate(record)
    if Rails.env.test? || Rails.env.development?
      return true
    end
    yt_channel = Yt::Channel.new id: record.youtube_id
    yt_channel.video_count
  end
end


class ChannelsController < ApplicationController
  load_and_authorize_resource
  before_action :set_channel, only: [:edit, :update, :destroy]

  # GET /channels
  def index
    @channels = Channel.all
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  def create
    @channel = Channel.new(channel_params)
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

  # PATCH/PUT /channels/1
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

  # DELETE /channels/1
  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name_en, :name_ar, :youtube_id)
    end
end
