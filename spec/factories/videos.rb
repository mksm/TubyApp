FactoryGirl.define do
  factory :video do
    name "Mickey Mouse"
    sequence(:youtube_id) {|n| "youtubeid#{n}" }
    category
  end
end
