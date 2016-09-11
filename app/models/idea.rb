class Idea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :user
  belongs_to :category
end
