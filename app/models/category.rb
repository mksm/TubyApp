class Category < ApplicationRecord
  has_many :videos, dependent: :destroy
  
  validates :name, length: { minimum: 3 }, presence: true
  
  def videos_count
    videos.count
  end
  
  def category_image_url
    return nil if videos.count == 0
    
    "http://img.youtube.com/vi/#{videos.first.youtube_id}/0.jpg"
  end
end
