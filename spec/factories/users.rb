FactoryGirl.define do
  factory :user do
    first { Faker::Name.first_name }
    last  { Faker::Name.last_name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "password"
  end

end
