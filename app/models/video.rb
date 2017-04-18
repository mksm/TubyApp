class Video < ApplicationRecord
  belongs_to :channel

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :channel, presence: true

  scope :trending, -> { where("videos.created_at >= ?", Time.now-7.days) }

  translates :name
  globalize_accessors
end
