FactoryGirl.define do
  factory :charity do
    name Faker::Name.name
    description Faker::Lorem.paragraph
  end
end
