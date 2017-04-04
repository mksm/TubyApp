require 'csv'

class Video < ApplicationRecord
  belongs_to :channel

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :channel, presence: true

  translates :name
  globalize_accessors
end
