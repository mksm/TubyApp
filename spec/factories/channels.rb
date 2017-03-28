FactoryGirl.define do
  factory :channel do
    sequence(:name_en) {|n| "Cannel#{n}" }
    sequence(:name_ar) {|n| "#{n}اسم" }
    sequence(:youtube_id) {|n| "youtubeid#{n}" }
  end
end
