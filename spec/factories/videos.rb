FactoryGirl.define do
  factory :video do
    sequence(:name) { |n| "Video#{n}" }
    sequence(:youtube_id) { |n| "youtubeid#{n}" }
    category
  end
end
