require "feature_helper"

feature "User views daily wod on home page" do
  before(:each) do
    User.create!(email: "example@email.com" , password: "password", password_confirmation: "password" , confirmed_at: Time.now)
  end

  it "does not display a wod if user is not signed in" do
    wod = FactoryGirl.create(:wod)
    visit root_path
    expect(page).to_not have_content(@wod.title)
  end

  it "displays rest message if there is no wod for the day" do
    sign_in_with "example@email.com", "password"
    visit root_path
    expect(page).to have_content("Rest and Recover today, if you're tired, relax, otherwise you can do a light recovery walk, strech, or ride.")
  end

  it "displays wod if there is one for the day" do
    wod = FactoryGirl.create(:wod, workout_date: Time.zone.now.strftime("%m/%d/%Y"))
    sign_in_with "example@email.com", "password"
    visit root_path
    expect(page).to have_content(wod.title)
  end
end
