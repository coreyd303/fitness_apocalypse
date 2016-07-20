require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before(:each) do
    @user_a = FactoryGirl.create(:user)
    @profile_a = FactoryGirl.create(:profile, user_id: @user_a.id)
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @profile_a.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, id: @profile_a.id
      expect(response).to render_template :show
    end

    it "assigns @profile_a to @profile" do
      get :show, id: @profile_a.id
      expect(assigns(:profile)).to eq(@profile_a)
    end
  end

  describe "GET new" do
    it "returns http redirect" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @profile" do
      get :new
      expect(assigns(:profile)).not_to be_nil
    end
  end

  describe "PROFILE create" do
    it "increases the number of Profile by 1" do
      expect{post :create, profile: {firstname: "Willy", lastname: "Billy", age: 45}}.to change(Profile,:count).by(1)
    end

    it "assigns Profile.last to @profile" do
      post :create, profile: {firstname: "Willy", lastname: "Billy", age: 45}
      expect(assigns(:profile)).to eq Profile.last
    end

    it "redirects to profile on completion" do
      post :create, profile: {firstname: "Willy", lastname: "Billy", age: 45}
      expect(response).to redirect_to Profile.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: @profile_a.id
      expect(response).to have_http_status(:success)
    end

    it "renders the edit view" do
      get :edit, id: @profile_a.id
      expect(response).to render_template :edit
    end

    it "assigns Profile to be updated to @profile" do
      get :edit, id: @profile_a
      profile_instance = assigns(:profile)

      expect(profile_instance.id).to eq @profile_a.id
      expect(profile_instance.firstname).to eq @profile_a.firstname
      expect(profile_instance.lastname).to eq @profile_a.lastname
      expect(profile_instance.age).to eq @profile_a.age
    end
  end

  describe "PUT update" do
    it "updates profile wiht expected attributes" do
      new_firstname = "Bruce"
      new_lastname = "Feinstein"
      new_age = 44

      put :update, id: @profile_a.id, profile: {firstname: new_firstname, lastname: new_lastname, age: new_age}
      expect(response).to redirect_to @profile_a
    end
  end

  describe "delete DESTROY" do
    it "deletes the profile" do
      delete :destroy, id: @profile_a
      count = Profile.where({id: @profile_a.id}).size
      expect(count).to eq 0
    end
  end
end
