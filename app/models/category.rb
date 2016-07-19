class Category < ApplicationRecord
  has_many :videos
  validates :name, length: { minimum: 5 },
            presence: true
end
