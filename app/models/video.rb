require 'csv'    

class Video < ApplicationRecord
  belongs_to :category
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :category, presence: true
  
  def self.import_csv(csv_text)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Video.create!(row.to_hash)
    end
  end
end
