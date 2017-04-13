class Channel < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validate :youtube_id_is_valid_on_youtube

  translates :name
  globalize_accessors

  def update_videos_in_channel
    add_videos_to_channel
    delete_videos_from_channel
  end
  def add_videos_to_channel
    get_only_new_videos.each do |video|
      new_video = Video.new(video)
      new_video.channel_id = id
      new_video.save
    end
  end
  def get_only_new_videos
    if videos.count == 0
      get_videos_from_yt
    else
      videos_in_origin = get_videos_from_yt
      new_ids = videos_in_origin.map {|x| x[:youtube_id]} - videos.map {|x| x.youtube_id}
      result = []
      videos_in_origin.each do |video_in_origin|
        if new_ids.include? video_in_origin[:youtube_id]
          result.push(video_in_origin)
        end
      end
      result
    end
  end
  def get_videos_from_yt
    yt_channel = Yt::Channel.new id: youtube_id
    result = []
    yt_channel.videos.each { |video| result.push({:name_en=>video.title, :youtube_id=>video.id}) }
    result
  end
  def delete_videos_from_channel
    get_videos_to_delete.each { |video_id| Video.find_by_youtube_id(video_id).destroy! } unless get_videos_to_delete.empty?
  end
  def get_videos_to_delete
    videos.map {|x| x.youtube_id} - get_videos_from_yt.map {|x| x[:youtube_id]}

  def videos_count
    videos.count
  end

  def channel_image_url
    return nil if videos.count == 0
    "http://img.youtube.com/vi/#{videos.first.youtube_id}/0.jpg"
  end

  private
  def youtube_id_is_valid_on_youtube
    return if Rails.env.test? || Rails.env.development?

    begin
      Yt::Channel.new(id: youtube_id).video_count
    rescue Yt::Errors::NoItems => e
      errors.add(:youtube_id, "can't be found")
    end
  end
end
