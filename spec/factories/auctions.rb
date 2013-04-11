# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'

FactoryGirl.define do
  factory :auction do
    title "MyString"
    description "MyText"
    end_date DateTime.now
    category_id 1
    winner_id 1
    deadline DateTime.now + 30
  end
end
