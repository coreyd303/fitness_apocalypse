require 'rails_helper'


describe Admin::BlogPostsController do
    before(:each) do
      @user = FactoryGirl.create(:user)
      user.add_role(:admin)
      @post1 = FactoryGirl.create(:blog_post, title: "blog1", user_id: @user.id)
      @post2 = FactoryGirl.create(:blog_post, title: "blog2", user_id: @user.id)
      @post3 = FactoryGirl.create(:blog_post, title: "blog3", user_id: @user.id)
      sign_in @user
    end

  describe "#authorize_admin" do
    it "redirects non admin users to the root of the site" do
      get :index
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "redirects nil users to the root of the site" do
      @user = nil
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
    expect(assigns(:blog)).to include(@post1, @post2, @post3)
    expect(assigns(:blog).count).to eq(3)
  end

  it "GET #new" do
    get :new
    expect(response).to have_http_status(:success)
    expect(assigns(:blog)).to be_a_new(BlogPost)
  end

  it "GET #edit" do
    get :edit, { id: @post1.to_param }
    expect(response).to have_http_status(:success)
    expect(assigns(:blog)).to eq(@post1)
  end

  describe "POST #create" do
    let(:valid_attributes) do
      { title:  "Blog oh blog",
        summary:  "Basically it's basic",
        user_id: @user.id,
        body: "Hey boooooooody!" }
    end

    let(:invalid_attributes) do
      { title: "",
        summary:  "",
        user_id: ,
        body: "" }
    end

    context "with valid params" do
      it "creates a new blog post" do
        expect do
          post :create, { blog_post: valid_attributes }
        end.to change(Course, :count).by(1)
      end

      it "assigns newly created course as @course" do
        post :create, { blog_post: valid_attributes }
        expect(assigns(:course)).to be_a_new(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirect_to edit view after create" do
        post :create, { blog_post: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(edit_admin_blog_post_path(BlogPost.find_by_title(valid_attributes[:title])))
      end
    end

    context "with invalid params" do
      it "assigns newly created / unsaved course as @course" do
        post :create, { blog_post: invalid_attributes }
        expect(assigns(:course)).to be_a_new(Course)
        expect(assigns(:course)).to_no be_persisted
      end

      it "re-renders the new template" do
        post(:create), { blog_post: invalid_attributes }
        expect(response).to render_tempate("new")
      end
    end

    describe "PATCH #update" do
      context "with valid_attributes" do
        it "updates a blog post" do
          put :update, { id :@post1.to_param, blog_post: @post1.attributes }
          expect(response).to redirect_to(edit_admin_course_path(@post1))
        end
      end
    end
  end
end



#   describe "#authorize_admin" do
#     it "redirects non admin users to the root of the site" do
#       get :index
#       expect(response).to have_http_status(:redirect)
#       expect(response).to redirect_to(root_path)
#     end

#     it "redirects nil users to the root of the site" do
#       @user = nil
#       get :index
#       expect(response).to have_http_status(:redirect)
#       expect(response).to redirect_to(root_path)
#     end

#     it "allows admin users" do
#       @user.add_role(:admin)
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "get#pages_index" do
#     before(:each) do
#       @user.add_role(:admin)
#       @page1 = FactoryGirl.create(:cms_page, title: "Page 1")
#       @page2 = FactoryGirl.create(:cms_page, title: "Page 2")
#       @page3 = FactoryGirl.create(:cms_page, title: "Page 3")
#     end

#     it "assigns all cms_pages to @cms_pages" do
#       get :pages_index
#       expect(response).to have_http_status(:success)
#       expect(assigns(:cms_pages)).to include(@page1, @page2, @page3)
#       expect(assigns(:cms_pages).count).to eq(3)
#     end
#   end

#   describe "get#users_index" do
#     before(:each) do
#       @user.add_role(:admin)
#       @user1 = FactoryGirl.create(:user, email: "one@example.com")
#       @user2 = FactoryGirl.create(:user, email: "two@example.com")
#       @user3 = FactoryGirl.create(:user, email: "three@example.com")
#       @user1.add_role(:user, @org)
#       @user2.add_role(:user, @org)
#       @user3.add_role(:user, @org)
#     end

#     it "assigns all users as @users" do
#       get :users_index
#       expect(response).to have_http_status(:success)
#       expect(assigns(:users)).to include(@user, @user1, @user2, @user3)
#       expect(assigns(:users).count).to eq(4)
#     end

#     it "assigns all users as @users with an empty params" do
#       get :users_index, {}
#       expect(assigns(:users)).to include(@user, @user1, @user2, @user3)
#     end

#     it "assigns search results to @users" do
#       get :users_index, { search: "two" }
#       expect(assigns(:users)).to eq([@user2])
#     end
#   end

#   describe "put#admin_dashboard_manually_confirm_user" do
#     before(:each) do
#       @user.add_role(:admin)
#       @user1 = FactoryGirl.create(:user, email: "one@example.com", confirmed_at: nil)
#     end

#     it "should manually confirm user" do
#       expect(@user1.confirmed?).to be false
#       put :manually_confirm_user, { user_id: @user1.id }

#       @user2 = User.find(@user1.id)
#       expect(@user2.confirmed?).to be true
#     end
#   end
# end