require "rails_helper"

RSpec.describe WodsController, type: :controller do
  before(:each) do
    @wod = FactoryGirl.create(:wod)
  end

  it "GET #show" do
    get :show, { id: @wod.id }
    expect(response).to have_http_status(:success)
    expect(assigns(:wod)).to eq(@wod)
  end
end
