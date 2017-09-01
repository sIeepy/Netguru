FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    confirmed_at { Time.zone.now }
    password {Faker::Internet.password(8)}
  end
end
