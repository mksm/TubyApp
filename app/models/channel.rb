class Channel < ApplicationRecord

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true

  before_create :validate_existence_of_yt_channel
  before_update :validate_existence_of_yt_channel

  translates :name
  globalize_accessors

  private
    def validate_existence_of_yt_channel
      yt_channel = Yt::Channel.new id: id
      yt_channel.video_count
    end
end
