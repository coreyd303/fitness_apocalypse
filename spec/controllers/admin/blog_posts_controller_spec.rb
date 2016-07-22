require 'rails_helper'

describe Admin::BlogPostsController do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.add_role(:admin)
      @post1 = FactoryGirl.create(:blog_post, title: "blog1", user_id: @user.id)
      @post2 = FactoryGirl.create(:blog_post, title: "blog2", user_id: @user.id)
      @post3 = FactoryGirl.create(:blog_post, title: "blog3", user_id: @user.id)
      sign_in @user
    end

  describe "#authorize_admin" do
    it "redirects non admin users to the root of the site" do
      @user.roles = []
      get :index
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "redirects nil users to the root of the site" do
      sign_out @user
      get :index
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "allows admin users" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  it "GET #index" do
    get :index
    expect(response).to have_http_status(:success)
    expect(assigns(:blog_posts)).to include(@post1, @post2, @post3)
    expect(assigns(:blog_posts).count).to eq(3)
  end

  it "GET #new" do
    get :new
    expect(response).to have_http_status(:success)
    expect(assigns(:blog_post)).to be_a_new(BlogPost)
  end

  it "GET #edit" do
    get :edit, { id: @post1.to_param }
    expect(response).to have_http_status(:success)
    expect(assigns(:blog_post)).to eq(@post1)
  end

  describe "POST #create" do
    let(:valid_attributes) do
      { title:  "Blog oh blog",
        summary:  "Basically it's basic",
        user_id: @user.id,
        body: "Hey boooooooody!",
        pub_status: "P" }
    end

    let(:invalid_attributes) do
      { title: nil,
        summary:  nil,
        user_id: nil,
        body: "",
        pub_status: "" }
    end

    context "with valid params" do
      it "creates a new blog post" do
        expect do
          post :create, { blog_post: valid_attributes }
        end.to change(BlogPost, :count).by(1)
      end

      it "assigns newly created course as @blog_post" do
        post :create, { blog_post: valid_attributes }
        expect(assigns(:blog_post)).to be_a(BlogPost)
        expect(assigns(:blog_post)).to be_persisted
      end

      it "redirect_to edit view after create" do
        post :create, { blog_post: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(edit_admin_blog_post_path(BlogPost.find_by_title(valid_attributes[:title])))
      end
    end

    context "with invalid params" do
      it "assigns newly created / unsaved blog post as @blog_post" do
        post :create, { blog_post: invalid_attributes }
        expect(assigns(:blog_post)).to be_a_new(BlogPost)
        expect(assigns(:blog_post)).to_not be_persisted
      end

      it "re-renders the new template" do
        post :create, { blog_post: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid_attributes" do
      it "updates a blog post" do
        put :update, { id: @post1.to_param, blog_post: @post1.attributes }
        expect(response).to redirect_to(edit_admin_blog_post_path(@post1))
      end
    end
  end
end
