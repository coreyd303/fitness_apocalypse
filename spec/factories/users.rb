FactoryGirl.define do
  pw = Faker::Internet.password(8)

   factory :user do
    email Faker::Internet.email
    password pw
    password_confirmation pw
    confirmed_at "2016-06-25 15:26:01"
  end
end