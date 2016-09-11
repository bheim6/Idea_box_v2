class AddCategoryToIdea < ActiveRecord::Migration[5.0]
  def change
    add_reference :ideas, :category, index: true, foreign_key: true
  end
end
