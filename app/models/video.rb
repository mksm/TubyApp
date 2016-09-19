require 'csv'    

class Video < ApplicationRecord
  belongs_to :category
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :category, presence: true
  
  translates :name
  globalize_accessors
  
  def self.import_csv(csv_text)
    videos = []
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |unstriped_row|
      row = {}
      unstriped_row.each{|k, v| row[k.strip] = v.strip}
      videos << Video.new(row.to_hash)
    end
    videos
  end
end
