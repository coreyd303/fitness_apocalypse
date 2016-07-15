require "rails_helper"

describe BlogPostsController do
  before(:each) do
    @post1 = FactoryGirl.create(:blog_post)
    @post2 = FactoryGirl.create(:blog_post)
    @post3 = FactoryGirl.create(:blog_post)
  end

  it "GET #index" do
    get :index
    expect(response).to have_http_status(:success)
    expect(assigns(:blogs)).to include(@post1, @post2, @post3)
    expect(assigns(:blogs).count).to eq(3)
  end

  it "GET #show" do
    get :show, { id: @post1.to_param }
    expect(response).to have_http_status(:success)
    expect(assigns(:blog)).to eq(@post1)
  end
end