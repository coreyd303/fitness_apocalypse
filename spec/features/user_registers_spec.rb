require "feature_helper"

feature "User signs up" do
  scenario "with valid email and password" do
    sign_up_with "example@email.com", "password", "password"
    expect(page).to have_content ("A message with a confirmation link has been sent to your \
     email address. Please follow the link to activate your account.")

    user = User.last
    expect(user.email).to eq("example@email.com")
  end

  scenario "invalid email" do
    sign_up_with "", "password", "password"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "invalid password" do
    sign_up_with "example@email.com", "", ""
    expect(page).to have_content("Password can't be blank")
  end

  scenario "non-matching password confirmation" do
    sign_up_with "example@email.com", "password", ""
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end