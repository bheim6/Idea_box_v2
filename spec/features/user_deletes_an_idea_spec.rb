require 'rails_helper'

RSpec.feature "User can delete an idea" do
  before :each do
    user = User.create(username: "Gandalf", password: "password", password_confirmation: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Login"
  end

  after :each do
    DatabaseCleaner.clean
  end

  skip scenario "they can delete an existing idea" do
    idea_name = "A Jump to Conclusions Mat"

    visit '/ideas'
    click_on "New Idea"
    fill_in "idea_name", with: idea_name
    click_on "Create Idea"

    visit '/ideas'
    click_on "#{idea_name}"
    click_on "Delete Idea"

    expect(page).to have_content("All Ideas")
    expect(page).to_not have_content(idea_name)
  end
end
