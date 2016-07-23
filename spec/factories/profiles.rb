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

    firstname "Billy"
    lastname "Jean"
    age 37
    yearshunting 8
    huntingstyle "Spear"

  end
end
