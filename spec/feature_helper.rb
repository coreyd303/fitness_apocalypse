require "rails_helper"
require "capybara/rails"
require "capybara/rspec"

def sign_up_with(email, password, confirm_password)
  visit new_user_registration_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: confirm_password
  click_button "Sign up"
end

def sign_in_with(email, password)
  visit user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Log in"
end

def log_out
  click_link "SignOut"
end