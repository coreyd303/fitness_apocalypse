require 'rails_helper'

RSpec.describe Profile, type: :model do

  before(:each) do
    @profile_a = FactoryGirl.build(:profile)
  end

  describe "testing associations" do
    it "is valid with user" do
      expect(@profile_a).to be_valid
    end

    it "is not_valid when missing user" do #doing with model validators, is this correct?
      @profile_b = FactoryGirl.build(:profile, user_id: "")
      expect(@profile_b).to_not be_valid
    end
  end

  describe "testing attributes" do
    it "has firstname attribute" do
      expect(@profile_a).to have_attribute(:firstname)
    end

    it "fails with no firstname" do
      @profile_a.firstname = ""
      expect(@profile_a).to_not be_valid
    end

    it "fails with firstname too short" do
      @profile_a.firstname = "Ti"
      expect(@profile_a).to_not be_valid
    end

    it "has lastname attribute" do
      expect(@profile_a).to have_attribute(:lastname)
    end

    it "fails with no lastname" do
      @profile_a.lastname = ""
      expect(@profile_a).to_not be_valid
    end

    it "fails with lastname too short" do
      @profile_a.lastname = "It"
      expect(@profile_a).to_not be_valid
    end

    it "has email attribute" do
      expect(@profile_a).to have_attribute(:email)
    end

    it "fails with no email" do
      @profile_a.email = ""
      expect(@profile_a).to_not be_valid
    end

    it "fails when email doesnt contain @" do
      @profile_a.email = "bill.com"
      expect(@profile_a).to_not be_valid
    end

    it "has yearshungting attribute" do
      expect(@profile_a).to have_attribute(:yearshunting)
    end

    it "fails with no yearshunting entered" do
      @profile_a.yearshunting = ""
      expect(@profile_a).to_not be_valid
    end

    it "has huntingstyle attribute" do
      expect(@profile_a).to have_attribute(:huntingstyle)
    end

    it "fails with no huntingstyle entered" do
      @profile_a.huntingstyle = ""
      expect(@profile_a).to_not be_valid
    end
  end
end
