FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "David#{n}" }
    sequence(:email) { |n| "david#{n}@sweetness.com" }
    password 'password'
  end
end
