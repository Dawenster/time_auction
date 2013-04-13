# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'

FactoryGirl.define do
  factory :auction do
    start_date DateTime.now
    end_date DateTime.now + 1.day
  deadline DateTime.now + 1.month
    title "MyString"
    description "MyText"
    category_id 1
  end
end
