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

require 'rails_helper'

RSpec.describe Profile, type: :model do

  before(:each) do
    user = FactoryGirl.create(:user)
    @profile_a = FactoryGirl.build(:profile, user_id: user.id)
    @profile_b = FactoryGirl.build(:profile, user_id: nil)
  end

  describe "testing associations" do
    it "is valid with user" do
      expect(@profile_a).to be_valid
    end
  end

  describe "testing attributes" do
    it "has firstname attribute" do
      expect(@profile_a).to have_attribute(:firstname)
    end

    it "is valid when firstname exits" do
      @profile_a.firstname = "Billy"
      expect(@profile_a).to be_valid
    end

    it "fails with no firstname" do
      @profile_a.firstname = ""
      expect(@profile_a).to_not be_valid
    end

    it "has lastname attribute" do
      expect(@profile_a).to have_attribute(:lastname)
    end

    it "is valid when firstname exits" do
      @profile_a.lastname = "Bobby"
      expect(@profile_a).to be_valid
    end

    it "fails with no lastname" do
      @profile_a.lastname = ""
      expect(@profile_a).to_not be_valid
    end

    it "has age attribute" do
      expect(@profile_a).to have_attribute(:age)
    end

    it "is valid when age exits" do
      @profile_a.age = 31
      expect(@profile_a).to be_valid
    end

    it "fails with no age" do
      @profile_a.age = ""
      expect(@profile_a).to_not be_valid
    end

    it "has huntingstyle attribute" do
      expect(@profile_a).to have_attribute(:huntingstyle)
    end

    it "is valid when huntingstyle exits" do
      @profile_a.huntingstyle = "Spear"
      expect(@profile_a).to be_valid
    end

    it "has yearshunting attribute" do
      expect(@profile_a).to have_attribute(:yearshunting)
    end
  end
end
