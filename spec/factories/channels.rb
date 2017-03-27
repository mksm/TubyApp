FactoryGirl.define do
  factory :channel do
    sequence(:name) {|n| "Cannel#{n}" }
    sequence(:youtube_id) {|n| "youtubeid#{n}" }
  end
end
