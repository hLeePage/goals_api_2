FactoryGirl.define do
  factory :goal do
    body { Faker::Lorem.sentence(9) }
    completed false
    upvotes 1
    downvotes 0
    user_id 67
  end

end
