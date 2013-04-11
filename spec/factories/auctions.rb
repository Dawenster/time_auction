# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    title "MyString"
    description "MyText"
    end_date DateTime.now + 14
    category_id 1
    winner_id 1
  end
end
