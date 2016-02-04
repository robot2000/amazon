FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price + 0.01 }
    qty { Faker::Number.number(2).to_i }
  end
end
