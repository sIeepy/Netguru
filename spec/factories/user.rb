FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    confirmed_at { Time.zone.now }
    password {Faker::Internet.password(8)}

    factory :user_with_comments do
      transient do
        comments_count rand(1..15)
      end

      after(:create) do |user, evaluator|
        create_list :comment, evaluator.comments_count, user: user
      end
    end
  end
end
