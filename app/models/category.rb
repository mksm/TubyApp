class Category < ApplicationRecord
  has_many :videos, dependent: :destroy
  
  validates :name, length: { minimum: 3 }, presence: true
end
