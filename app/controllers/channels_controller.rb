class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

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
    if @channel.save
      redirect_to channels_url, notice: 'Channel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /channels/1
  def update
    if @channel.update(channel_params)
      redirect_to channels_url, notice: 'Channel was successfully updated.'
    else
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
