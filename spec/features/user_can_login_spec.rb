require 'rails_helper'

RSpec.feature "User can log in" do
  scenario "they can login if already registered account" do
    user = User.create(username: "Gandalf", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, Gandalf")
  end
end
