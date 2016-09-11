require 'rails_helper'
 RSpec.feature "User makes a new idea" do

  before :each do
    Category.create(name: "Inventions")
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

  skip scenario "they visit the page for the newly created idea" do
    idea_name = "A Jump to Conclusions Mat"
    category_name = "Inventions"
    Category.create(name: "Random")


    visit '/ideas'
    click_on "New Idea"
    fill_in "idea_name", with: idea_name
    # select_from "idea_category_id", with: category_name
    select("#{category_name}", :from => 'idea_category_id')
    click_on "Create Idea"

    expect(page).to have_content(idea_name)
  end

  skip scenario "they can see idea names and navigate to them from index" do
    idea_name = "A Jump to Conclusions Mat"

    visit '/ideas'
    click_on "New Idea"
    fill_in "idea_name", with: idea_name
    click_on "Create Idea"

    visit '/ideas'

    expect(page).to have_content(idea_name)
  end

  context "invalid data" do
  skip  scenario "they create an idea with a blank name" do

      visit '/ideas'
      click_on "New Idea"
      click_on "Create Idea"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
