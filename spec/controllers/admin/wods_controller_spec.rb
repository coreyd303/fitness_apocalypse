require "rails_helper"

describe Admin::WodsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.add_role(:admin)
    @wod1 = FactoryGirl.create(:wod, title: "Wod 1")
    @wod2 = FactoryGirl.create(:wod, title: "Wod 2")
    @wod3 = FactoryGirl.create(:wod, title: "Wod 3")

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
    expect(assigns(:wods)).to include(@wod1, @wod2, @wod3)
    expect(assigns(:wods).count).to eq(3)
  end

  it "GET #new" do
    get :new
    expect(response).to have_http_status(:success)
    expect(assigns(:wod)).to be_a_new(Wod)
  end

  it "GET #edit" do
    get :edit, { id: @wod1.to_param }
    expect(response).to have_http_status(:success)
    expect(assigns(:wod)).to eq(@wod1)
  end

  describe "POST #create" do
    let(:valid_attributes) do
      { title:  "Look at my WOD",
        duration: "30mins",
        workout_type: "MetCon",
        workout: "GO DO THINGS NOW!",
        workout_date: "7/7/07",
        pub_status: "P" }
    end

    let(:invalid_attributes) do
      { title:  "",
        duration: "",
        workout_type: "",
        workout: "",
        workout_date: "" }
    end

    context "with valid params" do
      it "creates a new wod" do
        expect do
          post :create, { wod: valid_attributes }
        end.to change(Wod, :count).by(1)
      end

      it "assigns newly created course as @wod" do
        post :create, { wod: valid_attributes }
        expect(assigns(:wod)).to be_a(Wod)
        expect(assigns(:wod)).to be_persisted
      end

      it "redirect_to edit view after create" do
        post :create, { wod: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(edit_admin_wod_path(Wod.find_by_title(valid_attributes[:title])))
      end
    end

    context "with invalid params" do
      it "assigns newly created / unsaved wod as @wod" do
        post :create, { wod: invalid_attributes }
        expect(assigns(:wod)).to be_a_new(Wod)
        expect(assigns(:wod)).to_not be_persisted
      end

      it "re-renders the new template" do
        post :create, { wod: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid_attributes" do
      it "updates a wod" do
        put :update, { id: @wod1.to_param, wod: @wod1.attributes }
        expect(response).to redirect_to(edit_admin_wod_path(@wod1))
      end
    end
  end
end