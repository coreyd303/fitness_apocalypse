FactoryGirl.define do

  factory :profile do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    email Faker::Internet.email
    age Faker::Number.number(2)
    yearshunting Faker::Number.number(1)
    huntingstyle Faker::Number.between(0, 2)
    user_id Faker::Number.number(2)
  end
end