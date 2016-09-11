class CreateIdeaImages < ActiveRecord::Migration[5.0]
  def change
    create_table :idea_images do |t|
      t.references :idea, index: true, foreign_key: true
      t.references :image,index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
