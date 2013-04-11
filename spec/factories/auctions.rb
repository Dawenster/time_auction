# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    title "MyString"
    description "MyText"
    end_date "2013-04-11 11:28:22"
    category_id 1
    winner_id 1
    deadline "2013-04-11 11:28:22"
  end
end
