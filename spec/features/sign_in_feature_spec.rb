require 'rails_helper'
include Rails.application.routes.url_helpers

def new_user_session_path
  '/sessions/new'
end

feature "Sign in" do
  scenario "successfully signs in with valid credentials" do
    visit new_user_session_path

    fill_in "Email", with: "rick@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign In"

    expect(page).to have_content("Signed in successfully")
    expect(current_path).to eq(root_path)
  end

  scenario "displays error messages for invalid credentials" do
    visit new_user_session_path

    fill_in "Email", with: "invalid@email.com"
    fill_in "Password", with: "wrongpassword"

    click_button "Sign In"

    expect(page).to have_content("Invalid email or password")
    expect(current_path).to eq(new_user_session_path)
  end
end
