class Channel < ApplicationRecord

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true

  translates :name
  globalize_accessors
end
