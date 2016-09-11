require 'rails_helper'

RSpec.feature "Users can log out" do
  scenario "they can log out if they are logged in" do
    user = User.create(username: "Gandalf", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, Gandalf")

    click_link "Logout"

    expect(page).to_not have_content("Welcome, Gandalf")
  end
end
