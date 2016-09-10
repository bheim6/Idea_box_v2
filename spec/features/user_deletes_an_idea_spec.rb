require 'rails_helper'

RSpec.feature "User can delete an idea" do
  scenario "they can delete an existing idea" do
    idea = Idea.create(name: "Sliced Bread")

    visit '/ideas'
    click_on "#{idea.name}"
    click_on "Delete Idea"

    expect(page).to have_content("All Ideas")
    expect(page).to_not have_content(idea.name)
  end
end
