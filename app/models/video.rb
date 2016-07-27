class Video < ApplicationRecord
  belongs_to :category
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true
  validates :category, presence: true
end
