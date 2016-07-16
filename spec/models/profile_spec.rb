require 'rails_helper'

RSpec.describe Profile, type: :model do

  before(:each) do
    @profile_a = FactoryGirl.build(:profile)
    @profile_b = FactoryGirl.build(:profile, user_id: nil)
  end

  describe "testing associations" do
    it "is valid with user" do
      expect(@profile_a).to be_valid
    p @profile_b
    end

    # it "is not_valid when missing user" do #doing with model validators, is this correct?
    #   @profile_b = FactoryGirl.build(:profile, user_id: "")
    #   expect(@profile_b).to_not be_valid
    # end
  end

  describe "testing attributes" do
    it "has firstname attribute" do
      expect(@profile_a).to have_attribute(:firstname)
    end

    it "fails with no firstname" do
      @profile_a.firstname = ""
      expect(@profile_a).to_not be_valid
    end

    it "has lastname attribute" do
      expect(@profile_a).to have_attribute(:lastname)
    end

    it "fails with no lastname" do
      @profile_a.lastname = ""
      expect(@profile_a).to_not be_valid
    end

    it "has age attribute" do
      expect(@profile_a).to have_attribute(:age)
    end

    it "fails with no age" do
      @profile_a.age = ""
      expect(@profile_a).to_not be_valid
    end

    # need to confirm CONSTANTS before this spec will work
    # it "has huntingstyle attribute" do
    #   expect(@profile_a).to have_attribute(:huntingstyle)
    # end

    it "has yearshunting attribute" do
      expect(@profile_a).to have_attribute(:yearshunting)
    end
  end
end
