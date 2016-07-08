FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "matt#{n}@futureworkshops.com" }
    password "London123"
  end
end
