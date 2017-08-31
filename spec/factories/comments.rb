FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    user
    movie
  end
end
