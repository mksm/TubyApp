require 'faker'

FactoryGirl.define do
  factory :channel do |f|
    f.name_en { Faker::Lorem.sentence }
    f.youtube_id { Faker::Internet.domain_word }
  end
end
