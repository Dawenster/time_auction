# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    time 1
    user_id 1
    auction_id 1
    charity_id 1
  end
end
