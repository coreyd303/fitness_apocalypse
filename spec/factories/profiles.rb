# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  firstname    :string
#  lastname     :string
#  age          :integer
#  yearshunting :integer
#  huntingstyle :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

FactoryGirl.define do

  factory :profile do

    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    age Faker::Number.number(2)
    yearshunting Faker::Number.number(1)
    huntingstyle Profile::HUNTING_METHODS.sample

  end
end
