class Category < ApplicationRecord
  has_many :videos, dependent: :destroy
  
  validates :name, length: { minimum: 3 }, presence: true
  
  def videos_count
    videos.count
  end
end
