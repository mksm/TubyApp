class Channel < ApplicationRecord
  has_many :videos, dependent: :destroy
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates_with YoutubeChannelValidator

  translates :name
  globalize_accessors

  def videos_count
    videos.count
  end

end
