require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to have_many(:idea_images) }
  it { is_expected.to have_many(:images).through(:idea_images) }
end
