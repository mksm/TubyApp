class Channel < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, length: { minimum: 3 }, presence: true
  validates :youtube_id, length: { minimum: 5 }, presence: true, uniqueness: true
  validate :youtube_id_is_valid_on_youtube

  translates :name
  globalize_accessors

  def self.import_csv(csv_text)
    channels = []
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |unstriped_row|
      row = {}
      unstriped_row.each{|k, v| row[k.strip] = v.strip}
      channels << Channel.new(row.to_hash)
    end
    channels
  end

  private
  def youtube_id_is_valid_on_youtube
    return if Rails.env.test? || Rails.env.development?

    begin
      Yt::Channel.new(id: youtube_id).video_count
    rescue Yt::Errors::NoItems => e
      errors.add(:youtube_id, "can't be found")
    end
  end
end
