FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "abcd1234"
    confirmed_at Time.zone.now.to_s
    # profile
  end
end
