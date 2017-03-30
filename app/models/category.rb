class Category < ApplicationRecord

  validates :name, length: { minimum: 3 }, presence: true

  translates :name
  globalize_accessors

  def category_image_url
    return nil if videos.count == 0

    "http://img.youtube.com/vi/#{videos.first.youtube_id}/0.jpg"
  end
end
