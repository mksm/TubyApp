require 'faker'

FactoryGirl.define do
  factory :video do |f|
    f.name { Faker::Lorem.sentence }
    f.youtube_id { Faker::Internet.password(5,10) }
    channel
  end
end
