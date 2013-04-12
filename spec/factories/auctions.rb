# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'

FactoryGirl.define do
  factory :auction do
    end_date DateTime.now
    deadline DateTime.now + 1.month
    title "MyString"
    description "MyText"
    category_id 1
    winner_id 1
  end
end
