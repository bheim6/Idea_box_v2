require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }

  scenario "Admin users have a role of 1" do
    user = User.create(username: "penelope",
                     password: "boom",
                     role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to eq(true)
  end

  scenario "Default users have role of 0 or nil" do
    user = User.create(username: "sam",
                       password: "pass")

   expect(user.role).to eq("default")
   expect(user.admin?).to eq(false)                   
  end
end
