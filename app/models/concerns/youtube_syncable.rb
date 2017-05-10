module YoutubeSyncable
  extend ActiveSupport::Concern

  def yt_channel(youtube_id)
    return if Rails.env.test?
    Yt::Channel.new(id: youtube_id)
  end
  def channel_image_url
    return nil if videos.count == 0
    "http://img.youtube.com/vi/#{videos.first.youtube_id}/0.jpg"
  end

  private
  def youtube_id_is_valid_on_youtube
    return if Rails.env.test?
    begin
      yt_channel(youtube_id).title
    rescue Yt::Errors::NoItems => e
      errors.add(:youtube_id, "can't be found")
    end
  end
  def yt_videos
    result = []
    yt_channel(youtube_id).videos.each { |video| result.push({:name_en=>video.title, :youtube_id=>video.id}) }
    result
  end
  def videos_missing_from_yt
    videos.map {|x| x.youtube_id} - yt_videos.map {|x| x[:youtube_id]}
  end
  def delete_videos_missing_from_yt
    videos_missing_from_yt.each { |video_id| Video.find_by_youtube_id(video_id).destroy! } unless videos_missing_from_yt.empty?
  end
  def yt_icon
    if yt_channel(youtube_id).present? and yt_channel(youtube_id).thumbnail_url.present?
      yt_channel(youtube_id).thumbnail_url
    end
  end
end
