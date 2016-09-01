require 'csv'    

class Video < ApplicationRecord
  belongs_to :category
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :category, presence: true
  
  def self.import_csv(csv_text)
    videos = []
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      videos << Video.new(row.to_hash)
    end
    videos
  end
end
