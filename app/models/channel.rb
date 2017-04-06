class Channel < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validate :youtube_id_is_valid_on_youtube

  translates :name
  globalize_accessors

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