require "feature_helper"

feature "User signs in" do

  before do
    User.create!(email: "example@email.com" , password: "password", password_confirmation: "password" , confirmed_at: Time.now)
  end

  scenario "with valid info" do
    sign_in_with "example@email.com", "password"
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with invalid email" do
    sign_in_with "exampl@email.com", "password"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "with invalid password" do
    sign_in_with "example@email.com", "paassword"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "then signs out" do
    sign_in_with "example@email.com", "password"
    expect(page).to have_content("Signed in successfully.")
    click_link "SIGNOUT"
    expect(page).to have_content("Signed out successfully.")
  end
end
