require 'rails_helper'

RSpec.feature "User edits an idea" do
  scenario "they edit an existing idea" do
    idea = Idea.create(name: "Sliced Bread")
    new_name = "The Wheel"

    visit '/ideas'
    click_on "#{idea.name}"
    click_on "Edit Idea"
    fill_in "idea_name", with: new_name
    click_on "Update Idea"

    expect(page).to have_content(new_name)
    expect(page).to_not have_content(idea.name)
  end
end
