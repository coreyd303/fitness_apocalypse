FactoryGirl.define do

  factory :profile do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    age Faker::Number.number(2)
    yearshunting Faker::Number.number(1)
    huntingstyle User::HUNTER_CONSTANTS.sample
    user_id Faker::Number.number(2)
  end
end