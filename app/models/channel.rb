require 'csv'

class Channel < ApplicationRecord
  include YoutubeSyncable

  has_many :videos, dependent: :destroy
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validate :youtube_id_is_valid_on_youtube

  translates :name
  globalize_accessors

  def self.import_csv(csv_text)
    csv = CSV.parse(csv_text, :headers => true)
    channels = []
    csv.each do |unstriped_row|
      row = {}
      unstriped_row.each{|k, v| row[k.strip] = v.strip}
      channel = Channel.create(row.to_hash)
      
      unless Rails.env.test?
        yt_channel = Yt::Channel.new(id: channel.youtube_id)
        if yt_channel.present? && yt_channel.thumbnail_url.present?
          channel.icon = yt_channel.thumbnail_url
          channel.save!
        end
      end
      
      channels << channel
    end
    channels
  end

  def update_videos
    add_videos
    delete_videos_missing_from_yt
  end
  
  def add_videos
    new_videos.each do |video|
      new_video = Video.new(video)
      new_video.channel_id = id
      new_video.save
    end
  end
  
  def new_videos
    if videos.count == 0
      yt_videos
    else
      videos_in_origin = yt_videos
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
  
  def videos_count
    videos.count
  end
  
  def update_icon
    self.icon = yt_icon
  end
end
