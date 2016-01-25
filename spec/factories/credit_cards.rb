FactoryGirl.define do
  factory :credit_card do
    number { Faker::Business.credit_card_number }
    cvv { Faker::Number.number(3) }
    expiration_month { Faker::Number.between(1, 12) }
    expiration_year { Faker::Number.between(2017, 2027)}
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    customer
  end
end
