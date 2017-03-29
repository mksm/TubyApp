class YoutubeChannelValidator < ActiveModel::Validator
  def validate(record)
    return true if Rails.env.test?
    yt_channel = Yt::Channel.new id: record.id
    yt_channel.video_count
  end
end

class Channel < ApplicationRecord

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates_with YoutubeChannelValidator

  translates :name
  globalize_accessors

end
