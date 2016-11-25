FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.sentence(2) }
    description { Faker::Lorem.paragraph }
    association :developer
  end
end
