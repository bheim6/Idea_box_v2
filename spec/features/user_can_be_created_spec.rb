require 'rails_helper'

RSpec.feature "User can be created" do
  scenario "they can make a new user" do
    visit new_user_path

    fill_in "Username", with: "Gandalf"
    fill_in "Password", with: "Istari"
    click_button "Create Account"

    expect(page).to have_content("Welcome, Gandalf")
  end
end
