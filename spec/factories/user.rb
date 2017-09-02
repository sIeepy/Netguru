FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    confirmed_at { Time.zone.now }
    password {Faker::Internet.password(8)}

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, rand(1..15), user: user
      end
    end
  end
end
