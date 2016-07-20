require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before(:each) do
    @user_a = FactoryGirl.build(:user)
    @profile_a = FactoryGirl.build(:profile)
  end

  describe "GET show" do
    it "returns http success" do
      p @profile_a
      get :show, profile_id: @profile_a.id
      expect(response).to have_http_status(:success)
    end
  end
end
