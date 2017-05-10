require 'faker'

FactoryGirl.define do
  factory :channel do |f|
    f.name_en { Faker::Lorem.sentence }
    f.youtube_id { Faker::Internet.password(8,10) }
    f.icon {"https://yt3.ggpht.com/#{Faker::Internet.password(8,10)}/#{Faker::Lorem.word}.jpg"}
  end
end
