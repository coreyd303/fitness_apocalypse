# == Schema Information
#
# Table name: wods
#
#  id           :integer          not null, primary key
#  duration     :string
#  workout_type :string
#  workout      :text
#  created_at   :datetime
#  updated_at   :datetime
#  title        :string
#  workout_date :string
#  pub_status   :string
#  start_time   :datetime
#

require "rails_helper"

describe Wod do

  context "verify validations" do

    before(:each) do
      @wod = FactoryGirl.create(:wod)
    end

    it "is initially valid" do
      expect(@wod).to be_valid
    end

    xit "can only have listed statuses" do
      allowed_statuses = %w(P D A)
      allowed_statuses.each do |status|
        @wod.pub_status = status
        expect(@wod).to be_valid
      end
    end

    it "should require a valid attributes" do
      @wod.title = ""
      expect(@wod).to_not be_valid

      @wod.duration = ""
      expect(@wod).to_not be_valid

      @wod.workout_type = ""
      expect(@wod).to_not be_valid

      @wod.workout_date = ""
      expect(@wod).to_not be_valid

      @wod.workout = ""
      expect(@wod).to_not be_valid

      @wod.pub_status = ""
      expect(@wod).to_not be_valid
    end
  end

  it "convert workout_date to start_time" do
    wod = Wod.create( title: "A wod",
                      duration: "1min",
                      workout_type: "Strength",
                      workout: "Do things",
                      workout_date: "07/07/2007",
                      pub_status: "P" )

    expect(wod.start_time).to eq(nil)
    wod.convert_to_start_time
    expect(wod.start_time).to eq("2007-07-07".to_date)
  end
end
