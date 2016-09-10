require 'rails_helper'

RSpec.feature "User makes a new idea" do
  scenario "they visit the page for the newly created idea" do
    idea_name = "A Jump to Conclusions Mat"

    visit '/ideas'
    click_on "New Idea"
    fill_in "idea_name", with: idea_name
    click_on "Create Idea"

    expect(page).to have_content(idea_name)
  end

  scenario "they can see idea names and navigate to them from index" do
    idea = Idea.create(name: "Sliced Bread")

    visit '/ideas'

    expect(page).to have_content(idea.name)
  end

  context "invalid data" do
    scenario "they create an idea with a blank name" do

      visit '/ideas'
      click_on "New Idea"
      click_on "Create Idea"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
