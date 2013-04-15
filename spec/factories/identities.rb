# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    provider "MyString"
    uid 1
    oauth_token "MyString"
    oauth_expires_at "2013-04-15 12:25:05"
    name "MyString"
    username "MyString"
    email "MyString"
    image "MyString"
  end
end
