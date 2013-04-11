FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "David#{n}" }
    sequence(:email) { |n| "david#{n}@sweetness.com" }
    phone '415-361-6651'
    password 'password'
  end
end
