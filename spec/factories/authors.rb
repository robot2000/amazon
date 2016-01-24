FactoryGirl.define do
  factory :author do
    name { Faker::Book.author }
    biography { Faker::Lorem.paragraph }
  end
end
