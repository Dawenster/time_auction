FactoryGirl.define do
  factory :charities do
    name Faker::Name.name
    description Faker::Lorem.paragraph
  end
end
