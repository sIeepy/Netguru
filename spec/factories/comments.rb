FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    user
    movie
  end

  factory :comment_invalid, parent: :comment do
    text nil
  end
end
