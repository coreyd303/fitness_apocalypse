require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before(:each) do
    @wod1 = FactoryGirl.create(:wod)
    @wod2 = FactoryGirl.create(:wod)
    @wod3 = FactoryGirl.create(:wod)
  end

  it "GET #index" do
    get :index
    expect(response).to have_http_status(:success)
    expect(assigns(:wods)).to include(@wod1, @wod2, @wod3)
    expect(assigns(:wods).count).to eq(3)
  end
end
