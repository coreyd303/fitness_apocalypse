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

class Profile < ActiveRecord::Base
  belongs_to :user

  HUNTING_METHODS = ["Rifle", "Archery", "Muzzleloader", "Spear"]

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :age, presence: true
end
