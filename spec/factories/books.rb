FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    # price { Faker::Number.decimal(2) }
    price { Faker::Number.decimal(2) }
    in_stock { Faker::Number.number(2) }
  end
end
