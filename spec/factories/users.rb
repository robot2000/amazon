FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end

end
