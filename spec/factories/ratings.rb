FactoryGirl.define do
  factory :rating do
    review { Faker::Lorem.sentence }
    value { Faker::Number.between(1, 10) }
  end
end
