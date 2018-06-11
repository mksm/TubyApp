require 'faker'

FactoryGirl.define do
  factory :video do |f|
    f.name_en { Faker::Lorem.sentence }
    f.youtube_id { Faker::Internet.password(8,10) }

    channel
  end
end
