FactoryGirl.define do
  factory :order do
    total_price { Faker::Commerce.price }
    completed_date Faker::Date.forward(20)
    state "In progress"
    user
    credit_card
  end

end
