class Category < ApplicationRecord
  has_many :videos
  validates :name, length: { minimum: 3 },
            presence: true
end
